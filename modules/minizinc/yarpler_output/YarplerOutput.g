grammar YarplerOutput;

options {
  language=Ruby;
  output=AST;
}

tokens {
  START;
  OUTPUT;
  OUTPUT_LIST;
  UNSAT;
}

start
    : outputlist '----------' '=========='? -> ^(START outputlist)
    | '=====UNSATISFIABLE=====' -> ^(START UNSAT)
    ;

outputlist
    : (output ' ')* -> ^(OUTPUT_LIST output*)
    ;

output
    : IDENTIFIER '=' DIGITS -> ^(OUTPUT IDENTIFIER DIGITS)
    ;

// NEWLINE

WS : ('\r' | '\n') {skip();};

// IDENTIFIERS
IDENTIFIER : LETTER LETTERORDIGIT*
    	   ;

fragment
LETTER : ALPHABET
			 | '_'
    		 ;

fragment
LETTERORDIGIT : ALPHANUMERIC
    			    | '_'
    			    ;


fragment
LOWERCASE		: 'a'..'z'
			;

fragment
UPPERCASE		: 'A'..'Z'
			;

fragment
ALPHABET	: LOWERCASE
			| UPPERCASE
			;

fragment
ALPHANUMERIC : ALPHABET
			 | DIGIT
    		 ;

fragment
DIGIT : '0'..'9'
 	  ;

DIGITS : ('+'|'-')? DIGIT DIGIT*
       ;