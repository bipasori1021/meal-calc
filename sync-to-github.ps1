# OneDrive 폴더 내 GitHub 저장소 경로 설정
$repoPath = "C:\Users\82102\OneDrive\01 개인\01 운동\식단 계산기\web-data"

# 저장소로 이동
cd $repoPath

# Git 상태 확인
$gitStatus = git status --porcelain

# 변경 사항이 있는 경우에만 git push 실행
if ($gitStatus -ne "") {
    Write-Host "🚀 변경 사항 감지됨! GitHub에 자동 푸시 중..."
    git add .
    git commit -m "Auto-sync from OneDrive1111"
    git push origin main
    Write-Host "✅ GitHub 업데이트 완료!"
} else {
    Write-Host "📂 변경 사항 없음. 푸시하지 않음."
}
