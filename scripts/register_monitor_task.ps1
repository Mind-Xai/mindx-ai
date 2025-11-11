<#
  register_monitor_task.ps1
  - Registers a per-user scheduled task that runs the service monitor at logon.
  - Does not require elevated privileges.
#>

$taskName = 'MindX-Service-Monitor'
$scriptPath = Join-Path (Get-Location) 'scripts\monitor_services.ps1'

if (-not (Test-Path $scriptPath)) {
    Write-Error "Monitor script not found at $scriptPath"
    exit 1
}

$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited

Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal -Force

Write-Output "Registered scheduled task '$taskName' to run monitor at logon."
