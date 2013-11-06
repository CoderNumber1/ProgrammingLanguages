%{ 
//--------------------------------------------------------------------
// File: p02par.y
//--------------------------------------------------------------------
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
// Standard C and C++ include files 
//--------------------------------------------------------------------
#include <cstdio> 
#include <cstdlib> 
#include <cstring> 
#include <cmath> 
#include <iostream> 
#include <fstream> 
#include <iomanip> 
#include <string> 
using namespace std; 
//--------------------------------------------------------------------- 
//Application include files 
//--------------------------------------------------------------------- 
#include "p02par.h" 
//Externals 
//--------------------------------------------------------------------- 
extern ofstream tfs; //Trace File Stream 
extern int line; //Current Line - defined in p02lex.l 
extern int col; //Current Column - define in p02lex.l 
//--------------------------------------------------------------------- 
//Globals 
//--------------------------------------------------------------------- 
//--------------------------------------------------------------------- 
//User subroutines 
//--------------------------------------------------------------------- 
void yyerror(const char*); 
//--------------------------------------------------------------------- 
%} 

%token TOKENERROR
%token COMMENTBEGIN
%token COMMENTEND
%token COMMENT	

%token ID		
%token AND		
%token ARRAY	
%token BEGAN	
%token DIV		
%token DO		
%token ELSE		
%token END		
%token FOR		
%token FUNCTION	
%token IF		
%token INTEGER	
%token MOD		
%token NOT		
%token OF		
%token OR		
%token PROCEDURE
%token PROGRAM	
%token REAL		
%token REPEAT	
%token THEN		
%token TO		
%token UNTIL	
%token VAR		
%token WHILE	
%token REALIT	
%token INTLIT	
%token CHRLIT	
%token EQU		
%token NEQ		
%token LES		
%token LEQ		
%token GRT		
%token GEQ		
%token PLUS		
%token MINUS	
%token STAR		
%token SLASH	
%token ASSIGNOP	
%token LPAREN	
%token RPAREN	
%token LBRACKET	
%token RBRACKET	
%token COLON	
%token SEMICOLON
%token COMMA	
%token PERIOD	
%token RANGE

%% 
program: PROGRAM ID LPAREN identifier_list RPAREN SEMICOLON declarations subprogram_declarations compound_statement PERIOD
{
tfs << endl << "program-> PROGRAM ID LPAREN identifier_list RPAREN SEMICOLON declarations subprogram_declarations compound_statement PERIOD";
}
identifier_list: ID
{
tfs << endl << "identifier_list-> ID";
}
identifier_list: identifier_list COMMA ID
{
tfs << endl << "identifier_list-> identifier_list, ID";
}
declarations: 
{
tfs << endl << "declarations-> empty set";
}
declarations: declarations VAR identifier_list COLON type SEMICOLON
{
tfs << endl << "declarations-> var identifier_list : type ;";
}
type: standard_type
{
tfs << endl << "type-> standard_type";
}
type: ARRAY LBRACKET INTLIT RANGE INTLIT RBRACKET OF standard_type
{
tfs << endl << "type-> ARRAY[INTLIT...INTLIT] OF standard_type";
}
standard_type: INTEGER
{
tfs << endl << "standard_type-> INTEGER";
}
standard_type: REAL
{
tfs << endl << "standard_type-> REAL";
}
subprogram_declarations:
{
tfs << endl << "subprogram_declarations-> empty set";
}
subprogram_declarations: subprogram_declarations subprogram_declaration SEMICOLON
{
tfs << endl << "subprogram_declarations-> subprogram_declarations subprogram_declaration ;";
}
subprogram_declaration: subprogram_head declarations compound_statement
{
tfs << endl << "subprogram_declarations-> subprogram_head declarations compound_statement";
}
subprogram_head: FUNCTION ID arguments COLON standard_type SEMICOLON
{
tfs << endl << "subprogram_head-> FUNCTION ID arguments COLON standard_type SEMICOLON";
}
subprogram_head: PROCEDURE ID arguments
{
tfs << endl << "subprogram_head ->PROCEDURE ID arguments";
}
arguments:
{
tfs << endl << "arguments-> empty set";
}
arguments: LPAREN parameter_list RPAREN
{
tfs << endl << "arguments-> LPAREN parameter_list RPAREN";
}
parameter_list: identifier_list COLON type
{
tfs << endl << "parameter_list-> identifier_list COLON  type";
}
parameter_list: parameter_list SEMICOLON identifier_list COLON type
{
tfs << endl << "parameter_list SEMICOLON identifier_list COLON type";
}
compound_statement: BEGAN optional_statements END
{
tfs << endl << "compound_statement-> BEGAN optional_statements END";
}
optional_statements:
{
tfs << endl << "optional_statements-> empty set";
}
optional_statements: statement_list
{
tfs << endl << "optional_statements-> statement_list";
}
statement_list: statement
{
tfs << endl << "statement_list-> statement";
}
statement_list: statement_list SEMICOLON statement
{
tfs << endl << "statement_list SEMICOLON statement";
}
statement: variable ASSIGNOP expression
{
tfs << endl << "statement-> variable ASSIGNOP expression";
}
statement: procedure_statement
{
tfs << endl << "statement->procedure_statement";
}
statement: compound_statement
{
tfs << endl << "statement-> compound_statement";
}
statement: IF expression THEN statement ELSE statement
{
tfs << endl << "statement-> IF expression THEN statement ELSE statement";
}
statement: WHILE expression DO statement
{
tfs << endl << "statement-> WHILE expression DO statement";
}
variable: ID
{
tfs << endl << "variable-> ID";
}
variable: ID LBRACKET expression RBRACKET
{
tfs << endl << "variable-> ID LBRACKET expression RBRACKET";
}
procedure_statement: ID
{
tfs << endl << "procedure_statement-> ID";
}
procedure_statement: ID LPAREN expression_list RPAREN
{
tfs << endl << "procedure_statement-> ID LPAREN expression RPAREN";
}
expression_list: expression
{
tfs << endl << "expression_list-> expression";
}
expression_list: expression_list COMMA expression
{
tfs << endl << "expression_list-> expression_list, expression";
}
expression: simple_expression
{
tfs << endl << "expression-> simple_expression";
}
expression: simple_expression relop simple_expression
{
tfs << endl << "expression-> simple_expression relop simple_expression";
}
relop: EQU
{
tfs << endl << "relop-> EQU";
}
relop: NEQ
{
tfs << endl << "relop-> NEQ";
}
relop: LES
{
tfs << endl << "relop-> LES";
}
relop: LEQ
{
tfs << endl << "relop-> LEQ";
}
relop: GRT
{
tfs << endl << "relop-> GRT";
}
relop: GEQ
{
tfs << endl << "relop-> GEQ";
}
simple_expression: term
{
tfs << endl << "simple_expression-> term";
}
simple_expression: sign term
{
tfs << endl << "simple_expression-> sign term";
}
simple_expression: simple_expression addop term
{
tfs << endl << "simple_expression: simple_expression addop term";
}
addop: PLUS
{
tfs << endl << "addop-> PLUS";
}
addop: MINUS
{
tfs << endl << "addop-> MINUS";
}
addop: OR
{
tfs << endl << "addop-> OR";
}
term: factor
{
tfs << endl << "term-> factor";
}
term: term mulop factor
{
tfs << endl << "term-> term mulop factor";
}
mulop: STAR
{
tfs << endl << "mulop-> STAR";
}
mulop: SLASH
{
tfs << endl << "mulop-> SLASH";
}
mulop: DIV
{
tfs << endl << "mulop-> DIV";
}
mulop: MOD
{
tfs << endl << "mulop-> MOD";
}
mulop: AND
{
tfs << endl << "mulop-> AND";
}
factor: ID
{
tfs << endl << "factor-> ID";
}
factor: ID LPAREN expression_list RPAREN
{
tfs << endl << "factor-> ID LPAREN expression_list RPAREN";
}
factor: INTLIT 
{
tfs << endl << "factor-> INTLIT";
}
factor: REALIT
{
tfs << endl << "factor-> REALIT";
}
factor: LPAREN expression RPAREN
{
tfs << endl << "factor-> LPAREN expression RPAREN";
}
factor: NOT factor
{
tfs << endl << "factor-> NOT factor";
}
sign: PLUS
{
tfs << endl << "sign-> PLUS";
}
sign: MINUS
{
tfs << endl << "sign-> MINUS";
} 
%% 
//----------------------------------------------------------------------- 
//User function section 
//----------------------------------------------------------------------- 
struct Error { 
Error(const char* m) 
{ tfs << endl << "line(" << line << ") col(" << col << ") " << m; 
tfs << endl; 
} 
}; 
//----------------------------------------------------------------------- 
//Required function yyerror 
//----------------------------------------------------------------------- 
void yyerror(const char* m){throw Error(m);} 
//----------------------------------------------------------------------- 
//----------------------------------------------------------------------- 
Parser::Parser(FILE* i):Lexer(i){} 
int Parser::Parse(){return yyparse();} 
//----------------------------------------------------------------------- 
//----------------------------------------------------------------------- 
Parser::~Parser(){} 
