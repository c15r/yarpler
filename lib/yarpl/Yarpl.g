grammar Yarpl;

options {
  language=Ruby;
  output=AST;
}

tokens {
  ABS_EXPRESSION;
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
  HASMANY;
  IN;
  INDEX_ACCESSOR;
  INITIAL_DECLARATION;
  INSTANCE_ACCESSOR;
  INTEGER;
  LITERAL;
  MAXIMIZE;
  MEMBER_DECLARATION;
  MINIMIZE;
  NOT_EXPRESSION;
  ORDER_ASC;
  ORDER_DESC;
  REFERENCE;
  RELATION_DECLARATION;
  SATISFY;
  SET;
  SOLVE_DECLARATION;
  START;
  SUM;
  SUM_VALUE;
  TYPE_DECLARATION;
  VARIABLE;
  VARIABLE_DECLARATOR;
  VARIABLE_DECLARATION;
  WHERE;
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
    | relationDeclaration
    ;

solveDeclaration
    : 'solve' solveBody -> ^(SOLVE_DECLARATION solveBody)
    ;

solveBody
    : '{' solveBodyDeclaration* '}' -> solveBodyDeclaration*
    ;

solveBodyDeclaration
    : constraintDeclaration
    | satisfyDeclaration
    | minimizeDeclaration
    | maximizeDeclaration
    ;

satisfyDeclaration
    : 'satisfy' ';' -> SATISFY
    ;

minimizeDeclaration
    : 'minimize' expression ';' -> ^(MINIMIZE ^(EXPRESSION expression))
    ;

maximizeDeclaration
    : 'maximize' expression ';' -> ^(MAXIMIZE ^(EXPRESSION expression))
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
    | variableType 'collection' structType variableDeclaratorId ';' -> ^(REFERENCE variableType HASMANY structType variableDeclaratorId)
    ;

fieldAccessor
    : IDENTIFIER ('.' IDENTIFIER)* -> ^(FIELD_ACCESSOR IDENTIFIER*)
    | IDENTIFIER '[' INTEGERLITERAL ']' ('.' IDENTIFIER)* -> ^(INDEX_ACCESSOR INTEGERLITERAL IDENTIFIER*)
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
    : 'forAll' LPAREN forallSelector RPAREN forallWhere? forallOrder?  LBRACE constraintBody RBRACE -> ^(FORALL forallSelector constraintBody forallWhere? forallOrder?)
    | expression -> ^(CONSTRAINT_EXPRESSION expression)
    ;

forallWhere
    : '.' 'where' LPAREN expression RPAREN -> ^(WHERE expression)
    ;

forallOrder
    : '.' 'order_desc' LPAREN fieldAccessor RPAREN -> ^(ORDER_DESC fieldAccessor)
    | '.' 'order_asc' LPAREN fieldAccessor RPAREN -> ^(ORDER_ASC fieldAccessor)
    ;


forallSelector
    : variableDeclaratorId 'in' fieldAccessor -> ^(IN variableDeclaratorId fieldAccessor)
    ;

expression
    : relationalExpression (('and'|'or') relationalExpression)*
    | 'not' LPAREN relationalExpression RPAREN -> ^(NOT_EXPRESSION relationalExpression)
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
    | 'abs' LPAREN primeExpression RPAREN -> ^(ABS_EXPRESSION primeExpression)
    | primeExpression ('in' primeExpression)*
    ;

primeExpression
    : literal -> ^(LITERAL literal)
    | fieldAccessor
    | LPAREN expression /* recursion!!! */ RPAREN -> ^(EXPRESSION expression)
    ;

countExpression
    : fieldAccessor 'in' fieldAccessor -> ^(COUNT_IN fieldAccessor fieldAccessor)
    | fieldAccessor -> ^(COUNT_IN fieldAccessor)
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
    		 ;

fragment
YARPL_LETTERORDIGIT : ALPHANUMERIC
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
PLUS             : '+';
MINUS             : '-';
TIMES             : '*';
DIV             : '/';
MOD             : '%';

// FUNCTIONS
COUNT_IN    : 'count in';