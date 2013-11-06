%{
//--------------------------------------------------------------------
// File: p01lex.l 
//-------------------------------------------------------------------
// Team Identification Block
// Author 1:     Mr. Brett Davis
// Student ID:   *20294948
// E-Mail:       bdavis42@uco.edu
// Author 2:     Mr. Karl James
// Student ID:   *20317952
// E-Mail:       kjames21@uco.edu
// Course:       CMSC 4023 . Programming Languages
// CRN:  12105
// Project:      p01
// Due:  September 30, 2013
// Project Account Number: tt069
//--------------------------------------------------------------------
// C++ Library Include Files 
//--------------------------------------------------------------------
#include <string> 
#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;
//--------------------------------------------------------------------
// Application Includes 
//--------------------------------------------------------------------
#include "p01tkn.h"
#include "p01lex.h"
//--------------------------------------------------------------------
//Function prototypes
//--------------------------------------------------------------------
int TokenMgr(int T);
int lineCount;
int columnCount;
bool commentFound;
//--------------------------------------------------------------------
//Global Variables 
//--------------------------------------------------------------------
%}
%%
\{ { return(TokenMgr(COMMENTBEGIN));}
\} { return(TokenMgr(COMMENTEND));}
\n { lineCount++; columnCount=1; }
[ \t]+ { columnCount += strlen(yytext); }
[Aa][Nn][Dd] {
return(TokenMgr(AND));
}
[Aa][Rr][Rr][Aa][Yy] {
return(TokenMgr(ARRAY));
}
[Bb][Ee][Gg][Ii][Nn] {
return(TokenMgr(BEGAN));
}
[Dd][Ii][Vv] {
return(TokenMgr(DIV));
}
[Dd][Oo] {
return(TokenMgr(DO));
}
[Ee][Ll][Ss][Ee] {
return(TokenMgr(ELSE));
}
[Ee][Nn][Dd] {
return(TokenMgr(END));
}
[Ff][Oo][Rr] {
return(TokenMgr(FOR));
}
[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn] {
return(TokenMgr(FUNCTION));
}
[Ii][Ff] {
return(TokenMgr(IF));
}
[Ii][Nn][Tt][Ee][Gg][Ee][Rr] {
return(TokenMgr(INTEGER));
}
[Mm][Oo][Dd] {
return(TokenMgr(MOD));
}
[Nn][Oo][Tt] {
return(TokenMgr(NOT));
}
[Oo][Ff] {
return(TokenMgr(OF));
}
[Oo][Rr] {
return(TokenMgr(OR));
}
[Pp][Rr][Oo][Cc][Ee][Dd][Uu][Rr][Ee] {
return(TokenMgr(PROCEDURE));
}
[Pp][Rr][Oo][Gg][Rr][Aa][Mm] {
return(TokenMgr(PROGRAM));
}
[Rr][Ee][Aa][Ll] {
return(TokenMgr(REAL));
}
[Rr][Ee][Pp][Ee][Aa][Tt] {
return(TokenMgr(REPEAT));
}
[Tt][Hh][Ee][Nn] {
return(TokenMgr(THEN));
}
[Tt][Oo] {
return(TokenMgr(TO));
}
[Uu][Nn][Tt][Ii][Ll] {
return(TokenMgr(UNTIL));
}
[Vv][Aa][Rr] {
return(TokenMgr(VAR));
}
[Ww][Hh][Ii][Ll][Ee] {
return(TokenMgr(WHILE));
}
[0-9]+\.[0-9]*([Ee][+-]?[0-9]+)? {
return(TokenMgr(REALIT));
}
[0-9]*\.[0-9]+([Ee][+-]?[0-9]+)? {
return(TokenMgr(REALIT));
}
[0-9]+[Ee][+-]?[0-9]+ {
return(TokenMgr(REALIT));
}
[0-9]+ { 
return(TokenMgr(INTLIT));
}
\'[^\']\'|'''' {
return(TokenMgr(CHRLIT));
}
"=" {
return(TokenMgr(EQU));
}
"<>" {
return(TokenMgr(NEQ));
}
"<" {
return(TokenMgr(LES));
}
"<=" {
return(TokenMgr(LEQ));
}
">" {
return(TokenMgr(GRT));
}
">=" {
return(TokenMgr(GEQ));
}
"+" { 
return(TokenMgr(PLUS));
}
"-" { 
return(TokenMgr(MINUS));
}
"*" { 
return(TokenMgr(STAR));
}
"/" { 
return(TokenMgr(SLASH));
}
":=" {
return(TokenMgr(ASSIGNOP));
}
"(" {
return(TokenMgr(LPAREN));
}
")" {
return(TokenMgr(RPAREN));
}
"[" {
return(TokenMgr(LBRACKET));
}
"]" {
return(TokenMgr(RBRACKET));
}
":" {
return(TokenMgr(COLON));
}
";" {
return(TokenMgr(SEMICOLON));
}
"," {
return(TokenMgr(COMMA));
}
"." {
return(TokenMgr(PERIOD));
}
".." {
return(TokenMgr(RANGE));
}
[A-Za-z_][A-Za-z0-9_]* {
return(TokenMgr(ID));
}
. {
return(TokenMgr(TOKENERROR));
}
%%
//--------------------------------------------------------------------
int TokenMgr(int T)
{ 
	columnCount += strlen(yytext);

	if(T == COMMENTBEGIN){
		if(commentFound == true){
			return 0;
		}
		commentFound = true;
	}
	else if(T == COMMENTEND){
		commentFound = false;
	}

	if(!commentFound){
		return T;
	}
	else{
		return -1;
	}
}
//--------------------------------------------------------------------
//Class Scan implementation
//--------------------------------------------------------------------
//Constructor Scan is used to redirect the input file stream from the
//keyboard to input file stream i.
//--------------------------------------------------------------------
Scanner::Scanner(FILE* i)
{ 
	yyin=i;
	lineCount = 1; //Assume there is at least one line.
	columnCount = 1;
	commentFound = false;
}
//--------------------------------------------------------------------
//Function Lex calls yylex
//--------------------------------------------------------------------
int Scanner::Lex(void)
{ 
	return tokencode=yylex();
}
//--------------------------------------------------------------------
//Function FetchSpelling returns a pointer to the spelling of the most
//recent token.
//--------------------------------------------------------------------
char* Scanner::FetchSpelling(void)
{ 
	return (char*)yytext;
} 
//--------------------------------------------------------------------
//Function FetchTokenCode returns the code of the most recent token 
//--------------------------------------------------------------------
int Scanner::FetchTokenCode(void)
{ 
	return tokencode;
}
//--------------------------------------------------------------------
//Function FetchLine returns the line number of the token fetched
//--------------------------------------------------------------------
int Scanner::FetchLine(void)
{
	return lineCount;
}
//--------------------------------------------------------------------
//Function FetchColumn returns the starting character number of the token fetched
//--------------------------------------------------------------------
int Scanner::FetchColumn(void)
{
	return columnCount - strlen(yytext);
}
//--------------------------------------------------------------------
//Function StoreTokenCode records the most recent token code
//--------------------------------------------------------------------
void Scanner::StoreTokenCode(int T)
{ 
	tokencode=T;
}