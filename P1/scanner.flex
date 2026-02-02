%{
#include "token.h"
#include "helper.h"
%}

%option nounput
%option noinput
%option yylineno

DIGIT  [0-9]
LETTER [a-zA-Z]
ID [a-zA-Z]([a-zA-Z]|[0-9])*
%%
(" "|\t|\n)  /* skip whitespace */
while                 { return TOKEN_KEYWORD_WHILE; }
array                 { return TOKEN_KEYWORD_ARRAY; }
boolean               { return TOKEN_ATOMIC_TYPE_BOOLEAN; }
char                  { return TOKEN_ATOMIC_TYPE_CHAR; }
else                  { return TOKEN_KEYWORD_ELSE; }
false                 { return TOKEN_KEYWORD_FALSE; }
for                   { return TOKEN_KEYWORD_FOR; }
function              { return TOKEN_KEYWORD_FUNCTION; }
if                    { return TOKEN_KEYWORD_IF; }
integer               { return TOKEN_ATOMIC_TYPE_INTEGER; }
print                 { return TOKEN_KEYWORD_PRINT; }
return                { return TOKEN_KEYWORD_RETURN; }
string                { return TOKEN_ATOMIC_TYPE_STRING; }
true                  { return TOKEN_KEYWORD_TRUE; }
void                  { return TOKEN_KEYWORD_VOID; }
\*                    { return TOKEN_MULTIPLICATION; }
\[                    { return TOKEN_LEFT_SQUARE_BRACKETS; }
\]                    { return TOKEN_RIGHT_SQUARE_BRACKETS; }
"/"                   { return TOKEN_DIVISION; } 
\%                    { return TOKEN_MODULOS; }
"<="                  { return TOKEN_LESS_THAN_OR_EQUAL; }
">="                  { return TOKEN_GREATER_THAN_OR_EQUAL; }
"<"                   { return TOKEN_LESS_THAN; }
">"                   { return TOKEN_GREATER_THAN; }
==                    { return TOKEN_LOGICAL_EQUIVALENCE; }
=                     { return TOKEN_ASSIGNMENT; }
!=                    { return TOKEN_NOT_EQUAL; }
!                     { return TOKEN_LOGICAL_NOT; }
&&                    { return TOKEN_LOGICAL_AND; }
"||"                  { return TOKEN_LOGICAL_OR; }
\^                    { return TOKEN_EXPONENTIATION; }
\++                   { return TOKEN_POSTFIX_INCREMENT; }
--                    { return TOKEN_POSTFIX_DECREMENT; }
\+                    { return TOKEN_ADD; }
\-                    { return TOKEN_SUBTRACT; }
~                     { return TOKEN_UNARY_NEGATION; }
:                     { return TOKEN_COLON; }
;                     { return TOKEN_SEMICOLON; }
\(                    { return TOKEN_LEFT_PARENTHESES; }
\)                    { return TOKEN_RIGHT_PARENTHESES; }
\"([^\\\"]|\\.)*\"    { return TOKEN_STRING_LITERAL; }
\'([^\\']|\\.)\'      { return TOKEN_CHARACTER_LITERAL; }
{ID}                  { return TOKEN_IDENTIFIER; }
{DIGIT}+              { return TOKEN_INTEGER_LITERAL; }
.                     { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }
