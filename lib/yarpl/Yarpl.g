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
  MODEL_DECLARATION;
  MODEL_BODY;
  MODEL_BODY_DECLARATION;
  EXPRESSION;
  FIELD_ACCESSOR;
  FIELD_DECLARATION;
  FUNCTION_EXPRESSION;
  INITIAL_DECLARATION;
  INSTANCE_ACCESSOR;
  INTEGER;
  LIST;
  MEMBER_DECLARATION;
  HASONE;
  SET;
  START;
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
    : variableType type variableDeclaratorId ';' -> ^(FIELD_DECLARATION variableType type variableDeclaratorId)
    | 'hasOne' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^(HASONE IDENTIFIER variableDeclaratorId)
    ;

instanceAccessor
    : IDENTIFIER -> ^(INSTANCE_ACCESSOR IDENTIFIER)
    ;

fieldAccessor
    : IDENTIFIER '.' IDENTIFIER -> ^(FIELD_ACCESSOR IDENTIFIER IDENTIFIER)
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

constraintDeclaration
    : 'constraint' constraintBody -> ^(CONSTRAINT_DECLARATION constraintBody)
    ;

constraintBody
    : LBRACE expression RBRACE -> ^(CONSTRAINT_EXPRESSION expression)
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
    : primary
    | fieldAccessor
    | LPAREN expression /* recursion!!! */ RPAREN -> ^(EXPRESSION expression)
    ;

countExpression
    : instanceAccessor 'in' fieldAccessor -> ^(COUNT_IN instanceAccessor fieldAccessor)
    ;
    
sumExpression
    : expressionList
    ;

expressionList
    :   expression (',' expression)*
    ;

declaration
    : list -> list
    | set -> set
    | primary -> primary
    ;

declarationList
    : declaration (COMMA declaration)* -> ^(declaration)*
    ;

primaryList
    : primary (COMMA primary)* -> ^(primary)*
    ;

list
    : '[' declarationList ']' -> ^(LIST declarationList)
    ;

set : '{' primaryList '}' -> ^(SET primaryList)
    ;


primary
    : literal
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
	| IDENTIFIER
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