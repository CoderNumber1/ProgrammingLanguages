%{
//--------------------------------------------------------------------
// File: p02lex.l 
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
// Project:      p02
// Due:  November 6, 2013
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
#include "p02lex.h"
#include "p02tkn.h"
//Externals 
//--------------------------------------------------------------------- 
extern ofstream tfs; //Trace File Stream 
//--------------------------------------------------------------------- 
//--------------------------------------------------------------------
//Function prototypes
//--------------------------------------------------------------------
int TokenMgr(int T);
int line;
int col;
bool commentFound;
//--------------------------------------------------------------------
//Global Variables 
//--------------------------------------------------------------------
%}
%%
\{ { return(TokenMgr(COMMENTBEGIN));}
\} { return(TokenMgr(COMMENTEND));}
\n { line++; col=1; }
[ \t]+ { col += strlen(yytext); }
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
void Print(int code, string name, int line, int column, string spelling)
{
	char buffer[80];
	sprintf(buffer, "Token:Code=%-4dName=%10s Line=%4d Col=%4d Spelling=\"%s\"", code, name.c_str(), line, column, spelling.c_str());
	tfs << endl << buffer;
}

int TokenMgr(int T)
{ 
	col += strlen(yytext);

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
		switch (T) 
		{
			case ID:
				Print(ID, "ID", line, col, (char*)yytext);
				break;
			case AND:
				Print(AND, "AND", line, col, (char*)yytext);
				break;
			case ARRAY:
				Print(ARRAY, "ARRAY", line, col, (char*)yytext);
				break;
			case BEGAN:
				Print(BEGAN, "BEGIN", line, col, (char*)yytext);
				break;
			case DIV:
				Print(DIV, "DIV", line, col, (char*)yytext);
				break;
			case DO:
				Print(DO, "DO", line, col, (char*)yytext);
				break;
			case ELSE:
				Print(ELSE, "ELSE", line, col, (char*)yytext);
				break;
			case END:
				Print(END, "END", line, col, (char*)yytext);
				break;
			case FOR:
				Print(FOR, "FOR", line, col, (char*)yytext);
				break;
			case FUNCTION:
				Print(FUNCTION, "FUNCTION", line, col, (char*)yytext);
				break;
			case IF:
				Print(IF, "IF", line, col, (char*)yytext);
				break;
			case INTEGER:
				Print(INTEGER, "INTEGER", line, col, (char*)yytext);
				break;
			case MOD:
				Print(MOD, "MOD", line, col, (char*)yytext);
				break;
			case NOT:
				Print(NOT, "NOT", line, col, (char*)yytext);
				break;
			case OF:
				Print(OF, "OF", line, col, (char*)yytext);
				break;
			case OR:
				Print(OR, "OR", line, col, (char*)yytext);
				break;
			case PROCEDURE:
				Print(PROCEDURE, "PROCEDURE", line, col, (char*)yytext);
				break;
			case PROGRAM:
				Print(PROGRAM, "PROGRAM", line, col, (char*)yytext);
				break;
			case REAL:
				Print(REAL, "REAL", line, col, (char*)yytext);
				break;
			case REPEAT:
				Print(REPEAT, "REPEAT", line, col, (char*)yytext);
				break;
			case THEN:
				Print(THEN, "THEN", line, col, (char*)yytext);
				break;
			case TO:
				Print(TO, "TO", line, col, (char*)yytext);
				break;
			case UNTIL:
				Print(UNTIL, "UNTIL", line, col, (char*)yytext);
				break;
			case VAR:
				Print(VAR, "VAR", line, col, (char*)yytext);
				break;
			case WHILE:
				Print(WHILE, "WHILE", line, col, (char*)yytext);
				break;
			case REALIT:
				Print(REALIT, "REALIT", line, col, (char*)yytext);
				break;
			case INTLIT:
				Print(INTLIT, "INTLIT", line, col, (char*)yytext);
				break;
			case CHRLIT:
				Print(CHRLIT, "CHRLIT", line, col, (char*)yytext);
				break;
			case EQU:
				Print(EQU, "EQU", line, col, (char*)yytext);
				break;
			case NEQ:
				Print(NEQ, "NEQ", line, col, (char*)yytext);
				break;
			case LES:
				Print(LES, "LES", line, col, (char*)yytext);
				break;
			case LEQ:
				Print(LEQ, "LEQ", line, col, (char*)yytext);
				break;
			case GRT:
				Print(GRT, "GRT", line, col, (char*)yytext);
				break;
			case GEQ:
				Print(GEQ, "GEQ", line, col, (char*)yytext);
				break;
			case PLUS:
				Print(PLUS, "PLUS", line, col, (char*)yytext);
				break;
			case MINUS:
				Print(MINUS, "MINUS", line, col, (char*)yytext);
				break;
			case STAR:
				Print(STAR, "STAR", line, col, (char*)yytext);
				break;
			case SLASH:
				Print(SLASH, "SLASH", line, col, (char*)yytext);
				break;
			case ASSIGNOP:
				Print(ASSIGNOP, "ASSIGNOP", line, col, (char*)yytext);
				break;
			case LPAREN:
				Print(LPAREN, "LPAREN", line, col, (char*)yytext);
				break;
			case RPAREN:
				Print(RPAREN, "RPAREN", line, col, (char*)yytext);
				break;
			case LBRACKET:
				Print(LBRACKET, "LBRACKET", line, col, (char*)yytext);
				break;
			case RBRACKET:
				Print(RBRACKET, "RBRACKET", line, col, (char*)yytext);
				break;
			case COLON:
				Print(COLON, "COLON", line, col, (char*)yytext);
				break;
			case SEMICOLON:
				Print(SEMICOLON, "SEMICOLON", line, col, (char*)yytext);
				break;
			case COMMA:
				Print(COMMA, "COMMA", line, col, (char*)yytext);
				break;
			case PERIOD:
				Print(PERIOD, "PERIOD", line, col, (char*)yytext);
				break;
			case RANGE:
				Print(RANGE, "RANGE", line, col, (char*)yytext);
				break;
		}

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
Lexer::Lexer(FILE* i)
{ 
	yyin=i;
	line = 1; //Assume there is at least one line.
	col = 1;
	commentFound = false;
}
//--------------------------------------------------------------------
//Function Lex calls yylex
//--------------------------------------------------------------------
int Lexer::Lex(void)
{ 
	return tokencode=yylex();
}
//--------------------------------------------------------------------
//Function FetchSpelling returns a pointer to the spelling of the most
//recent token.
//--------------------------------------------------------------------
char* Lexer::FetchSpelling(void)
{ 
	return (char*)yytext;
} 
//--------------------------------------------------------------------
//Function FetchTokenCode returns the code of the most recent token 
//--------------------------------------------------------------------
int Lexer::FetchTokenCode(void)
{ 
	return tokencode;
}
//--------------------------------------------------------------------
//Function FetchLine returns the line number of the token fetched
//--------------------------------------------------------------------
int Lexer::FetchLine(void)
{
	return line;
}
//--------------------------------------------------------------------
//Function FetchColumn returns the starting character number of the token fetched
//--------------------------------------------------------------------
int Lexer::FetchColumn(void)
{
	return col - strlen(yytext);
}
//--------------------------------------------------------------------
//Function StoreTokenCode records the most recent token code
//--------------------------------------------------------------------
void Lexer::StoreTokenCode(int T)
{ 
	tokencode=T;
}