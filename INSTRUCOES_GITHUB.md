# 📚 Instruções para Conectar ao GitHub

## ✅ Status Atual

- ✅ Repositório Git local inicializado
- ✅ Commit inicial realizado
- ✅ Servidor HTTP rodando na porta 8000

## 🚀 Passos para Criar e Conectar ao GitHub

### Opção 1: Usando GitHub CLI (Recomendado)

Se você tem o GitHub CLI instalado:

```bash
# 1. Criar repositório no GitHub
gh repo create mega-universo-stl --public --source=. --remote=origin --push

# Ou se preferir privado:
gh repo create mega-universo-stl --private --source=. --remote=origin --push
```

### Opção 2: Manual (Via Site do GitHub)

1. **Acesse:** https://github.com/new

2. **Preencha os dados:**
   - Repository name: `mega-universo-stl`
   - Description: "Site de vendas do Mega Universo STL - Coleção de modelos 3D"
   - Escolha: Public ou Private
   - **NÃO marque** "Initialize this repository with a README" (já temos um)
   - Clique em "Create repository"

3. **Conecte o repositório local ao GitHub:**

```bash
# Adicione o remote origin
git remote add origin https://github.com/SEU_USUARIO/mega-universo-stl.git

# Verifique se foi adicionado
git remote -v

# Faça o push
git branch -M main
git push -u origin main
```

**Substitua `SEU_USUARIO` pelo seu nome de usuário do GitHub!**

### Opção 3: Usando SSH (Se você tem chave SSH configurada)

```bash
# Adicione o remote origin com SSH
git remote add origin git@github.com:SEU_USUARIO/mega-universo-stl.git

# Faça o push
git branch -M main
git push -u origin main
```

## 📋 Comandos Úteis

### Verificar status do Git
```bash
git status
```

### Ver commits realizados
```bash
git log --oneline
```

### Adicionar novas alterações
```bash
git add .
git commit -m "Descrição das alterações"
git push
```

### Verificar remote configurado
```bash
git remote -v
```

## 🔐 Autenticação

Se for solicitado login ao fazer push:

1. **Token de Acesso Pessoal:**
   - Acesse: https://github.com/settings/tokens
   - Clique em "Generate new token (classic)"
   - Dê um nome e selecione escopos: `repo`
   - Copie o token e use como senha ao fazer push

2. **Ou use GitHub CLI:**
   ```bash
   gh auth login
   ```

## ✅ Verificação Final

Após o push, acesse seu repositório no GitHub:
```
https://github.com/SEU_USUARIO/mega-universo-stl
```

Você deve ver todos os arquivos do projeto lá!

---

**Precisa de ajuda?** Verifique se:
- ✅ Git está instalado: `git --version`
- ✅ Você está autenticado no GitHub
- ✅ O nome do repositório está correto
