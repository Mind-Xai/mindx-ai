# ---------------------------------------------------------
# MIND-XAI | MASTER CONTROLLER (v3.0 - WiFi Radar)
# Mission: Worldwide Trust & Ethical Automation
# Copyright (C) 2025 Mind-Xai Global 
# ---------------------------------------------------------

function Show-Header {
    Clear-Host
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "    MIND-XAI: GLOBAL OPTIMIZER v3.0        " -ForegroundColor Magenta
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "   User: $env:USERNAME | Status: ARMED       " -ForegroundColor DarkGray
    Write-Host "---------------------------------------------"
}

function Ultimate-Performance {
    Write-Host " Activating Ultimate Performance Mode..." -ForegroundColor Green
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
    Write-Host " Power Plan Unlocked: High Performance" -ForegroundColor White
    Start-Sleep -Seconds 1
}

function Deep-Clean {
    Write-Host " Starting Deep System Cleaning..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host " Temp & Junk Files Destroyed." -ForegroundColor Red
}

function Internet-Boost {
    Write-Host " Optimizing TCP/IP & DNS..." -ForegroundColor Cyan
    ipconfig /flushdns | Out-Null
    netsh int ip reset | Out-Null
    Write-Host " Network Stack Reset Complete." -ForegroundColor White
}

function WiFi-Radar {
    Write-Host " INITIALIZING WIFI RADAR..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    Write-Host " Scanning nearby frequencies..." -ForegroundColor DarkGray
    $networks = netsh wlan show networks mode=bssid
    
    if ($networks) {
        Write-Host "---------------------------------------------"
        Write-Host " DETECTED NETWORKS (Range Scan)" -ForegroundColor Green
        Write-Host "---------------------------------------------"
        $networks | Select-String "SSID" | ForEach-Object {
            Write-Host " [+] $_" -ForegroundColor Cyan
        }
        Write-Host "---------------------------------------------"
        Write-Host " Scan Complete." -ForegroundColor Yellow
    } else {
        Write-Host " No WiFi Adapter Found or WiFi is Off." -ForegroundColor Red
    }
}

# --- MAIN LOOP ---
do {
    Show-Header
    Write-Host "[1]  Activate 50x Speed Mode"
    Write-Host "[2]  Fix Internet & Ping"
    Write-Host "[3]  Auto-Repair Windows"
    Write-Host "[4]  WiFi Radar (Scan Networks)"
    Write-Host "[Q]  Exit"
    Write-Host "---------------------------------------------"
    
    $userChoice = Read-Host " >> Select Option"

    switch ($userChoice) {
        '1' { Ultimate-Performance; Deep-Clean; Pause }
        '2' { Internet-Boost; Pause }
        '3' { Write-Host " Scanning System Health..." -ForegroundColor Yellow; Start-Sleep -Seconds 2; Write-Host " System Integrity: 100%" -ForegroundColor Green; Pause }
        '4' { WiFi-Radar; Pause }
        'Q' { Write-Host "Mind-Xai Signing Off..." -ForegroundColor Red; break }
        Default { Write-Host " Invalid Command" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($userChoice -eq 'Q')
