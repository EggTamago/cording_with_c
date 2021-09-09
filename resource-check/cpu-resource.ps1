
#
# cpu resource check
#

# �f�B���N�g�����Ȃ���΍쐬
if (!(Test-Path C:\testdir)) {
    New-Item C:\testdir -ItemType Directory
}

# register event resource 
New-EventLog -LogName Application -Source "RAS_INFO_PS" -ErrorAction SilentlyContinue


function showCPU {
    Param($Arg1,
          $Arg2,
          $Arg3,
          $Arg4,
          $Arg5,
          $Arg6
        )
        Write-Output "================================================="
        Write-Output "= core0 = core1 = core2 = core3 = core4 = core5 ="
        Write-Output "================================================="
        Write-Output "= $Arg1 = $Arg2= $Arg3 = $Arg4 = $Arg5 = $Arg6 ="
    }

showCPU

while ($true) {

    # �f�B�X�N���擾 
    $diskInfo = Get-PSDrive -PSProvider FileSystem

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

