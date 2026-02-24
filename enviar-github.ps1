# Script para enviar mudanças para o GitHub - Repositório: Nnova-pasta
Write-Host "🚀 Conectando ao GitHub e enviando mudanças..." -ForegroundColor Cyan
Write-Host ""

# Verifica se Git está disponível
$gitPath = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitPath) {
    Write-Host "❌ Git não encontrado no PATH!" -ForegroundColor Red
    Write-Host "   Por favor, instale o Git ou adicione ao PATH." -ForegroundColor Yellow
    Write-Host "   Download: https://git-scm.com/download/win" -ForegroundColor Cyan
    exit 1
}

# Solicita o nome de usuário do GitHub
$githubUser = Read-Host "Digite seu nome de usuário do GitHub"

if ([string]::IsNullOrWhiteSpace($githubUser)) {
    Write-Host "❌ Nome de usuário não pode estar vazio!" -ForegroundColor Red
    exit 1
}

# Nome do repositório
$repoName = "Nnova-pasta"

Write-Host ""
Write-Host "📋 Configuração:" -ForegroundColor Yellow
Write-Host "   Usuário: $githubUser" -ForegroundColor White
Write-Host "   Repositório: $repoName" -ForegroundColor White
Write-Host ""

# Verifica se já existe um repositório Git
if (-not (Test-Path ".git")) {
    Write-Host "📦 Inicializando repositório Git..." -ForegroundColor Cyan
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erro ao inicializar repositório Git!" -ForegroundColor Red
        exit 1
    }
}

# Verifica se já existe um remote
$existingRemote = git remote get-url origin 2>$null

if ($existingRemote) {
    Write-Host "⚠️  Já existe um remote 'origin' configurado:" -ForegroundColor Yellow
    Write-Host "   $existingRemote" -ForegroundColor White
    $overwrite = Read-Host "Deseja atualizar para o novo repositório? (s/N)"
    if ($overwrite -eq "s" -or $overwrite -eq "S") {
        git remote remove origin
    } else {
        Write-Host "✅ Mantendo remote existente." -ForegroundColor Green
    }
}

# Adiciona o remote se não existir
if (-not (git remote get-url origin 2>$null)) {
    $repoUrl = "https://github.com/$githubUser/$repoName.git"
    Write-Host "🔗 Adicionando remote origin: $repoUrl" -ForegroundColor Cyan
    git remote add origin $repoUrl
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erro ao adicionar remote!" -ForegroundColor Red
        exit 1
    }
}

# Verifica branch atual
$currentBranch = git branch --show-current 2>$null
if (-not $currentBranch) {
    Write-Host "📝 Criando branch 'main'..." -ForegroundColor Cyan
    git checkout -b main
} else {
    Write-Host "📝 Branch atual: $currentBranch" -ForegroundColor Cyan
    if ($currentBranch -ne "main") {
        $rename = Read-Host "Deseja renomear para 'main'? (s/N)"
        if ($rename -eq "s" -or $rename -eq "S") {
            git branch -M main
        }
    }
}

# Adiciona todos os arquivos
Write-Host ""
Write-Host "📦 Adicionando arquivos ao staging..." -ForegroundColor Cyan
git add .

# Verifica se há mudanças para commitar
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "ℹ️  Nenhuma mudança para commitar." -ForegroundColor Yellow
} else {
    Write-Host "✅ Arquivos adicionados!" -ForegroundColor Green
    Write-Host ""
    
    # Faz commit
    $commitMessage = "Atualização: melhorias no design e funcionalidades"
    Write-Host "💾 Fazendo commit: $commitMessage" -ForegroundColor Cyan
    git commit -m $commitMessage
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Erro ao fazer commit!" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "✅ Commit realizado com sucesso!" -ForegroundColor Green
}

# Faz push
Write-Host ""
Write-Host "📤 Enviando para o GitHub..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Push realizado com sucesso!" -ForegroundColor Green
    Write-Host "🌐 Repositório: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Erro ao fazer push. Possíveis causas:" -ForegroundColor Red
    Write-Host "   - Repositório não existe no GitHub" -ForegroundColor White
    Write-Host "   - Problemas de autenticação" -ForegroundColor White
    Write-Host "   - Conflitos com código remoto" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 Tente:" -ForegroundColor Yellow
    Write-Host "   1. Criar o repositório 'Nnova-pasta' no GitHub" -ForegroundColor White
    Write-Host "   2. Verificar suas credenciais Git" -ForegroundColor White
    Write-Host "   3. Executar: git pull origin main --allow-unrelated-histories" -ForegroundColor White
}

Write-Host ""
