// 
// windows event logへの書き込み方法
// 参考：https://docs.microsoft.com/ja-jp/windows/win32/eventlog/reporting-an-event
//

#include <iostream>
#include <windows.h>
#include <winbase.h>

#include "../event-resource/provider.h"

#define EventSource L"RAS_INFO"

int main()
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
}


