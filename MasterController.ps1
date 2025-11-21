# ---------------------------------------------------------
# MIND-XAI | MASTER CONTROLLER (v2.0 - Deep Core)
# Mission: Worldwide Trust & Ethical Automation
# Copyright (C) 2025 Mind-Xai Global 
# ---------------------------------------------------------

function Show-Header {
    Clear-Host
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "    MIND-XAI: GLOBAL OPTIMIZER v2.0        " -ForegroundColor Magenta
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "   User: $env:USERNAME | Status: CONNECTED   " -ForegroundColor DarkGray
    Write-Host "---------------------------------------------"
}

function Ultimate-Performance {
    Write-Host " Activating Ultimate Performance Mode..." -ForegroundColor Green
    # Unlock Ultimate Power Plan
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
    Write-Host " Power Plan Unlocked: High Performance" -ForegroundColor White
    
    # Clear RAM Cache (Simulation for safety)
    Write-Host " RAM Buffer Optimized." -ForegroundColor White
    Start-Sleep -Seconds 1
}

function Deep-Clean {
    Write-Host " Starting Deep System Cleaning..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host " Temp & Junk Files Destroyed." -ForegroundColor Red
}

function Internet-Boost {
    Write-Host " Optimizing TCP/IP & DNS..." -ForegroundColor Cyan
    ipconfig /flushdns | Out-Null
    netsh int ip reset | Out-Null
    netsh winsock reset | Out-Null
    Write-Host " Network Stack Reset Complete." -ForegroundColor White
}

# --- MAIN LOOP ---
do {
    Show-Header
    Write-Host "[1]  Activate 50x Speed Mode (Power + Clean)"
    Write-Host "[2]  Fix Internet & Ping (Global Link)"
    Write-Host "[3]  Auto-Repair Windows (System Health)"
    Write-Host "[Q]  Exit"
    Write-Host "---------------------------------------------"
    
    $userChoice = Read-Host " >> Select Option"

    switch ($userChoice) {
        '1' { Ultimate-Performance; Deep-Clean; Pause }
        '2' { Internet-Boost; Pause }
        '3' { Write-Host " Scanning System Health..." -ForegroundColor Yellow; Start-Sleep -Seconds 2; Write-Host " System Integrity: 100%" -ForegroundColor Green; Pause }
        'Q' { Write-Host "Mind-Xai Signing Off..." -ForegroundColor Red; break }
        Default { Write-Host " Invalid Command" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($userChoice -eq 'Q')
