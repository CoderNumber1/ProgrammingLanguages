//--------------------------------------------------------------------------
//File p01.cpp processes command line parameters, opens input and output files
//found on the command line, and scans all tokens in the input file.
//--------------------------------------------------------------------------
//Team Identification Block
//Author 1:     Mr. Brett Davis
//Student ID:   *20294948
//E-Mail:       bdavis42@uco.edu
//Author 2:     Mr. Karl James
//Student ID:   *20317952
//E-Mail:       kjames21@uco.edu
//Course:       CMSC 4023 . Programming Languages
//CRN:  12105
//Project:      p01
//Due:  September 30, 2013
//Project Account Number: tt069
//--------------------------------------------------------------------------
//Standard C and C++ includes
//--------------------------------------------------------------------------
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstring>
#include <stdlib.h>
#include <string>
using namespace std;
//-------------------------------------------------------------------------
//Application includes
//-------------------------------------------------------------------------
#include "p01lex.h"
#include "p01tkn.h"
//-------------------------------------------------------------------------
//FileException is thrown when a file whose name is given on the command line
//cannot be opened.
//-------------------------------------------------------------------------
struct FileException 
{
	FileException(char* fn)
	{ 
		cout << endl;
		cout << "File " << fn << " cannot be opened.";
	}
};
//-------------------------------------------------------------------------
//CommandLineException is thrown when too many arguments are given on the command
//line.
//-------------------------------------------------------------------------
struct CommandLineException 
{
	CommandLineException(int ac)
	{ 
		cout << endl;
		cout << "Too many (" << ac << ") command line arguments.";
	}
};
//-------------------------------------------------------------------------
//Function Print prints token information to the output stream.
//-------------------------------------------------------------------------
void Print(ostream& o, int code, string name, int line, int column, string spelling)
{
	char buffer[80];
	sprintf(buffer, "Token:Code=%-4dName=%10s Line=%4d Col=%4d Spelling=\"%s\"", code, name.c_str(), line, column, spelling.c_str());
	o << buffer << endl;
}

//-------------------------------------------------------------------------
//Function Mgr processes the input file stream i
//-------------------------------------------------------------------------
void Mgr(FILE* i, ostream& o)
{ 
	Scanner L(i);
	for (;;) 
	{
		int t=L.Lex();
		if (t==0) break;
		switch (t) 
		{
			case ID:
				Print(o, ID, "ID", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case AND:
				Print(o, AND, "AND", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case ARRAY:
				Print(o, ARRAY, "ARRAY", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case BEGAN:
				Print(o, BEGAN, "BEGIN", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case DIV:
				Print(o, DIV, "DIV", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case DO:
				Print(o, DO, "DO", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case ELSE:
				Print(o, ELSE, "ELSE", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case END:
				Print(o, END, "END", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case FOR:
				Print(o, FOR, "FOR", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case FUNCTION:
				Print(o, FUNCTION, "FUNCTION", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case IF:
				Print(o, IF, "IF", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case INTEGER:
				Print(o, INTEGER, "INTEGER", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case MOD:
				Print(o, MOD, "MOD", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case NOT:
				Print(o, NOT, "NOT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case OF:
				Print(o, OF, "OF", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case OR:
				Print(o, OR, "OR", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case PROCEDURE:
				Print(o, PROCEDURE, "PROCEDURE", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case PROGRAM:
				Print(o, PROGRAM, "PROGRAM", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case REAL:
				Print(o, REAL, "REAL", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case REPEAT:
				Print(o, REPEAT, "REPEAT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case THEN:
				Print(o, THEN, "THEN", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case TO:
				Print(o, TO, "TO", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case UNTIL:
				Print(o, UNTIL, "UNTIL", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case VAR:
				Print(o, VAR, "VAR", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case WHILE:
				Print(o, WHILE, "WHILE", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case REALIT:
				Print(o, REALIT, "REALIT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case INTLIT:
				Print(o, INTLIT, "INTLIT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case CHRLIT:
				Print(o, CHRLIT, "CHRLIT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case EQU:
				Print(o, EQU, "EQU", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case NEQ:
				Print(o, NEQ, "NEQ", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case LES:
				Print(o, LES, "LES", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case LEQ:
				Print(o, LEQ, "LEQ", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case GRT:
				Print(o, GRT, "GRT", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case GEQ:
				Print(o, GEQ, "GEQ", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case PLUS:
				Print(o, PLUS, "PLUS", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case MINUS:
				Print(o, MINUS, "MINUS", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case STAR:
				Print(o, STAR, "STAR", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case SLASH:
				Print(o, SLASH, "SLASH", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case ASSIGNOP:
				Print(o, ASSIGNOP, "ASSIGNOP", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case LPAREN:
				Print(o, LPAREN, "LPAREN", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case RPAREN:
				Print(o, RPAREN, "RPAREN", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case LBRACKET:
				Print(o, LBRACKET, "LBRACKET", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case RBRACKET:
				Print(o, RBRACKET, "RBRACKET", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case COLON:
				Print(o, COLON, "COLON", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case SEMICOLON:
				Print(o, SEMICOLON, "SEMICOLON", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case COMMA:
				Print(o, COMMA, "COMMA", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case PERIOD:
				Print(o, PERIOD, "PERIOD", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
			case RANGE:
				Print(o, RANGE, "RANGE", L.FetchLine(), L.FetchColumn(), L.FetchSpelling());
				break;
		}
	}
	o << endl;
}
//-------------------------------------------------------------------------
//Function main processes command line arguments and opens files specified
//on the command line.
//-------------------------------------------------------------------------
int main(int argc,char* argv[])
{ 
	try 
	{
		char ifn[255]; //Input File Name
		char ofn[255]; //Output File Name
		string ifTest;
		switch (argc) 
		{
		case 1: //Prompt for both file names
			cout << "Enter the input file name. ";
			cin >> ifn;
			if(string(ifn).substr(string(ifn).size() - 4) != ".pas")
			{
				throw FileException(ifn);
			}
			strcpy(ofn, string(ifn).replace(string(ifn).size() - 4, 4, ".trc").c_str());
			break;
		case 2:
			strcpy(ifn,argv[1]);
			if(string(ifn).substr(string(ifn).size() - 4) != ".pas")
			{
				throw FileException(ifn);
			}
			strcpy(ofn, string(ifn).replace(string(ifn).size() - 4, 4, ".trc").c_str());
			break;
		default:
			throw CommandLineException(argc);
		}

		FILE* ifp=fopen(ifn,"r"); 
		if(!ifp) 
			throw FileException(ifn);
		
		ofstream ofs(ofn); 
		if(!ofs) 
			throw FileException(ofn);
		
		Mgr(ifp,ofs);
		fclose(ifp);
		ofs.close();
	} 
	catch ( ... ) 
	{
		cout << endl;
		cout << "Program terminated.";
		exit(EXIT_FAILURE);
	}

	return 0;
}