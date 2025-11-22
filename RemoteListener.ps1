# ---------------------------------------------------------
# MIND-XAI | REMOTE LISTENER (Smart Sync)
# Status: AUTO-RESET + SYNC FIX
# ---------------------------------------------------------

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Host " SMART ROBOTIC LINK ESTABLISHED..." -ForegroundColor Cyan
Write-Host "   Waiting for signal..." -ForegroundColor Gray
Write-Host "-----------------------------------"

while($true) {
    try {
        $web = New-Object Net.WebClient
        $random = Get-Random
        $url = "https://raw.githubusercontent.com/Mind-Xai/mindx-ai/main/command.txt?t=$random"
        $status = $web.DownloadString($url).Trim()

        if ($status -eq "RUN") {
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')]  COMMAND RECEIVED! Executing..." -ForegroundColor Green
            
            # 1. Script Chalao
            Start-Process "Start-MindXai.bat"
            
            # 2. SYNC FIX: Pehle GitHub se update lo
            Write-Host "    Syncing with Cloud (Pulling)..." -ForegroundColor Cyan
            git pull origin main
            
            # 3. ROBOTIC ACTION: Ab wapis "WAIT" kar do
            Write-Host "    Resetting to WAIT..." -ForegroundColor Yellow
            Set-Content -Path "command.txt" -Value "WAIT"
            git add command.txt
            git commit -m "Auto-Robotic Reset"
            git push origin main
            
            Write-Host "    Reset Complete. System Ready." -ForegroundColor Green
            Start-Sleep -Seconds 10
        }
        else {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
    catch {
        Write-Host "!" -NoNewline -ForegroundColor Red
    }
    
    Start-Sleep -Seconds 5
}
