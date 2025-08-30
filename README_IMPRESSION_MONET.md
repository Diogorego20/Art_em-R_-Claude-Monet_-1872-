# 🌅 IMPRESSION, SOLEIL LEVANT - REPRODUÇÃO DIGITAL INTERATIVA

**Reprodução da obra icônica de Claude Monet (1872) usando algoritmos impressionistas em R**

---

## 📋 SOBRE O PROJETO

Este projeto reproduz digitalmente "Impression, soleil levant" de Claude Monet através de uma aplicação Shiny interativa. A implementação utiliza algoritmos avançados que simulam técnicas impressionistas, permitindo explorar variações criativas da obra original.

**🎨 Autor:** Diogo Rego - Estudante de Estatística UFPB  
**📚 Projeto:** Pixel Poesia R - Arte com Linguagem de Programação  
**🔗 GitHub:** https://github.com/Diogorego20/pixel-poesia-r  
**📅 Data:** Agosto 2025

## 🎯 CARACTERÍSTICAS PRINCIPAIS

### ✨ Funcionalidades Implementadas

- **🌅 Reprodução Fiel:** Algoritmos que capturam sol, reflexos, neblina e atmosfera
- **🎛️ Interface Interativa:** Controles para personalizar todos os aspectos da obra
- **🎨 Múltiplos Estilos:** Impressionista, Geométrico e Expressivo
- **🌈 Sistema de Cores:** Paletas históricas e contemporâneas
- **📐 Presets Artísticos:** Configurações pré-definidas para diferentes interpretações
- **💾 Export HD:** Download em alta resolução (300 DPI)
- **📊 Análise Técnica:** Informações detalhadas sobre cada geração

### 🔬 Algoritmos Implementados

1. **Gradientes Atmosféricos:** Simulação de transições cromáticas no céu
2. **Renderização Solar:** Sol com halo atmosférico e efeitos de difusão
3. **Reflexos Aquáticos:** Fragmentação e ondulação dos reflexos na água
4. **Pinceladas Gestuais:** Simulação de variabilidade natural do movimento humano
5. **Neblina Matinal:** Sistema de partículas para atmosfera nebulosa
6. **Silhuetas Portuárias:** Barcos e estruturas com perspectiva atmosférica

## 🚀 COMO USAR

### 📦 Instalação

```r
# Instalar pacotes necessários
install.packages(c("shiny", "colourpicker"))

# Carregar bibliotecas
library(shiny)
library(colourpicker)
```

### ▶️ Execução

```r
# Executar aplicação Shiny
runApp("app_impression_monet.R")

# Ou executar versão base (sem interface)
source("impression_soleil_levant_base.R")
```

### 🎮 Controles da Interface

**☀️ Configurações do Sol:**
- Intensidade, posição horizontal/vertical
- Cor personalizada do sol

**🌊 Configurações da Água:**
- Intensidade dos reflexos
- Ondulação e cores da água

**🌫️ Configurações da Atmosfera:**
- Densidade da neblina
- Cores do céu (superior e horizonte)
- Estilo de pincelada

**⛵ Elementos da Cena:**
- Número de barcos
- Estruturas portuárias
- Mastros e guindastes

## 🎭 PRESETS DISPONÍVEIS

### 🌅 Monet Original
Reprodução fiel aos parâmetros estimados da obra original de 1872.

### 🌇 Amanhecer Dourado  
Interpretação com ênfase em tons dourados e maior luminosidade.

### 🌆 Pôr do Sol
Reinterpretação da cena como um pôr do sol, com sol à direita.

### ⚪ Minimalista
Versão simplificada com elementos reduzidos ao essencial.

### 🎲 Aleatório
Configuração aleatória para descobrir novas interpretações.

## 📁 ESTRUTURA DOS ARQUIVOS

```
📂 Projeto Impression Monet/
├── 🎨 app_impression_monet.R          # Aplicação Shiny completa
├── 🖼️ impression_soleil_levant_base.R  # Versão base sem interface
├── 📚 DOCUMENTACAO_IMPRESSION_MONET.md # Documentação técnica completa
├── 📖 README_IMPRESSION_MONET.md      # Este arquivo
└── 🖼️ *.png                          # Imagens geradas
```

## 🔬 DETALHES TÉCNICOS

### 🧮 Algoritmos Matemáticos

**Gradientes Atmosféricos:**
```r
# Interpolação RGB para transições suaves
cor_interpolada <- cor_base + proporção * (cor_destino - cor_base)
```

**Reflexos na Água:**
```r
# Ondulação baseada em funções senoidais
ondulacao <- sin(x * frequencia) * amplitude * atenuacao_profundidade
```

**Pinceladas Impressionistas:**
```r
# Variação estocástica controlada
variacao_pincelada <- valor_base + runif(1, -variacao, variacao)
```

### 📊 Performance

- **Renderização Interativa:** 2-5 segundos (600x450px)
- **Export Alta Resolução:** 8-12 segundos (1200x900px)
- **Uso de Memória:** 50-150 MB (dependendo da resolução)

## 🎓 VALOR EDUCACIONAL

### 📚 Conceitos Abordados

- **Arte:** Técnicas impressionistas, teoria das cores, composição
- **Matemática:** Interpolação, funções trigonométricas, estatística
- **Programação:** R, Shiny, algoritmos gráficos, interface de usuário
- **História:** Contexto do movimento impressionista

### 🎯 Público-Alvo

- Estudantes de estatística e ciência de dados
- Professores de arte e história
- Entusiastas de programação criativa
- Pesquisadores em humanidades digitais

## 🤝 CONTRIBUIÇÕES

Este projeto é parte do **Pixel Poesia R**, uma iniciativa para democratizar a criação artística através da programação. Contribuições são bem-vindas!

### 📝 Como Contribuir

1. Fork o repositório
2. Crie uma branch para sua feature
3. Implemente melhorias ou correções
4. Envie um pull request

### 💡 Ideias para Contribuições

- Novos algoritmos de pincelada
- Paletas de cores históricas
- Efeitos atmosféricos avançados
- Otimizações de performance
- Documentação adicional

## 📜 LICENÇA

Este projeto é distribuído sob licença MIT. Você é livre para usar, modificar e distribuir o código, mantendo os créditos originais.

## 🙏 AGRADECIMENTOS

- **Claude Monet** - Pela obra original que inspirou este projeto
- **Comunidade R** - Pelas ferramentas e bibliotecas utilizadas
- **UFPB** - Pelo ambiente acadêmico que possibilita esta pesquisa
- **Movimento Impressionista** - Por revolucionar nossa compreensão da arte

---

## 📞 CONTATO

**Diogo Rego**  
Estudante de Estatística - UFPB  
Projeto: Pixel Poesia R  
GitHub: https://github.com/Diogorego20/pixel-poesia-r

---

*"A arte não é o que você vê, mas o que você faz os outros verem."* - Edgar Degas

**Desenvolvido com 🧡 em R | Onde Impressionismo encontra Algoritmos**

