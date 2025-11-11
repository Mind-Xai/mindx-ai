Write-Output 'Starting local stack: Firebase Hosting emulator + HF service'
Set-Location 'C:\Users\mindx\OneDrive\Documents\GitHub\mindx-ai'

# Ensure python requirements installed for HF service
Write-Output 'Installing Python requirements (if any) ...'
python -m pip install --upgrade pip
if (Test-Path '.\requirements.txt') { python -m pip install -r requirements.txt }

# Install firebase-tools locally if missing
if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
  Write-Output 'npx not found. Ensure Node/npm in PATH or run the portable installer script.'
}

Write-Output 'Installing firebase-tools locally (npx will use local install if present)'
npm install firebase-tools --no-audit --no-fund

# Start HF Flask service in background
Write-Output 'Starting HF Flask service (background)...'
Start-Process -NoNewWindow -FilePath "python" -ArgumentList "src/hf_service.py" -WindowStyle Hidden

# Start Firebase Hosting emulator
Write-Output 'Starting Firebase Hosting emulator (background)...'
Start-Process -NoNewWindow -FilePath "npx" -ArgumentList "firebase emulators:start --only hosting" -WindowStyle Hidden

Write-Output 'Local stack started. HF service at http://localhost:5000, Hosting emulator (default) at http://localhost:5000 or as shown in emulator output.'
