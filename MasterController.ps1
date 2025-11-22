# ---------------------------------------------------------
# MIND-XAI | INTELLIGENCE SYSTEM v5.0 (Diagnostics)
# Status: READY FOR GLOBAL DEPLOYMENT
# Copyright (C) 2025 Mind-Xai Global 
# ---------------------------------------------------------

function Show-Header {
    Clear-Host
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "    MIND-XAI: INTELLIGENCE SYSTEM v5.0     " -ForegroundColor Magenta
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "   User: $env:USERNAME | Status: READY " -ForegroundColor DarkGray
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
    $networks = netsh wlan show networks mode=bssid
    if ($networks) {
        Write-Host "---------------------------------------------"
        $networks | Select-String "SSID" | ForEach-Object { Write-Host " [+] $_" -ForegroundColor Cyan }
        Write-Host " Scan Complete." -ForegroundColor Yellow
    } else { Write-Host " WiFi Adapter Offline." -ForegroundColor Red }
}

function IP-Tracker {
    Write-Host " GLOBAL GEO-TRACKER ACTIVATED..." -ForegroundColor Green
    $targetIP = Read-Host " >> Enter IP Address (Press Enter for MY IP)"
    try {
        $info = Invoke-RestMethod -Uri "http://ip-api.com/json/$targetIP"
        Write-Host "---------------------------------------------"
        Write-Host "  TARGET LOCKED " -ForegroundColor Red
        Write-Host " [+] IP Address : $($info.query)" -ForegroundColor White
        Write-Host " [+] Country    : $($info.country)" -ForegroundColor Yellow
        Write-Host " [+] City       : $($info.city)" -ForegroundColor Yellow
        Write-Host " [+] ISP        : $($info.isp)" -ForegroundColor Cyan
    } catch { Write-Host " Error. Check Internet." -ForegroundColor Red }
    Pause
}

function System-Report {
    Write-Host " GENERATING SYSTEM DIAGNOSTICS..." -ForegroundColor Magenta
    Write-Host "---------------------------------------------"
    Write-Host " [+] OS Version: $([System.Environment]::OSVersion.VersionString)" -ForegroundColor White
    Write-Host " [+] Processor : $(Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name)" -ForegroundColor White
    $mem = Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
    $totalGB = [math]::Round($mem.Sum / 1GB, 2)
    Write-Host " [+] Total RAM : $($totalGB) GB" -ForegroundColor White
    Write-Host " [+] User Name : $($env:USERNAME)" -ForegroundColor White
    Write-Host "---------------------------------------------"
    Pause
}

# --- MAIN LOOP ---
do {
    Show-Header
    Write-Host "[1]  Activate 50x Speed Mode (Clean & Power)"
    Write-Host "[2]  Fix Internet & Ping"
    Write-Host "[3]  WiFi Radar (Scan Networks)"
    Write-Host "[4]  IP Geo-Tracker (Locate Target)"
    Write-Host "[5]  SYSTEM DIAGNOSTICS (System Report)"
    Write-Host "[Q]  Exit"
    Write-Host "---------------------------------------------"
    
    $userChoice = Read-Host " >> Select Option"

    switch ($userChoice) {
        '1' { Ultimate-Performance; Deep-Clean; Pause }
        '2' { Internet-Boost; Pause }
        '3' { WiFi-Radar; Pause }
        '4' { IP-Tracker }
        '5' { System-Report }
        'Q' { Write-Host "Mind-Xai Signing Off..." -ForegroundColor Red; break }
        Default { Write-Host " Invalid Command" -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($userChoice -eq 'Q')
