# register event resource 
New-EventLog -LogName Application -Source "RAS_INFO_PS" -ErrorAction SilentlyContinue

while ($true) {
    # �������g�p��
    $usingMemory = Get-WmiObject Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize) * 100}
    $usingMemory
}

# �������g�p��
$usingMemory = Get-WmiObject Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize) * 100}


if (0 -lt $usingMemory -lt 30) {
    echo "under 50"
    Write-EventLog -LogName Application -Source "RAS_INFO_PS" -EventId 123 -EntryType Information -Category 0 -Message "���������ꂭ�炢�g���Ă�� $usingMemory"
} elseif (30 -le $usingMemory -and $usingMemory -lt 80) {
    echo "between 30 to 80"
    Write-EventLog -LogName Application -Source "RAS_INFO_PS" -EventId 456 -EntryType Information -Category 0 -Message "���������ꂭ�炢�g���Ă�� $usingMemory"
} else {
    echo "why?"
}


# �f�B�X�N�g�p�� 
$unusingDisk = Get-PSDrive -PSProvider FileSystem
$unusingDisk | Select-Object "Free" | %{((($_.Free) / 1024) / 1024) / 1024} # byte to GB