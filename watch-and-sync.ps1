$repoPath = "C:\Users\82102\OneDrive\01 개인\01 운동\식단 계산기\web-data"
$filter = "*.*"
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $repoPath
$watcher.Filter = $filter
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

Write-Host "📌 OneDrive 폴더 감시 중... 파일 변경 시 GitHub에 자동 업로드됩니다!"

$action = {
    Start-Sleep -Seconds 2  # 변경 사항이 완전히 저장될 시간을 줌
    Write-Host "🚀 변경 감지됨! GitHub에 자동 푸시 중..."
    cd $repoPath
    git add .
    git commit -m "Auto-sync from OneDrive"
    git push origin main
    Write-Host "✅ GitHub 업데이트 완료!"
}

Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Deleted" -Action $action
Register-ObjectEvent $watcher "Renamed" -Action $action

while ($true) { Start-Sleep -Seconds 1 }  # 계속 실행되도록 유지
