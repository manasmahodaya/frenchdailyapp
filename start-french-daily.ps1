Set-Location "C:\Users\manas\OneDrive\Desktop\French-daily-app"

Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd 'C:\Users\manas\OneDrive\Desktop\French-daily-app'; npm run server"
Start-Sleep -Seconds 2
Start-Process pwsh -ArgumentList "-NoExit", "-Command", "cd 'C:\Users\manas\OneDrive\Desktop\French-daily-app'; npm run dev"

Write-Host "French Daily started."
Write-Host "Backend:  http://localhost:8787/api/health"
Write-Host "Frontend: http://localhost:5173/"
