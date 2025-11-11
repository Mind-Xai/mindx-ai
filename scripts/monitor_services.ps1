<#
  monitor_services.ps1
  - Runs a lightweight watchdog loop that ensures the local stack is running.
  - Checks Docker compose stack first (if Docker available). If not, checks HF service and Firebase emulator processes and restarts them using provided scripts.
  Usage: run in an elevated or normal user shell. To run continuously, register as a scheduled task (see register_monitor_task.ps1).
#>

Write-Output "Starting service monitor (press Ctrl+C to exit)"

function Test-Port($host, $port) {
    try {
        $r = Test-NetConnection -ComputerName $host -Port $port -WarningAction SilentlyContinue
        return $r.TcpTestSucceeded
    } catch {
        return $false
    }
}

while ($true) {
    # If Docker is available, prefer docker-compose stack
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        Write-Output "Docker available: checking containers..."
        $containers = docker ps --filter "name=mindx_" --format "{{.Names}}" 2>$null
        if (-not $containers) {
            Write-Output "No mindx containers found. Starting docker-compose stack..."
            if (Test-Path "docker-compose.yml") {
                docker-compose up -d --build
            }
        } else {
            Write-Output "mindx containers running: $containers"
        }
    } else {
        # Check HF service on port 5000
        $hfOk = Test-Port -host 'localhost' -port 5000
        if (-not $hfOk) {
            Write-Output "HF service not responding on port 5000. Attempting to start..."
            if (Test-Path 'scripts\install_and_start_full_stack.ps1') {
                Start-Process -FilePath pwsh -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','scripts\install_and_start_full_stack.ps1' -WindowStyle Hidden
            } elseif (Test-Path 'scripts\start_local_stack.ps1') {
                Start-Process -FilePath pwsh -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','scripts\start_local_stack.ps1' -WindowStyle Hidden
            }
        } else {
            Write-Output "HF service responding on port 5000"
        }

        # Check Firebase emulator on 5001 (common alternate) then 5000
        $feOk = Test-Port -host 'localhost' -port 5001
        if (-not $feOk) { $feOk = Test-Port -host 'localhost' -port 5000 }
        if (-not $feOk) {
            Write-Output "Firebase emulator not responding on 5000/5001. Attempting to start via npx..."
            if (Get-Command npx -ErrorAction SilentlyContinue) {
                Start-Process -FilePath npx -ArgumentList 'firebase','emulators:start','--only','hosting' -WindowStyle Hidden
            } else {
                Write-Output "npx not found. Install firebase-tools or ensure Node is available."
            }
        } else {
            Write-Output "Firebase emulator responding"
        }
    }

    Start-Sleep -Seconds 30
}
