# ---------------------------------------------------------
# MIND-XAI | SENTINEL (Silent Guardian v5.0)
# Features: Auto-Deduct, Silent Fix, Smart Sync
# ---------------------------------------------------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Configuration
$url = "https://raw.githubusercontent.com/Mind-Xai/mindx-ai/main/command.txt"
$junkLimitMB = 500  # Agar 500MB se zyada kachra hua, toh Auto-Clean chalega

Clear-Host
Write-Host " MIND-XAI SENTINEL ACTIVATED..." -ForegroundColor Cyan
Write-Host "   Mode: Silent Monitoring & Auto-Fix" -ForegroundColor DarkGray
Write-Host "--------------------------------------------"

function Silent-Clean {
    param($Reason)
    Write-Host "[$(Get-Date -Format 'HH:mm')]  $Reason Detected. Cleaning..." -ForegroundColor Yellow
    
    # Silent Cleanup Operation
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    ipconfig /flushdns | Out-Null
    
    Write-Host "    System Optimized. No Disturbance." -ForegroundColor Green
}

function Reset-Cloud {
    Write-Host "    Syncing Cloud Status to WAIT..." -ForegroundColor DarkGray
    git pull origin main | Out-Null
    Set-Content -Path "command.txt" -Value "WAIT"
    git add command.txt
    git commit -m "Sentinel Auto-Reset" | Out-Null
    git push origin main | Out-Null
}

# --- INFINITE MONITORING LOOP ---
while($true) {
    try {
        # 1. CHECK: Remote Command (GitHub)
        $web = New-Object Net.WebClient
        $random = Get-Random
        $status = $web.DownloadString("$url?t=$random").Trim()

        if ($status -eq "RUN") {
            Silent-Clean -Reason "Remote Command"
            Reset-Cloud
            Write-Host "    Cooling down for 30 seconds..." -ForegroundColor Gray
            Start-Sleep -Seconds 30
        }

        # 2. CHECK: Auto-Deduct (Local Health)
        # Check Temp Folder Size
        $tempSize = (Get-ChildItem "$env:TEMP" -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB
        
        if ($tempSize -gt $junkLimitMB) {
            Silent-Clean -Reason "High Junk ($([math]::Round($tempSize))MB)"
        }

        # Heartbeat (Zinda hai par shor nahi karega)
        Write-Host "." -NoNewline -ForegroundColor DarkGray
    }
    catch {
        # Silent Error Handling (Log only)
    }
    
    # Har 10 second baad check karega
    Start-Sleep -Seconds 10
}
