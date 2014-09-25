grammar Yarpl;

options {
  language=Ruby;
  output=AST;
}

tokens {
  ATTRIBUTE;
  CLASS_DECLARATION;
  CLASS_BODY;
  CLASS_BODY_DECLARATION;
  CONSTANT;
  DOMAIN_DECLARATION;
  DOMAIN_BODY;
  DOMAIN_BODY_DECLARATION;
  FIELD_DECLARATION;
  INITIAL_BODY;
  INITIAL_DECLARATION;
  INTEGER;
  MEMBER_DECLARATION;
  PROGRAM;
  SET;
  START;
  TYPE_DECLARATION;
  VARIABLE;
  VARIABLE_DECLARATOR;
  VARIABLE_DECLARATION;
  VARIABLE_TYPE;
}

start
    : program* -> ^(START program*)
                        ;

program
    : domainDeclaration -> domainDeclaration
    | initialDeclaration -> initialDeclaration
	;

domainDeclaration
    : 'domain' domainBody -> ^(DOMAIN_DECLARATION domainBody)
    ;

domainBody
    : '{' domainBodyDeclaration* '}' -> domainBodyDeclaration*
    ;

domainBodyDeclaration
    : typeDeclaration -> typeDeclaration
	;

initialDeclaration
    : 'initial' initialBody  -> ^(INITIAL_DECLARATION initialBody)
    ;

initialBody
    : '{' initialBodyDeclaration* '}' -> initialBodyDeclaration*
    ;

initialBodyDeclaration
    : statement
    ;

typeDeclaration
    : classDeclaration -> ^(CLASS_DECLARATION classDeclaration)
    ;

classDeclaration
    : 'class' IDENTIFIER classBody -> ^(IDENTIFIER classBody)
	;

classBody
    : '{' classBodyDeclaration* '}' -> classBodyDeclaration*
	;

classBodyDeclaration
    : memberDeclaration -> ^(memberDeclaration)
	;

memberDeclaration
    : fieldDeclaration ->  fieldDeclaration
    ;

fieldDeclaration
    : variableType type variableDeclaratorId ';' -> ^(FIELD_DECLARATION variableType type variableDeclaratorId)
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


statement
    : localVariableDeclaration
    | ';'
    ;


expression :
    relationalExpression (('and'|'or') relationalExpression)*
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
    : (PLUS|MINUS)* primeExpression
    ;

primeExpression
    : primary
    | LPAREN expression /* recursion!!! */ RPAREN
    ;

expressionList
    :   expression (',' expression)*
    ;

declaration
    : set -> set
    | primary -> primary
    ;

set
    : '[' setDeclaration ']' -> ^(SET setDeclaration)
    ;

setDeclaration
    : declaration (COMMA declaration)* -> ^(declaration)*
    ;

primary
    : literal
	;

creator
    : createdName classCreatorRest -> ^(VARIABLE_DECLARATION createdName classCreatorRest )
    ;

createdName
    : structType
    | primitiveType
    ;

classCreatorRest
    : arguments classBody?
    ;

arguments
    : '(' argumentList* ')' -> argumentList*
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

COMMENT : ('/*' | ' .*? ' | '*/') {skip();}
        ;

LINE_COMMENT : '//'  {skip();}
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
