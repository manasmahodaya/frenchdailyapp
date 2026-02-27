param(
  [int]$Port = 8787
)

$ErrorActionPreference = "Stop"

Set-Location "C:\Users\manas\OneDrive\Desktop\French-daily-app"

Write-Host "Checking port $Port..."
$listeners = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
if ($listeners) {
  $pids = $listeners | Select-Object -ExpandProperty OwningProcess -Unique
  foreach ($pid in $pids) {
    try {
      Stop-Process -Id $pid -Force -ErrorAction Stop
      Write-Host "Stopped process $pid on port $Port."
    } catch {
      Write-Host "Could not stop process $pid: $($_.Exception.Message)"
    }
  }
}

Write-Host "Installing dependencies if needed..."
npm install

Write-Host "Building production assets..."
npm run build:prod

Write-Host "Starting production server on port $Port..."
$env:PORT = "$Port"
node backend/server.mjs
