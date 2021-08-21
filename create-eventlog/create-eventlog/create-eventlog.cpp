// 
// windows event logへの書き込み方法
// 参考：https://docs.microsoft.com/ja-jp/windows/win32/eventlog/reporting-an-event
// 参考 : https://togarasi.wordpress.com/2008/05/24/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88%E3%83%AD%E3%82%B0%E3%81%A7%E4%BD%BF%E3%81%86%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB-dll%E3%82%92%E4%BD%9C%E6%88%90/
//


#include <iostream>
#include <windows.h>
#include <winbase.h>

#include "../event-resource/provider.h"

#define EventSource  L"RAS_INFO"

void main(void)
{

	HANDLE hEvent;
	BOOL Status;

	/* イベントログのオープン */
	hEvent = RegisterEventSource(NULL, EventSource);
	if (hEvent == NULL) {
		printf("can not create event handle\n");
	};

	/* イベントログへ書き込み*/
	Status = ReportEvent(
		hEvent,
		EVENTLOG_INFORMATION_TYPE,
		0,
		MSG_MEMORY_ERROR,
		NULL,
		0,
		0,
		NULL,
		NULL);

	/* イベントログのクローズ */
	DeregisterEventSource(hEvent);

	Sleep(3 * 1000);
}


