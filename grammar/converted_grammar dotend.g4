PROGRAM -> DECLLIST .

DECLLIST -> DECL DECLLIST2 | '' .
DECLLIST2 -> DECL DECLLIST2 | '' .

DECL -> FUNCDECL | VARDECL .

FUNCDECL -> TYPE IDENTIFIER PARALIST COMPOUNDSTMT .
VARDECL -> TYPE INITDECLARATORLIST ; .

INITDECLARATORLIST -> INITDECLARATOR INITDECLARATORLIST2 .
INITDECLARATORLIST2 -> , INITDECLARATOR INITDECLARATORLIST2 | '' .

INITDECLARATOR -> DECLARATOR INITDECLARATOR2 .
INITDECLARATOR2 -> = INITIALISER | '' .

DECLARATOR -> IDENTIFIER DECLARATOR2 .
DECLARATOR2 -> [ INTLITERAL2 ] | '' .

INTLITERAL2 -> intliteral | '' .

INITIALISER -> EXPR | { EXPR INITIALISER2 .
INITIALISER2 -> , EXPR INITIALISER2 | } .


TYPE -> void | boolean | int | float .


IDENTIFIER -> id .


COMPOUNDSTMT -> { VARDECLLIST STMTLIST } .

VARDECLLIST -> VARDECL VARDECLLIST | '' .
STMTLIST -> STMT STMTLIST | '' .


STMT -> COMPOUNDSTMT
      | IFSTMT
      | FORSTMT
      | WHILESTMT
      | BREAKSTMT
      | CONTINUESTMT
      | RETURNSTMT
      | EXPRSTMT .


IFSTMT -> IF ( EXPR ) STMT IFSTMT2 .
IFSTMT2 -> else STMT | '' .

FORSTMT -> FOR ( EXPRSTMT EXPRSTMT EXPRSTMT ) STMT .

WHILESTMT -> WHILE ( EXPR ) STMT .

BREAKSTMT -> BREAK ; .

CONTINUESTMT -> CONTINUE ; .

RETURNSTMT -> RETURN RETURNSTMT2 .
RETURNSTMT2 -> EXPR ; | ; .

EXPRSTMT -> EXPRSTMT2 .
EXPRSTMT2 -> EXPR ; | ; .





EXPR -> ASSIGNMENTEXPR .

ASSIGNMENTEXPR -> CONDOREXPR ASSIGNMENTEXPR2 .
ASSIGNMENTEXPR2 -> = ASSIGNMENTEXPR | '' .

CONDOREXPR -> CONDANDEXPR CONDOREXPR2 .
CONDOREXPR2 -> || CONDANDEXPR CONDOREXPR2 | '' .
 

CONDANDEXPR -> EQUALITYEXPR CONDANDEXPR2 .
CONDANDEXPR2 -> && EQUALITYEXPR CONDANDEXPR2 | '' .

EQUALITYEXPR -> RELEXPR EQUALITYEXPR2 .
EQUALITYEXPR2 -> == RELEXPR EQUALITYEXPR2 | != RELEXPR EQUALITYEXPR2 | '' .

RELEXPR -> ADDITIVEEXPR RELEXPR2 .
RELEXPR2 -> < ADDITIVEEXPR RELEXPR2 | <= ADDITIVEEXPR RELEXPR2 | > ADDITIVEEXPR RELEXPR2 | >= ADDITIVEEXPR RELEXPR2 | '' .

ADDITIVEEXPR -> MULTIPLICATIVEEXPR ADDITIVEEXPR2 .
ADDITIVEEXPR2 -> + MULTIPLICATIVEEXPR ADDITIVEEXPR2 | - MULTIPLICATIVEEXPR ADDITIVEEXPR2 | '' .

MULTIPLICATIVEEXPR -> UNARYEXPR MULTIPLICATIVEEXPR2 .
MULTIPLICATIVEEXPR2 -> * UNARYEXPR MULTIPLICATIVEEXPR2 | / UNARYEXPR MULTIPLICATIVEEXPR2 | '' .

UNARYEXPR -> + UNARYEXPR | - UNARYEXPR | ! UNARYEXPR | PRIMARYEXPR .

PRIMARYEXPR -> IDENTIFIER PRIMARYEXPR2 .
PRIMARYEXPR2 -> ARGLIST | [ EXPR ] | '' .
PRIMARYEXPR -> ( EXPR ) | intliteral | floatliteral | boolliteral | stringliteral .


PARALIST -> ( PARALIST2 ) .
PARALIST2 -> PROPERPARALIST | '' .

PROPERPARALIST -> PARADECL PROPERPARALIST2 .
PROPERPARALIST2 -> , PARADECL PROPERPARALIST2 | '' .

PARADECL -> TYPE DECLARATOR .

ARGLIST -> ( ARGLIST2 ) .
ARGLIST2 -> PROPERARGLIST | '' .

PROPERARGLIST -> ARG PROPERARGLIST2 .
PROPERARGLIST2 -> , ARG PROPERARGLIST2 | '' .

ARG -> EXPR .