# 🚀 Mega Universo STL

Site de vendas do Mega Universo STL - A maior coleção de modelos 3D com +90 mil modelos prontos para impressão!

## 📋 Sobre o Projeto

Site de landing page moderna e responsiva desenvolvida para apresentar o Mega Universo STL, uma coleção completa de modelos 3D organizados por categorias.

## ✨ Funcionalidades

- 🎨 Design moderno e responsivo
- 🎠 Carrossel de imagens interativo
- 💳 Cards de preços com badges de segurança
- ⭐ Sistema de avaliações e depoimentos
- 🎁 Seção de bônus exclusivos
- 📱 Totalmente responsivo para mobile

## 🛠️ Tecnologias Utilizadas

- HTML5
- CSS3 (com variáveis CSS)
- JavaScript (Vanilla)
- Python HTTP Server (para desenvolvimento local)

## 📁 Estrutura do Projeto

```
.
├── index.html              # Página principal
├── assets/
│   ├── css/
│   │   └── styles.css      # Estilos principais
│   ├── js/
│   │   └── main.js         # JavaScript principal
│   ├── img/                # Imagens do projeto
│   └── data/
│       └── site.json       # Dados do site
├── README.md
└── .gitignore
```

## 🚀 Como Executar Localmente

### Opção 1: Python HTTP Server

```bash
# Navegue até a pasta do projeto
cd "c:\Users\WDAGUtilityAccount\Downloads\Nnova-pasta"

# Execute o servidor HTTP (PowerShell)
powershell -ExecutionPolicy Bypass -File .\servidor-local.ps1

# Ou usando Python (se disponível)
python -m http.server 3000 --bind 0.0.0.0
```

Acesse no navegador:
- **Local:** http://localhost:8000
- **Rede local:** http://SEU_IP:8000

### Opção 2: Live Server (VS Code)

1. Instale a extensão "Live Server" no VS Code
2. Clique com botão direito no `index.html`
3. Selecione "Open with Live Server"

## 📝 Configuração

### Imagens

As imagens devem ser adicionadas na pasta `assets/img/` com os seguintes nomes:

**Galeria:**
- `animes.jpg`
- `desenhos.jpg`
- `religiao.jpg`
- `mitologia.jpg`
- `decoracao.jpg`
- `mais.jpg`

**Bônus:**
- `bonus-veiculos.jpg`
- `bonus-marvel.jpg`
- `bonus-chaveiros.jpg`
- `bonus-utensilios.jpg`
- `bonus-flexiveis.jpg`
- `bonus-classicos.jpg`
- `bonus-mascaras.jpg`
- `bonus-pokemon.jpg`
- `bonus-exclusivo.jpg`

**Avatares:**
- `avatar-mulher.jpg`
- `avatar-homem-1.jpg`
- `avatar-homem-2.jpg`

## 🔗 URLs de Checkout

Configure as URLs de checkout no arquivo `assets/js/main.js`:

```javascript
// Substitua as URLs de exemplo pelas URLs reais
window.location.href = "URL_DO_CHECKOUT";
```

## 📄 Licença

Este projeto é privado e proprietário.

## 👨‍💻 Desenvolvido por

Mega Universo STL Team

---

**Versão:** 2.0  
**Última atualização:** 2024
