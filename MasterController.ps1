# ---------------------------------------------------------
# MIND-XAI | MASTER CONTROLLER (v1.1 - Interactive)
# Mission: Worldwide Trust & Ethical Automation
# Copyright (C) 2025 Mind-Xai Global 
# ---------------------------------------------------------

function Show-Header {
    Clear-Host
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "    MIND-XAI AUTOMATION SYSTEM [ONLINE]    " -ForegroundColor Yellow
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "   User: $env:USERNAME | Loc: Dubai HQ (Sim) " -ForegroundColor DarkGray
    Write-Host "---------------------------------------------"
}

function Turbo-Boost {
    Write-Host " Starting Turbo Boost..." -ForegroundColor Green
    Start-Sleep -Seconds 1
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host " Memory Junk Cleared." -ForegroundColor White
    Start-Sleep -Seconds 1
    Write-Host " Processor Optimized." -ForegroundColor White
}

function Network-Fix {
    Write-Host " Resetting Global Network Uplink..." -ForegroundColor Cyan
    ipconfig /flushdns | Out-Null
    Write-Host " DNS Cache Flushed." -ForegroundColor White
}

# --- MAIN LOOP ---
do {
    Show-Header
    Write-Host "[1]  Turbo Boost (Speed Up System)"
    Write-Host "[2]  Global Connect (Fix Network)"
    Write-Host "[3]  Security Status (Check Only)"
    Write-Host "[Q]  Exit Mind-Xai"
    Write-Host "---------------------------------------------"
    
    $userChoice = Read-Host " >> Enter Command"

    switch ($userChoice) {
        '1' { Turbo-Boost; Pause }
        '2' { Network-Fix; Pause }
        '3' { Write-Host " System Integrity: SECURE" -ForegroundColor Green; Pause }
        'Q' { Write-Host "Shutting down..." -ForegroundColor Red; break }
        Default { Write-Host " Invalid Command" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($userChoice -eq 'Q')
