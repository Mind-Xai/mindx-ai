# ---------------------------------------------------------
# MIND-XAI | SENTINEL (v6.0 - SAFE API MODE)
# ---------------------------------------------------------

# 1. Setup Paths (Absolute Paths for Safety)
$scriptPath = $MyInvocation.MyCommand.Definition
$rootFolder = Split-Path (Split-Path $scriptPath -Parent) -Parent
$logDir = Join-Path $rootFolder "tools\logs"
$logFile = Join-Path $logDir "sentinel.log"

# Ensure Log Directory Exists
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }

# 2. Logging Function
function Log {
    param($msg)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $msg" | Out-File -FilePath $logFile -Append -Encoding UTF8 -ErrorAction SilentlyContinue
}

Log "--- SENTINEL SERVICE STARTED ---"

# 3. API Server Setup
$PORT = 8088
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$PORT/")
$listener.Prefixes.Add("http://127.0.0.1:$PORT/")

try {
    $listener.Start()
    Log "API Listening on Port $PORT"
    
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $response = $context.Response
        $url = $context.Request.Url.LocalPath
        
        # API Logic
        if ($url -eq "/stats") {
            $cpu = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
            $ram = Get-CimInstance Win32_OperatingSystem
            $freeRAM = [math]::Round(($ram.FreePhysicalMemory / 1MB) / 1024, 2)
            $totalRAM = [math]::Round(($ram.TotalVisibleMemorySize / 1MB) / 1024, 2)
            
            $json = "{ ""cpu_usage"": $cpu, ""ram_free"": $freeRAM, ""ram_total"": $totalRAM, ""timestamp"": ""$(Get-Date -Format 'HH:mm:ss')"" }"
            
            $buffer = [System.Text.Encoding]::UTF8.GetBytes($json)
            $response.ContentType = "application/json"
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        } 
        else {
            $response.StatusCode = 404
        }
        $response.Close()
    }
}
catch {
    Log "CRITICAL ERROR: $($_.Exception.Message)"
}
finally {
    if ($listener) { $listener.Stop() }
    Log "Sentinel Stopped."
}

