
#
# memory resource check
#

# �f�B���N�g�����Ȃ���΍쐬
if (!(Test-Path C:\testdir)) {
    New-Item C:\testdir -ItemType Directory
}

# register event resource 
New-EventLog -LogName Application -Source "RAS_INFO_PS" -ErrorAction SilentlyContinue

while ($true) {
    # �������g�p��
    $usingMemory = Get-WmiObject Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize) * 100}

    if (0 -lt $usingMemory -lt 30) {
        echo "under 30"
        Write-EventLog -LogName Application -Source "RAS_INFO_PS" -EventId 123 -EntryType Information -Category 0 -Message "���������ꂭ�炢�g���Ă�� $usingMemory"
    } elseif (30 -le $usingMemory -and $usingMemory -lt 80) {
        echo "between 30 to 80"
        Write-EventLog -LogName Application -Source "RAS_INFO_PS" -EventId 456 -EntryType Information -Category 0 -Message "���������ꂭ�炢�g���Ă�� $usingMemory"
    } else {
        echo "high memory usage"
    }
    
    sleep(3)
}

