//--------------------------------------------------------------------------
//File p02.cpp processes command line parameters, opens input and output files
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
//Project:      p02
//Due:  November 6, 2013
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
#include "p02lex.h"
#include "p02par.h"
#include "p02tkn.h"

ofstream tfs;
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
//Function Mgr processes the input file stream i
//-------------------------------------------------------------------------
void Mgr(FILE* i)
{
	Parser p(i);
	p.Parse();
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
		
		tfs.open(ofn); 
		if(!tfs) 
			throw FileException(ofn);
		
		Mgr(ifp);
		tfs << endl;
		fclose(ifp);
		tfs.close();
	} 
	catch ( ... ) 
	{
		cout << endl;
		cout << "Program terminated.";
		exit(EXIT_FAILURE);
	}

	return 0;
}