#ifndef Scan_h
#define Scan_h 1
//--------------------------------------------------------------------
// File: p01lex.h 
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
// Project:      p01
// Due:  September 30, 2013
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

#ifdef __cplusplus
extern "C" 
#endif
//--------------------------------------------------------------------
//Function: yylex 
//Function yylex is the Scanner. Function yylex returns an integer 
//token code as defined above or 0 if end-of-file has been 
//reached. 
//--------------------------------------------------------------------
int yylex (void);
//--------------------------------------------------------------------
//Class Scan defines the attributes of a Scanner
//--------------------------------------------------------------------
class Scanner {
	int tokencode;

public:
	Scanner(FILE* i);
	int Lex(void);
	int FetchTokenCode(void);
	void StoreTokenCode(int T);
	char* FetchSpelling(void);
	int FetchLine(void);
	int FetchColumn(void);
};
#endif