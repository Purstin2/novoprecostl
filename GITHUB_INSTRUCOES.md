# Instruções para Enviar ao GitHub

## Repositório: Nnova-pasta

### Opção 1: Usando Git (Recomendado)

Se você tem Git instalado, execute os seguintes comandos no PowerShell ou CMD:

```powershell
# 1. Navegue até a pasta do projeto
cd "C:\Users\WDAGUtilityAccount\Downloads\Nnova-pasta"

# 2. Inicialize o repositório Git (se ainda não foi feito)
git init

# 3. Adicione o remote do GitHub (substitua SEU_USUARIO pelo seu usuário do GitHub)
git remote add origin https://github.com/SEU_USUARIO/Nnova-pasta.git

# Se já existir um remote, remova primeiro:
# git remote remove origin
# git remote add origin https://github.com/SEU_USUARIO/Nnova-pasta.git

# 4. Adicione todos os arquivos
git add .

# 5. Faça o commit
git commit -m "Atualização: melhorias no design e funcionalidades"

# 6. Renomeie a branch para main (se necessário)
git branch -M main

# 7. Envie para o GitHub
git push -u origin main
```

### Opção 2: Usando GitHub Desktop

1. Baixe e instale o GitHub Desktop: https://desktop.github.com/
2. Abra o GitHub Desktop
3. Clique em "File" > "Add Local Repository"
4. Selecione a pasta "Nnova-pasta"
5. Se o repositório não existir no GitHub, clique em "Publish repository"
6. Nome do repositório: `Nnova-pasta`
7. Marque "Keep this code private" se desejar (opcional)
8. Clique em "Publish repository"

### Opção 3: Upload Manual

1. Acesse https://github.com/SEU_USUARIO/Nnova-pasta
2. Clique em "uploading an existing file"
3. Arraste todos os arquivos da pasta para o GitHub
4. Adicione uma mensagem de commit
5. Clique em "Commit changes"

### Verificar se Git está instalado

Execute no PowerShell:
```powershell
git --version
```

Se não estiver instalado, baixe em: https://git-scm.com/download/win

### Problemas Comuns

**Erro: "repository not found"**
- Verifique se o repositório `Nnova-pasta` existe no seu GitHub
- Verifique se o nome de usuário está correto

**Erro: "authentication failed"**
- Configure suas credenciais Git:
  ```powershell
  git config --global user.name "Seu Nome"
  git config --global user.email "seu@email.com"
  ```
- Ou use um Personal Access Token: https://github.com/settings/tokens

**Erro: "failed to push some refs"**
- Execute primeiro: `git pull origin main --allow-unrelated-histories`
- Depois tente novamente: `git push -u origin main`
