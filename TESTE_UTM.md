# TESTE DE UTM - INSTRUÇÕES

## O QUE FOI CORRIGIDO

O problema era que os botões estavam redirecionando para URLs fixas SEM passar os parâmetros UTM.

### Correções Implementadas:

1. **Captura imediata de UTMs** - Script inline no HTML que captura UTMs assim que a página carrega
2. **Função getUtmParams()** - Busca UTMs em 3 lugares (nessa ordem):
   - URL atual
   - sessionStorage (captura imediata)
   - localStorage (Utmify)
3. **Função redirectWithUtm()** - Adiciona UTMs a TODAS as URLs de checkout
4. **Atualização automática de links** - Intercepta cliques em links ggcheckout.com
5. **Sistema de DEBUG** - Console mostra exatamente o que está sendo capturado

## COMO TESTAR

### Teste 1: URL com UTMs do Facebook

Acesse seu site com a URL completa incluindo as UTMs:

```
https://seusite.com/?utm_source=FB&utm_campaign=teste|123&utm_medium=adset|456&utm_content=ad|789&utm_term=feed
```

### Teste 2: Verificar Console do Navegador

1. Abra o site com as UTMs na URL
2. Pressione F12 para abrir o Console
3. Você verá uma mensagem como:

```
========== DEBUG UTMs ==========
URL atual: https://seusite.com/?utm_source=FB&...
Parâmetros UTM que serão enviados: utm_source=FB&utm_campaign=teste|123&...
UTMs capturadas (sessionStorage): {"utm_source":"FB","utm_campaign":"teste|123",...}
================================
✓ UTMs DETECTADAS E SERÃO PROPAGADAS!
```

### Teste 3: Clicar nos Botões

1. Com as UTMs na URL, clique em qualquer botão de checkout
2. No console você verá: `Redirecionando para: https://www.ggcheckout.com/checkout/v2/...?utm_source=FB&...`
3. **IMPORTANTE**: A URL do checkout DEVE ter os parâmetros UTM no final

## VERIFICAÇÃO NO GGCHECKOUT

Se o GGCheckout estiver configurado corretamente, ele deve:
- Receber os parâmetros UTM na URL
- Salvá-los e associá-los à compra

## CONFIGURAÇÃO DO FACEBOOK

Sua configuração do Facebook está CORRETA:

```
utm_source=FB&utm_campaign={{campaign.name}}|{{campaign.id}}&utm_medium={{adset.name}}|{{adset.id}}&utm_content={{ad.name}}|{{ad.id}}&utm_term={{placement}}
```

Os parâmetros dinâmicos `{{campaign.name}}` etc. são substituídos automaticamente pelo Facebook.

## POSSÍVEIS PROBLEMAS

### Se as UTMs ainda não aparecem na URL do checkout:

1. **Verifique se está usando HTTPS** - Alguns navegadores bloqueiam parâmetros em HTTP
2. **Verifique bloqueadores de anúncios** - Eles podem remover parâmetros UTM
3. **Teste em navegação anônima** - Elimina interferência de extensões
4. **Verifique o console** - Veja se há erros JavaScript

### Se o GGCheckout não está rastreando:

1. Verifique se o GGCheckout está configurado para capturar UTMs
2. Alguns gateways precisam de configuração específica para aceitar parâmetros extras
3. Entre em contato com o suporte do GGCheckout

## TESTE RÁPIDO

Cole essa URL no navegador (substitua SEU_SITE):

```
https://SEU_SITE/?utm_source=TESTE&utm_campaign=debug&utm_medium=teste&utm_content=validacao
```

E verifique:
1. Console do navegador mostra as UTMs
2. Ao clicar em um botão, a URL de checkout tem os parâmetros

## RESULTADO ESPERADO

Quando tudo estiver funcionando:

**URL de entrada:**
```
https://seusite.com/?utm_source=FB&utm_campaign=CampanhaTeste|123
```

**URL ao clicar no botão:**
```
https://www.ggcheckout.com/checkout/v2/XXX?utm_source=FB&utm_campaign=CampanhaTeste|123
```

Se isso estiver acontecendo, o problema está RESOLVIDO no seu site!
