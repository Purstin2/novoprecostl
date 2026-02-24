# Script para conectar o projeto ao GitHub
# Execute este script após criar o repositório no GitHub

Write-Host "🚀 Conectando projeto ao GitHub..." -ForegroundColor Cyan
Write-Host ""

# Solicita o nome de usuário do GitHub
$githubUser = Read-Host "Digite seu nome de usuário do GitHub"

if ([string]::IsNullOrWhiteSpace($githubUser)) {
    Write-Host "❌ Nome de usuário não pode estar vazio!" -ForegroundColor Red
    exit 1
}

# Nome do repositório
$repoName = "mega-universo-stl"

Write-Host ""
Write-Host "📋 Configuração:" -ForegroundColor Yellow
Write-Host "   Usuário: $githubUser" -ForegroundColor White
Write-Host "   Repositório: $repoName" -ForegroundColor White
Write-Host ""

# Verifica se já existe um remote
$existingRemote = git remote get-url origin 2>$null

if ($existingRemote) {
    Write-Host "⚠️  Já existe um remote 'origin' configurado:" -ForegroundColor Yellow
    Write-Host "   $existingRemote" -ForegroundColor White
    $overwrite = Read-Host "Deseja sobrescrever? (s/N)"
    if ($overwrite -ne "s" -and $overwrite -ne "S") {
        Write-Host "❌ Operação cancelada." -ForegroundColor Red
        exit 0
    }
    git remote remove origin
}

# Adiciona o remote origin
$repoUrl = "https://github.com/$githubUser/$repoName.git"
Write-Host "🔗 Adicionando remote origin: $repoUrl" -ForegroundColor Cyan
git remote add origin $repoUrl

# Verifica se foi adicionado
Write-Host ""
Write-Host "✅ Remote adicionado com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Remotes configurados:" -ForegroundColor Yellow
git remote -v

Write-Host ""
Write-Host "📝 Renomeando branch para 'main'..." -ForegroundColor Cyan
git branch -M main

Write-Host ""
Write-Host "✅ Configuração concluída!" -ForegroundColor Green
Write-Host ""
Write-Host "📤 Próximos passos:" -ForegroundColor Yellow
Write-Host "   1. Crie o repositório no GitHub: https://github.com/new" -ForegroundColor White
Write-Host "   2. Nome do repositório: $repoName" -ForegroundColor White
Write-Host "   3. NÃO inicialize com README (já temos um)" -ForegroundColor White
Write-Host "   4. Após criar, execute: git push -u origin main" -ForegroundColor White
Write-Host ""

$pushNow = Read-Host "Deseja fazer push agora? (s/N)"

if ($pushNow -eq "s" -or $pushNow -eq "S") {
    Write-Host ""
    Write-Host "📤 Fazendo push para o GitHub..." -ForegroundColor Cyan
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Push realizado com sucesso!" -ForegroundColor Green
        Write-Host "🌐 Acesse: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
    } else {
        Write-Host ""
        Write-Host "❌ Erro ao fazer push. Verifique:" -ForegroundColor Red
        Write-Host "   - Se o repositório foi criado no GitHub" -ForegroundColor White
        Write-Host "   - Se você tem permissão para fazer push" -ForegroundColor White
        Write-Host "   - Se suas credenciais estão corretas" -ForegroundColor White
    }
} else {
    Write-Host ""
    Write-Host "💡 Execute manualmente quando estiver pronto:" -ForegroundColor Yellow
    Write-Host "   git push -u origin main" -ForegroundColor White
}

Write-Host ""
