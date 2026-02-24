# Script simplificado para enviar ao GitHub
# Repositório: Nnova-pasta

Write-Host "=== Enviar para GitHub: Nnova-pasta ===" -ForegroundColor Cyan
Write-Host ""

# Tenta encontrar Git em locais comuns
$gitPaths = @(
    "git",
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\bin\git.exe"
)

$gitCmd = $null
foreach ($path in $gitPaths) {
    $cmd = Get-Command $path -ErrorAction SilentlyContinue
    if ($cmd) {
        $gitCmd = $cmd.Path
        break
    }
}

if (-not $gitCmd) {
    Write-Host "ERRO: Git nao encontrado!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Por favor, instale o Git:" -ForegroundColor Yellow
    Write-Host "1. Baixe em: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Instale o Git" -ForegroundColor White
    Write-Host "3. Execute este script novamente" -ForegroundColor White
    Write-Host ""
    Write-Host "OU use GitHub Desktop:" -ForegroundColor Yellow
    Write-Host "https://desktop.github.com/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "OU siga as instrucoes em: GITHUB_INSTRUCOES.md" -ForegroundColor Yellow
    exit 1
}

Write-Host "Git encontrado: $gitCmd" -ForegroundColor Green
Write-Host ""

# Solicita usuário do GitHub
$githubUser = Read-Host "Digite seu nome de usuario do GitHub"

if ([string]::IsNullOrWhiteSpace($githubUser)) {
    Write-Host "ERRO: Usuario nao pode estar vazio!" -ForegroundColor Red
    exit 1
}

$repoName = "Nnova-pasta"
$repoUrl = "https://github.com/$githubUser/$repoName.git"

Write-Host ""
Write-Host "Configuracao:" -ForegroundColor Yellow
Write-Host "  Usuario: $githubUser" -ForegroundColor White
Write-Host "  Repositorio: $repoName" -ForegroundColor White
Write-Host "  URL: $repoUrl" -ForegroundColor White
Write-Host ""

# Inicializa Git se necessário
if (-not (Test-Path ".git")) {
    Write-Host "Inicializando repositorio Git..." -ForegroundColor Cyan
    & $gitCmd init
}

# Adiciona remote
Write-Host "Configurando remote..." -ForegroundColor Cyan
$existingRemote = & $gitCmd remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "Removendo remote existente..." -ForegroundColor Yellow
    & $gitCmd remote remove origin
}
& $gitCmd remote add origin $repoUrl

# Adiciona arquivos
Write-Host "Adicionando arquivos..." -ForegroundColor Cyan
& $gitCmd add .

# Commit
Write-Host "Fazendo commit..." -ForegroundColor Cyan
$commitMsg = "Atualizacao: melhorias no design e funcionalidades"
& $gitCmd commit -m $commitMsg

# Branch main
Write-Host "Configurando branch main..." -ForegroundColor Cyan
& $gitCmd branch -M main 2>$null

# Push
Write-Host ""
Write-Host "Enviando para GitHub..." -ForegroundColor Cyan
Write-Host "(Pode pedir credenciais)" -ForegroundColor Yellow
Write-Host ""
& $gitCmd push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "SUCESSO! Mudancas enviadas!" -ForegroundColor Green
    Write-Host "Repositorio: $repoUrl" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "ERRO ao enviar. Verifique:" -ForegroundColor Red
    Write-Host "1. Se o repositorio 'Nnova-pasta' existe no GitHub" -ForegroundColor White
    Write-Host "2. Suas credenciais Git" -ForegroundColor White
    Write-Host "3. Veja GITHUB_INSTRUCOES.md para mais ajuda" -ForegroundColor White
}

Write-Host ""
