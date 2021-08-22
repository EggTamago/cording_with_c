// 
// windows event logへの書き込み方法
// 参考：https://docs.microsoft.com/ja-jp/windows/win32/eventlog/reporting-an-event
// 参考 : https://togarasi.wordpress.com/2008/05/24/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88%E3%83%AD%E3%82%B0%E3%81%A7%E4%BD%BF%E3%81%86%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB-dll%E3%82%92%E4%BD%9C%E6%88%90/
// 参考 : https://docs.microsoft.com/en-us/windows/win32/eventlog/reporting-an-event
//


#include <iostream>
#include <windows.h>
#include <winbase.h>

#include "../event-resource/RAS_INFO.h"

#define EventSource  "RAS_INFO"

void main(void)
{

	HANDLE hEvent;
	BOOL Status;

	LPCTSTR Args[] = {
		"1 : this is first arg",
		"2 : this is second arg"
	};

	/* イベントログのオープン */
	hEvent = RegisterEventSource(NULL, EventSource);
	if (hEvent == NULL) {
		printf("can not create event handle\n");
	};

	/* イベントログへ書き込み*/
	Status = ReportEvent(
		hEvent,                                             // イベントログのハンドル
		EVENTLOG_INFORMATION_TYPE,   // ログに書き込むイベントの種類
		0,                                                      // イベントの分類
		MSG_MEMORY_ERROR,                   // イベント識別子
		NULL,                                               // ユーザーセキュリティ識別子（省略可能）
		0,                                                     // メッセージにマージする文字列の数
		0,                                                     // バイナリデータのサイズ（バイト数）
		NULL,                                               // メッセージにマージする文字列の配列
		NULL                                                // バイナリデータのアドレス
	);

	/* イベントログへ書き込み*/
	Status = ReportEvent(
		hEvent,                                             // イベントログのハンドル
		EVENTLOG_INFORMATION_TYPE,   // ログに書き込むイベントの種類
		0,                                                      // イベントの分類
		MSG_TEST_ERROR,                         // イベント識別子
		NULL,                                               // ユーザーセキュリティ識別子（省略可能）
		2,                                                     // メッセージにマージする文字列の数
		0,                                                     // バイナリデータのサイズ（バイト数）
		&Args[0],                                         // メッセージにマージする文字列の配列
		NULL                                                // バイナリデータのアドレス
	);

	/* イベントログのクローズ */
	DeregisterEventSource(hEvent);

	Sleep(1 * 1000);
}


