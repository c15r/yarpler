grammar Yarpl;

options {
  language=Ruby;
  output=AST;
}

tokens {
  ATTRIBUTE;
  CLASS_ACCESSOR;
  CLASS_DECLARATION;
  CONSTANT;
  CONSTRAINT_DECLARATION;
  CONSTRAINT_EXPRESSION;
  COUNT_EXPRESSION;
  EXPRESSION_LIST;
  MODEL_DECLARATION;
  MODEL_BODY;
  MODEL_BODY_DECLARATION;
  EXPRESSION;
  FIELD_ACCESSOR;
  FIELD_DECLARATION;
  FORALL;
  FUNCTION_EXPRESSION;
  HASONE;
  IN;
  INITIAL_DECLARATION;
  INSTANCE_ACCESSOR;
  INTEGER;
  LITERAL;
  MAXIMIZE;
  MEMBER_DECLARATION;
  MINIMIZE;
  REFERENCE;
  RELATION_DECLARATION;
  SATISFY;
  SET;
  SOLVE_DECLARATION;
  START;
  SUM;
  TYPE_DECLARATION;
  VARIABLE;
  VARIABLE_DECLARATOR;
  VARIABLE_DECLARATION;
}

start
    : program* -> ^(START program*)
                        ;

program
    : modelDeclaration -> modelDeclaration
    | initialDeclaration -> initialDeclaration
    | solveDeclaration -> solveDeclaration
	;

modelDeclaration
    : 'model' modelBody -> ^(MODEL_DECLARATION modelBody)
    ;

modelBody
    : '{' modelBodyDeclaration* '}' -> modelBodyDeclaration*
    ;

modelBodyDeclaration
    : typeDeclaration -> typeDeclaration
	;

initialDeclaration
    : 'initial' initialBody  -> ^(INITIAL_DECLARATION initialBody)
    ;

initialBody
    : '{' initialBodyDeclaration* '}' -> initialBodyDeclaration*
    ;

initialBodyDeclaration
    : localVariableDeclaration
    | constraintDeclaration
    | relationDeclaration
    ;

solveDeclaration
    : 'solve' '{' solveBodyDeclaration '}' -> ^(SOLVE_DECLARATION solveBodyDeclaration)
    ;

solveBodyDeclaration
    : 'satisfy' ';' -> SATISFY
    | 'minimize' expression ';' -> MINIMIZE ^(EXPRESSION expression)
    | 'maximize' expression ';' -> MAXIMIZE ^(EXPRESSION expression)
    ;

typeDeclaration
    : classDeclaration -> ^(CLASS_DECLARATION classDeclaration)
    ;

classDeclaration
    : 'class' IDENTIFIER '{' classBodyDeclaration* '}' -> ^(IDENTIFIER classBodyDeclaration*)
	;

classBodyDeclaration
    : memberDeclaration -> ^(memberDeclaration)
	;

memberDeclaration
    : fieldDeclaration ->  fieldDeclaration
    ;

fieldDeclaration
    : variableType primitiveType variableDeclaratorId ';' -> ^(FIELD_DECLARATION variableType primitiveType variableDeclaratorId)
    | variableType structType variableDeclaratorId ';' -> ^(REFERENCE variableType HASONE structType variableDeclaratorId)
    ;

fieldAccessor
    : IDENTIFIER ('.' IDENTIFIER)* -> ^(FIELD_ACCESSOR IDENTIFIER*)
    ;

classAccessor
    : IDENTIFIER '.' IDENTIFIER -> ^(CLASS_ACCESSOR IDENTIFIER IDENTIFIER)
    ;

variableDeclarators
    : variableDeclarator (',' variableDeclarator)*
    ;

variableDeclarator
    : variableDeclaratorId '=' variableInitializer -> ^(VARIABLE_DECLARATOR variableDeclaratorId variableInitializer)
    ;

variableDeclaratorId
    : IDENTIFIER
    ;

variableInitializer
    : 'new' creator -> creator
    ;

localVariableDeclaration
    : variableDeclarators ';' -> variableDeclarators
    ;

relationDeclaration
    : 'relation' LPAREN fieldAccessor ',' setDeclaration RPAREN ';' -> ^(RELATION_DECLARATION fieldAccessor setDeclaration)
    ;

constraintDeclaration
    : 'constraint' LBRACE constraintBody RBRACE -> ^(CONSTRAINT_DECLARATION constraintBody)
    ;

constraintBody
    : 'forAll' LPAREN forallSelector RPAREN LBRACE constraintBody RBRACE -> ^(FORALL forallSelector constraintBody)
    | expression -> ^(CONSTRAINT_EXPRESSION expression)
    ;

forallSelector
    : variableDeclaratorId 'in' fieldAccessor -> ^(IN variableDeclaratorId fieldAccessor)
    ;

expression
    : relationalExpression (('and'|'or') relationalExpression)*
    ;

relationalExpression
    : addingExpression ((EQUALS|NOT_EQUALS|GT|GTE|LT|LTE) addingExpression)*
    ;

addingExpression
    : multiplyingExpression ((PLUS|MINUS) multiplyingExpression)*
    ;

multiplyingExpression
    : signExpression ((TIMES|DIV|'mod') signExpression)*
    ;

signExpression
    : (PLUS|MINUS)* functionExpression
    ;

functionExpression
    : 'count' LPAREN countExpression RPAREN -> ^(FUNCTION_EXPRESSION countExpression)
    | 'sum' LPAREN sumExpression RPAREN -> ^(FUNCTION_EXPRESSION sumExpression)
    | primeExpression
    ;

primeExpression
    : literal -> ^(LITERAL literal)
    | fieldAccessor
    | LPAREN expression /* recursion!!! */ RPAREN -> ^(EXPRESSION expression)
    ;

countExpression
    : fieldAccessor 'in' fieldAccessor -> ^(COUNT_IN fieldAccessor fieldAccessor)
    ;
    
sumExpression
    : expressionList -> ^(SUM expressionList)
    ;

expressionList
    : expression (',' expression)* -> ^(EXPRESSION_LIST ^(EXPRESSION expression)*)
    ;

setDeclaration
    : set -> set
    | primary -> ^(SET primary)
    ;

declaration
    : set -> set
    | primary -> primary
    ;

primaryList
    : primary (COMMA primary)* -> ^(primary)*
    ;

set : '{' primaryList '}' -> ^(SET primaryList)
    ;


primary
    : literal
    | IDENTIFIER
	;

creator
    : structType '(' argumentList* ')' -> ^(VARIABLE_DECLARATION structType argumentList* )
    ;

argumentList
    : argument (',' argument)*
    ;


argument
     : IDENTIFIER '=' declaration -> ^(ATTRIBUTE IDENTIFIER declaration)
     ;


literal
	: RANGEINTEGERLITERAL
	| INTEGERLITERAL
	;

type
    : structType -> ^(structType)
    | primitiveType -> ^(primitiveType)
    ;

structType
    : IDENTIFIER
    ;

primitiveType
    : 'integer' -> ^(INTEGER)
    ;

variableType
    : 'var' -> ^(VARIABLE)
    | 'const' -> ^(CONSTANT)
    ;

// ///////////////////////////////////////////
//
// LEXER
//
// ///////////////////////////////////////////



// WHITESPACES AND COMMENTS

WS : (' ' | '\t' | '\r' | '\n') {skip();}
                        ;

COMMENT
    :	'#' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    ;


// IDENTIFIERS
IDENTIFIER : YARPL_LETTER YARPL_LETTERORDIGIT*
    	   ;

fragment
YARPL_LETTER : ALPHABET
			 | '_'
    		 | '$'
    		 ;

fragment
YARPL_LETTERORDIGIT : ALPHANUMERIC
    			    | '_'
    			    | '$'
    			    ;

fragment
DIGIT : '0'..'9'
	  ;

fragment
DIGITS : DIGIT (DIGITORUNDERSCORE* DIGIT)?
	   ;

fragment
NONZERODIGIT : '1'..'9'
			 ;

fragment
DIGITORUNDERSCORE : DIGIT
			      | '_'
			      ;

fragment
LOWERCASE		: 'a'..'z'
			;

fragment
UPPERCASE		: 'A'..'Z'
			;

fragment
ALPHABET		: LOWERCASE
			| UPPERCASE
			;

fragment
ALPHANUMERIC		: ALPHABET
			| DIGIT
    			;


RANGEINTEGERLITERAL	: DIGITS '..' DIGITS
                    ;

INTEGERLITERAL     : DIGITS
    			;

fragment
SIGN			: '+'
			| '-'
			;

// Separators

LPAREN          : '(';
RPAREN          : ')';
LBRACE          : '{';
RBRACE          : '}';
LBRACK          : '[';
RBRACK          : ']';
SEMI            : ';';
COMMA           : ',';
DOT             : '.';

// Operators

ASSIGN          : '=';
GT              : '>';
LT              : '<';
BANG            : '!';
QUESTION        : '?';
COLON           : ':';
EQUALS           : '==';
LTE              : '<=';
GTE              : '>=';
NOT_EQUALS        : '!=';
AND             : '&&';
OR              : '||';
INC             : '++';
DEC             : '--';
PLUS             : '+';
MINUS             : '-';
TIMES             : '*';
DIV             : '/';
MOD             : '%';

// FUNCTIONS
COUNT_IN    : 'count in';