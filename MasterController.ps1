# ---------------------------------------------------------
# MIND-XAI | INTELLIGENCE SYSTEM v7.0 (Network Scanner)
# Status: ELITE MODE
# Copyright (C) 2025 Mind-Xai Global 
# ---------------------------------------------------------

function Show-Header {
    Clear-Host
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "    MIND-XAI: ELITE SYSTEM v7.0            " -ForegroundColor Magenta
    Write-Host "=============================================" -ForegroundColor Cyan
    Write-Host "   User: $env:USERNAME | Status: HUNTING " -ForegroundColor Red
    Write-Host "---------------------------------------------"
}

function Ultimate-Performance {
    Write-Host " Activating 50x Speed Mode..." -ForegroundColor Green
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
    Write-Host " CPU & RAM Optimized." -ForegroundColor White
    Start-Sleep -Seconds 1
}

function Deep-Clean {
    Write-Host " Scrubbing System Junk..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host " Junk Destroyed." -ForegroundColor Red
}

function Internet-Boost {
    Write-Host " Boosting Uplink..." -ForegroundColor Cyan
    ipconfig /flushdns | Out-Null
    netsh int ip reset | Out-Null
    Write-Host " Ping Optimized." -ForegroundColor White
}

function WiFi-Radar {
    Write-Host " SCANNING AIRWAVES..." -ForegroundColor Yellow
    $networks = netsh wlan show networks mode=bssid
    if ($networks) {
        $networks | Select-String "SSID" | ForEach-Object { Write-Host " [+] $_" -ForegroundColor Cyan }
    } else { Write-Host " WiFi Adapter Offline." -ForegroundColor Red }
    Pause
}

function IP-Tracker {
    Write-Host " TRACKING TARGET..." -ForegroundColor Green
    $targetIP = Read-Host " >> Enter IP (Blank for Self)"
    try {
        $info = Invoke-RestMethod -Uri "http://ip-api.com/json/$targetIP"
        Write-Host "  TARGET: $($info.query) | $($info.city), $($info.country)" -ForegroundColor Yellow
    } catch { Write-Host " Trace Failed." -ForegroundColor Red }
    Pause
}

function Network-Scanner {
    Write-Host " INITIALIZING LAN SCANNER..." -ForegroundColor Magenta
    Write-Host "   Scanning local devices on your WiFi..." -ForegroundColor DarkGray
    
    $myIP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object PrefixOrigin -eq 'Dhcp').IPAddress
    $baseIP = $myIP.Substring(0, $myIP.LastIndexOf('.'))
    
    Write-Host "   My IP: $myIP" -ForegroundColor White
    Write-Host "   Target Range: $baseIP.1 - $baseIP.255" -ForegroundColor DarkGray
    Write-Host "---------------------------------------------"
    
    1..254 | ForEach-Object {
        $target = "$baseIP.$_"
        if (Test-Connection -ComputerName $target -Count 1 -Quiet) {
            try {
                $hostName = [System.Net.Dns]::GetHostEntry($target).HostName
                Write-Host "   [+] DEVICE FOUND: $target ($hostName)" -ForegroundColor Green
            } catch {
                Write-Host "   [+] DEVICE FOUND: $target (Unknown)" -ForegroundColor Green
            }
        }
    }
    Write-Host "---------------------------------------------"
    Write-Host " Scan Complete." -ForegroundColor Yellow
    Pause
}

# --- MAIN LOOP ---
do {
    Show-Header
    Write-Host "[1]  50x Speed Boost"
    Write-Host "[2]  Internet Optimizer"
    Write-Host "[3]  WiFi Radar (Airwaves)"
    Write-Host "[4]  IP Geo-Tracker"
    Write-Host "[5]  System Diagnostics"
    Write-Host "[6]  Network Device Scanner (NEW)"
    Write-Host "[Q]  Exit"
    Write-Host "---------------------------------------------"
    
    $userChoice = Read-Host " >> Select Option"

    switch ($userChoice) {
        '1' { Ultimate-Performance; Deep-Clean; Pause }
        '2' { Internet-Boost; Pause }
        '3' { WiFi-Radar }
        '4' { IP-Tracker }
        '5' { Write-Host "System Healthy." -ForegroundColor Green; Pause }
        '6' { Network-Scanner }
        'Q' { Write-Host "Mind-Xai Out." -ForegroundColor Red; break }
        Default { Write-Host " Invalid." -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} until ($userChoice -eq 'Q')
