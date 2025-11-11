Write-Output 'Starting portable Node install and build (non-admin)...'
Set-Location 'C:\Users\mindx\OneDrive\Documents\GitHub\mindx-ai'

$index = Invoke-RestMethod -Uri 'https://nodejs.org/dist/index.json' -UseBasicParsing
$lts = $index | Where-Object { $_.lts -ne $null -and $_.lts -ne '' } | Select-Object -First 1
if (-not $lts) { Write-Error 'Could not find LTS version'; exit 2 }

$version = $lts.version
Write-Output "Selected Node version: $version (lts=$($lts.lts))"

$zipUrl = "https://nodejs.org/dist/$version/node-$version-win-x64.zip"
$tmp = Join-Path $env:TEMP ('node-' + ($version -replace '^v','') + '.zip')
Write-Output "Downloading $zipUrl to $tmp"
Invoke-WebRequest -Uri $zipUrl -OutFile $tmp

$extractRoot = Join-Path $env:USERPROFILE 'nodejs'
If (-Not (Test-Path $extractRoot)) { New-Item -ItemType Directory -Path $extractRoot | Out-Null }
Write-Output "Extracting to $extractRoot"
Expand-Archive -LiteralPath $tmp -DestinationPath $extractRoot -Force
Remove-Item $tmp -Force

$entries = Get-ChildItem -Path $extractRoot -Directory
if ($entries.Count -lt 1) { Write-Error 'Extraction failed'; exit 3 }

$nodeFolder = $entries[0].FullName
Write-Output "Node folder: $nodeFolder"

$binPath = $nodeFolder
$env:Path = "$binPath;$env:Path"

Write-Output 'Node and npm from portable install:'
Write-Output (node -v)
Write-Output (npm -v)

Write-Output 'Running npm install...'
npm install

Write-Output 'Running npm run build...'
npm run build

Write-Output 'Running npm test...'
npm test

Write-Output 'Done.'
