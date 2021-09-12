//
// sampleApp.cpp 
//

#include <iostream>
#include<string>
using namespace std;

#include "../../sampleDLL/sampleDLL/sample.h"

#pragma comment(lib, "../../sampleDLL/x64/Release/sampleDLL.lib")

int main(int argc, char* argv[])
{

    string inputName = argv[1];
    string res = hello(inputName);

    cout << res << "\n";

    return 0;
}

