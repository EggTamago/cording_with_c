# �������g�p��
$usingMemory = Get-WmiObject Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize) * 100}
$usingMemory

# �f�B�X�N�g�p�� 
$unusingDisk = Get-PSDrive -PSProvider FileSystem
$unusingDisk | Select-Object "Free" |%{((($_.Free) / 1024) / 1024) / 1024}