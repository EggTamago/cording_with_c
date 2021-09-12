
#
# cpu resource check
#

#header
function showHeader {
        Write-Host ""
        Write-Host "========================================================="
        Write-Host "= core0 = core1 = core2 = core3 = core4 = core5 = total ="
        Write-Host "========================================================="
    }

function showContext {
    Param([int]$Arg1,
          [int]$Arg2,
          [int]$Arg3,
          [int]$Arg4,
          [int]$Arg5,
          [int]$Arg6,
          [int]$Arg7
        )
        Write-Host "=  $Arg1  =  $Arg2  =  $Arg3  =  $Arg4  =  $Arg5  =  $Arg6  =  $Arg7  ="
    }

# ������4���ɕύX
function changeDigits {
    Param([int]$Arg
    )
    return "{0:D3}" -f $Arg
}


function getCPUInfo {    
    # CPU���擾
    $cpuInfo = Get-WmiObject -ComputerName localhost Win32_PerfFormattedData_PerfOS_Processor
    return $cpuInfo        
}


function getCPUUsage {    
    # CPU�g�p���擾
    $cpuUsage = getCPUInfo | Select Name,PercentProcessorTime
    return $cpuUsage
}


function getCoreNum {
    # CPU�̃R�A���擾
    $cpuNum = ( getCPUUsage | Measure-Object).Count
    return [int]$cpuNum
}


function getCoreUsage {
    $usage = getCPUUsage
    $coreNum = getCoreNum

    # �e�R�A�̎g�p���������z��̍쐬
    $data = @('','','','','','','')


    for ([int]$i=0; $i -lt $coreNum; $i++) {

        $data[$i] =  Write-Output ($usage.PercentProcessorTime)[$i]
    }

    return $data
}


function main {

    $showData = getCoreUsage
    $coreNum = getCoreNum

    # digit�ϊ�
    for ($i=0; $i -lt $coreNum; $i++) {
        $showData[$i] = changeDigits($showData[$i]) 
    }
    
    showHeader

    while($true){
    $showData = getCoreUsage
    showContext $showData[0] $showData[1] $showData[2] $showData[3] $showData[4] $showData[5] $showData[6]
    sleep(3)
    }

}

main

