//
// 排他制御サンプル
// スレッド間とプロセス間の排他制御がある
//

#include <windows.h>
#include <stdio.h>
#include <iostream>

int processMutex()
{
    HANDLE hHandle;
    HANDLE h;
    BOOL result;

    /* global\\をつけるとすべてのユーザに対して排他制御. global抜きだとsystemユーザのみに排他制御 */
    hHandle = CreateMutex(NULL, TRUE, "Global\\sample");

    /* 作成したハンドルをopen */
    h = OpenMutex(MUTEX_ALL_ACCESS, FALSE, "Global\\sample");

    /* ハンドルがシグナル状態＝使用できる状態になるまで待つ */
    WaitForSingleObject(h, INFINITE);

    /*
    
    ここに処理を記載する
    
    */


    /* mutexとhandleの解放 */
    result = ReleaseMutex(h);
    if (!result) {
        printf("fail to release mutex handle\n");
    }

    result = CloseHandle(hHandle);
    if (!result) {
        printf("fail to close handle\n");
    }

    return 0;
}


int threadMutex()
{
    std::cout << "Hello World!\n";
}


int main()
{
    std::cout << "Hello World!\n";
}