//
// sample DLL
//

#include "pch.h"
#include<iostream>
#include<string>

#include "sample.h"

using namespace std;

string hello(string name) {

	string hello = "hello!";
	string res = hello + name;
	return res;
}


int add(int x, int y) {
    
	int z = x + y;
	return z;
}


