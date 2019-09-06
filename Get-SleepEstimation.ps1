function Get-SleepEstimation  {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [datetime]$FallAsleep,
        [Parameter(Mandatory = $true)]
        [datetime]$WakeUp        
    )    
    begin {
        #[datetime]$sleepengTime
    }
    
    process {
            try {
                $sleepengTime = $WakeUp - $FallAsleep
                $sleepengTime = [math]::Abs($sleepengTime.Hours)
                if($sleepengTime -ge 8)
                {
                    Write-Host "You are slept enough"
                }
                elseIf($sleepengTime -eq 0)
                {
                    throw "Wrong data, or You are sleeping less than one hour"
                }
                else
                {
                    Write-Host "You are slept not enough"
                }                
                if($WakeUp.Hour -gt 4 -and $WakeUp.Hour -lt 6 `
                -and $FallAsleep.Hour -gt 20 -and $FallAsleep.Hour -lt 22){
                    Write-Host "And You are lark"
                }
                elseif($WakeUp.Hour -gt 8 -and $WakeUp.Hour -lt 10 `
                -and $FallAsleep.Hour -gt 0 -and $FallAsleep.Hour -lt 8){
                    Write-Host "And You are owl"
                }
                else
                {
                    Write-Host "Do something with your sleeping mode!"
                }
            }
            catch {
                if($_.Exception.WasThrownFromThrowStatement){
                    Get-SleepEstimation
                    return
                }  
                else 
                {
                    Write-Host Error
                }
            }
    }
    
    end {

    }
}