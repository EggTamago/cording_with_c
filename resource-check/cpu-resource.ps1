
#
# cpu resource check
#

#header
function showCPU {
    Param([int]$Arg1,
          [int]$Arg2,
          [int]$Arg3,
          [int]$Arg4,
          [int]$Arg5,
          [int]$Arg6,
          [int]$Arg7
        )
        Write-Host ""
        Write-Host "========================================================="
        Write-Host "= core0 = core1 = core2 = core3 = core4 = core5 = total ="
        Write-Host "========================================================="
        Write-Host "=  $Arg1  =  $Arg2  =  $Arg3  =  $Arg4  =  $Arg5  =  $Arg6  =  $Arg7  ="
    }

# ������4���ɕύX
function changeDigits {
    Param([int]$Arg1
    )
    "{0:D3}" -f $Arg1
}

changeDigits 100
showCPU 100 100 100 100 100 100 100

<#
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

#>