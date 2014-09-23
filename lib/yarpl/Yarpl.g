grammar Yarpl;

options {
  language=Ruby;
  output=AST;
}

tokens {
  CLASS_DECLARATION;
  CLASS_BODY;
  CLASS_BODY_DECLARATION;
  DOMAIN_DECLARATION;
  DOMAIN_BODY;
  DOMAIN_BODY_DECLARATION;
  FIELD_DECLARATION;
  INITIAL_BODY;
  INITIAL_DECLARATION;
  INTEGER;
  MEMBER_DECLARATION;
  PROGRAM;
  START;
  TYPE_DECLARATION;
  VARIABLE_DECLARATOR;
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
    : '{' initialBodyDeclaration* '}' -> ^(INITIAL_BODY initialBodyDeclaration*)
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
    : variableType type variableDeclaratorId ';' -> ^(FIELD_DECLARATION type variableDeclaratorId)
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
    : expression
    ;

localVariableDeclaration
    : variableType type variableDeclarators ';'
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

primary
	: 'new' creator
    | literal
	;

creator
    : createdName classCreatorRest
    ;

createdName
    : structType
    | primitiveType
    ;

classCreatorRest
    : arguments classBody?
    ;

arguments
    : '(' expressionList? ')'
    ;

literal
	: RANGEINTEGERLITERAL
	;

type
    : structType -> ^(VARIABLE_TYPE structType)
    | primitiveType -> ^(VARIABLE_TYPE primitiveType)
    ;

structType
    : IDENTIFIER
    ;

primitiveType
    : 'boolean'
    | 'nullableboolean'
    | 'float'
    | 'integer' -> ^(INTEGER)
    | 'string'
    | 'decimal'
    | 'datetime'
    | 'time'
    ;

variableType
    : 'object'
    | 'var'
    | 'const'
    | 'set'
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

fragment
DECIMALNUMBER		: '0'
			| SIGN? NONZERODIGIT (DIGITS?)
			;

RANGEINTEGERLITERAL	: DIGITS '..' DIGITS
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
