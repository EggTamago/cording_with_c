
#
# disk resource check
#

# �f�B���N�g�����Ȃ���΍쐬
if (!(Test-Path C:\testdir)) {
    New-Item C:\testdir -ItemType Directory
}

# register event resource 
New-EventLog -LogName Application -Source "RAS_INFO_PS" -ErrorAction SilentlyContinue


while ($true) {

    try{
        # �f�B�X�N���擾 
        $diskInfo = Get-PSDrive -PSProvider FileSystem
    } catch {
        echo "fail to get disk info"
        sleep(10)
        continue
    }


    # �f�B�X�N���g�p��
    $unusingDisk = $diskInfo | Select-Object "Free" | %{((($_.Free) / 1024) / 1024) / 1024} # byte to GB

    # �f�B�X�N�g�p��
    $usedDisk = $diskInfo | Select-Object "Used" | %{((($_.Used) / 1024) / 1024) / 1024} # byte to GB

    # �f�B�X�N�g�p��
    $zeroDivCheck = $usedDisk + $unusingDisk
    if ( $zeroDivCheck -eq 0) {
        echo "zero division error!"
        sleep(3)
        continue
    } else {
        $usedDiskPercent = (($usedDisk / ($usedDisk + $unusingDisk)) * 100)
    }

    $usedDiskPercent

    sleep(3)
}


