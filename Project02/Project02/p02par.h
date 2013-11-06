//--------------------------------------------------------------------
// File: p02par.h 
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
#include <fstream>
#include <iostream>
//--------------------------------------------------------------------
//Namespaces
//--------------------------------------------------------------------
using namespace std;

#include "p02lex.h"

void yyerror(const char* m);
//----------------------------------------------------------------------- 
//----------------------------------------------------------------------- 
class Parser : public Lexer {
public:
	Parser(FILE* i);
	int Parse();
	~Parser();
};