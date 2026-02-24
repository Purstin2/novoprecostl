# 🔧 TESTE DO SITE - Resolução de Problemas

## ✅ Status do Servidor

O servidor está **RODANDO** na porta 8000!

## 🌐 URLs para Acessar

1. **Local (mesmo computador):**
   ```
   http://localhost:8000
   ```

2. **Rede Local (outros dispositivos na mesma rede):**
   ```
   http://192.168.1.103:8000
   ```

3. **Página de Teste (para verificar se servidor funciona):**
   ```
   http://localhost:8000/test.html
   ```

## 🔍 Se a Tela Estiver Preta

### Passo 1: Verificar se o servidor está rodando
```powershell
netstat -ano | findstr :8000
```
Se não aparecer nada, o servidor não está rodando.

### Passo 2: Limpar Cache do Navegador
- **Chrome/Edge:** Pressione `Ctrl + Shift + Delete`
- Ou pressione `Ctrl + F5` para recarregar forçando atualização

### Passo 3: Verificar Console do Navegador
1. Pressione `F12` para abrir as ferramentas de desenvolvedor
2. Vá na aba **Console**
3. Veja se há erros em vermelho
4. Vá na aba **Network** e verifique se os arquivos CSS e JS estão carregando (status 200)

### Passo 4: Testar Página de Teste
Acesse: `http://localhost:8000/test.html`

Se essa página aparecer, o servidor está funcionando e o problema está no `index.html` ou no CSS.

## 🛠️ Comandos Úteis

### Reiniciar o Servidor
```powershell
# Parar servidor atual
taskkill /F /PID [PID_DO_PROCESSO]

# Iniciar novo servidor
cd "C:\Users\Vibox\Downloads\Nnova-pasta"
python -m http.server 8000 --bind 0.0.0.0
```

### Verificar Arquivos
```powershell
cd "C:\Users\Vibox\Downloads\Nnova-pasta"
dir index.html
dir assets\css\styles.css
dir assets\js\main.js
```

## 📋 Checklist de Verificação

- [ ] Servidor está rodando (porta 8000)
- [ ] Arquivo `index.html` existe
- [ ] Arquivo `assets/css/styles.css` existe
- [ ] Arquivo `assets/js/main.js` existe
- [ ] Navegador não está em cache (Ctrl + F5)
- [ ] Console do navegador não mostra erros
- [ ] Página de teste (`test.html`) funciona

## 🚨 Problemas Comuns

### Tela Preta
- **Causa:** CSS com background preto ou JavaScript quebrando
- **Solução:** Verificar console do navegador (F12)

### Arquivos não carregam
- **Causa:** Caminhos incorretos ou servidor não rodando
- **Solução:** Verificar se está acessando `http://localhost:8000` e não `file://`

### Erro 404
- **Causa:** Arquivo não encontrado
- **Solução:** Verificar se todos os arquivos estão na pasta correta

## 📞 Próximos Passos

1. Acesse `http://localhost:8000` no navegador
2. Pressione `F12` para abrir o console
3. Me informe:
   - O que aparece no console?
   - Há erros em vermelho?
   - A página de teste (`test.html`) funciona?
