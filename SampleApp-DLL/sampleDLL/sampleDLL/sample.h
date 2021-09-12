#pragma once

#include<iostream>
#include<string>

using namespace std;

#ifdef SAMPLEDLL_EXPORTS
#define SAMPLEDLL_API __declspec(dllexport)
#else
#define SAMPLEDLL_API __declspec(dllimport)
#endif

extern "C" SAMPLEDLL_API string hello(string name);
