PROGRAM -> ( FUNCDECL | VARDECL )*

// DECLARATIONS
FUNCDECL -> TYPE IDENTIFIER PARALIST COMPOUNDSTMT
VARDECL -> TYPE INITDECLARATORLIST ";"
INITDECLARATORLIST-> INITDECLARATOR ( "," INITDECLARATOR )*
INITDECLARATOR -> DECLARATOR ( "=" INITIALISER )?
DECLARATOR -> IDENTIFIER
| IDENTIFIER "[" intliteral? "]"
INITIALISER -> EXPR
| "{" EXPR ( "," EXPR )* "}"

// PRIMITIVE TYPES
TYPE -> void | boolean | int | float

// IDENTIFIERS
IDENTIFIER -> id

// STATEMENTS
COMPOUNDSTMT -> "{" VARDECL* STMT* "}"
STMT -> COMPOUNDSTMT
| IFSTMT
| FORSTMT
| WHILESTMT
| BREAKSTMT
| CONTINUESTMT
| RETURNSTMT
| EXPRSTMT
IFSTMT -> IF "(" EXPR ")" STMT ( ELSE STMT )?
FORSTMT -> FOR "(" EXPR? ";" EXPR? ";" EXPR? ")" STMT
WHILESTMT -> WHILE "(" EXPR ")" STMT
BREAKSTMT -> BREAK ";"
CONTINUESTMT -> CONTINUE ";"
RETURNSTMT -> RETURN EXPR? ";"
EXPRSTMT -> EXPR? ";"

// EXPRESSIONS
EXPR -> ASSIGNMENTEXPR
ASSIGNMENTEXPR -> ( CONDOREXPR "=" )* CONDOREXPR
CONDOREXPR -> CONDANDEXPR
| CONDOREXPR "||" CONDANDEXPR
CONDANDEXPR -> EQUALITYEXPR
| CONDANDEXPR "&&" EQUALITYEXPR
EQUALITYEXPR -> RELEXPR
| EQUALITYEXPR "==" RELEXPR
| EQUALITYEXPR "!=" RELEXPR
RELEXPR -> ADDITIVEEXPR
| RELEXPR "<" ADDITIVEEXPR
| RELEXPR "<=" ADDITIVEEXPR
| RELEXPR "->" ADDITIVEEXPR
| RELEXPR "->=" ADDITIVEEXPR
ADDITIVEEXPR -> MULTIPLICATIVEEXPR
| ADDITIVEEXPR "+" MULTIPLICATIVEEXPR
| ADDITIVEEXPR "" MULTIPLICATIVEEXPR
MULTIPLICATIVEEXPR -> UNARYEXPR
| MULTIPLICATIVEEXPR "*" UNARYEXPR
| MULTIPLICATIVEEXPR "/" UNARYEXPR
UNARYEXPR -> "+" UNARYEXPR
| "" UNARYEXPR
| "!" UNARYEXPR
| PRIMARYEXPR
PRIMARYEXPR -> IDENTIFIER ARGLIST?
| IDENTIFIER "[" EXPR "]"
| "(" EXPR ")"
| intliteral
| FLOATLITERAL
| BOOLLITERAL
| STRINGLITERAL
// PARAMETERS
PARALIST -> "(" PROPERPARALIST? ")"
PROPERPARALIST -> PARADECL ( "," PARADECL )*
PARADECL -> TYPE DECLARATOR
ARGLIST -> "(" PROPERARGLIST? ")"
PROPERARGLIST -> ARG ( "," ARG )*
ARG -> EXPR