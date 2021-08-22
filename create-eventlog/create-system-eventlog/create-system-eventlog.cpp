// 
// windows event log systemへの書き込み方法
//


#include <iostream>
#include <windows.h>
#include <winbase.h>

#include "../event-system-resource/RAS_TEST.h"

#define EventSource  "RAS_TEST"

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
		EVENTLOG_ERROR_TYPE,               // ログに書き込むイベントの種類
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


