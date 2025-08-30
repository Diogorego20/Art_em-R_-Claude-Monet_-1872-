# ===============================================================================
# APLICAÇÃO SHINY: IMPRESSION, SOLEIL LEVANT INTERATIVA
# Reprodução Digital da Obra de Claude Monet (1872)
# Autor: Diogo Rego - Estudante de Estatística UFPB
# Projeto: Pixel Poesia R - Arte com Linguagem de Programação
# GitHub: https://github.com/Diogorego20/pixel-poesia-r
# Data: Agosto 2025
# ===============================================================================

# Carregamento de bibliotecas
library(shiny)
library(colourpicker)

# ===============================================================================
# INTERFACE DO USUÁRIO (UI)
# ===============================================================================

ui <- fluidPage(
  
  # Configuração do tema impressionista
  tags$head(
    tags$style(HTML("
      body {
        background: linear-gradient(135deg, #2c3e50 0%, #34495e 50%, #5d6d7e 100%);
        color: #ffffff;
        font-family: 'Georgia', serif;
      }
      
      .main-header {
        background: rgba(44, 62, 80, 0.95);
        padding: 30px;
        border-radius: 20px;
        margin-bottom: 30px;
        text-align: center;
        border: 4px solid #e67e22;
        box-shadow: 0 0 25px rgba(230, 126, 34, 0.4);
      }
      
      .control-panel {
        background: rgba(52, 73, 94, 0.8);
        padding: 25px;
        border-radius: 15px;
        margin-bottom: 25px;
        border: 2px solid #7f8c8d;
        box-shadow: 0 0 15px rgba(127, 140, 141, 0.2);
      }
      
      .art-display {
        background: rgba(44, 62, 80, 0.95);
        padding: 30px;
        border-radius: 20px;
        text-align: center;
        border: 4px solid #e67e22;
        box-shadow: 0 0 25px rgba(230, 126, 34, 0.4);
      }
      
      .btn-primary {
        background: linear-gradient(45deg, #e67e22, #d35400);
        border: 3px solid #e67e22;
        font-weight: bold;
        color: #ffffff;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        font-family: 'Georgia', serif;
      }
      
      .btn-primary:hover {
        background: linear-gradient(45deg, #d35400, #c0392b);
        border: 3px solid #d35400;
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(230, 126, 34, 0.5);
      }
      
      .btn-secondary {
        background: linear-gradient(45deg, #3498db, #2980b9);
        border: 3px solid #3498db;
        font-weight: bold;
        color: #ffffff;
        font-family: 'Georgia', serif;
      }
      
      .btn-secondary:hover {
        background: linear-gradient(45deg, #2980b9, #1f618d);
        border: 3px solid #2980b9;
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(52, 152, 219, 0.5);
      }
      
      h1, h2, h3 {
        color: #e67e22;
        text-shadow: 0 0 15px rgba(230, 126, 34, 0.6);
        font-family: 'Georgia', serif;
        font-weight: bold;
      }
      
      .impressionist-info {
        background: rgba(230, 126, 34, 0.15);
        padding: 20px;
        border-radius: 10px;
        border-left: 5px solid #e67e22;
        font-family: 'Georgia', serif;
        margin: 15px 0;
      }
      
      .technique-info {
        background: rgba(52, 152, 219, 0.15);
        padding: 18px;
        border-radius: 10px;
        border: 2px solid #3498db;
        margin: 15px 0;
      }
      
      .slider-input .irs-bar {
        background: #e67e22;
      }
      
      .slider-input .irs-handle {
        background: #e67e22;
        border: 3px solid #ffffff;
      }
      
      .well {
        background: rgba(52, 73, 94, 0.6);
        border: 2px solid #7f8c8d;
        border-radius: 12px;
      }
    "))
  ),
  
  # Cabeçalho principal
  div(class = "main-header",
    h1("🌅 IMPRESSION, SOLEIL LEVANT", 
       style = "margin: 0; font-size: 3.2em; font-weight: bold;"),
    h2("Reprodução Digital Interativa da Obra de Claude Monet (1872)", 
       style = "margin: 20px 0; font-style: italic; color: #f39c12;"),
    p("Criado por: ", strong("Diogo Rego"), " - Estudante de Estatística UFPB", 
      style = "margin: 12px 0; font-size: 1.3em; color: #ecf0f1;"),
    p("Projeto: ", strong("Pixel Poesia R"), " - Algoritmos Impressionistas", 
      style = "margin: 12px 0; color: #bdc3c7; font-size: 1.1em;"),
    a("🔗 GitHub: pixel-poesia-r", 
      href = "https://github.com/Diogorego20/pixel-poesia-r", 
      target = "_blank", 
      style = "color: #e67e22; text-decoration: none; font-weight: bold; font-size: 1.2em;")
  ),
  
  # Layout principal
  fluidRow(
    
    # Painel de controles
    column(4,
      
      # Configurações do Sol
      div(class = "control-panel",
        h3("☀️ Configurações do Sol"),
        
        sliderInput("intensidade_sol", 
                   "Intensidade do Sol:",
                   min = 0.3, max = 1.5, value = 0.9, step = 0.1,
                   class = "slider-input"),
        
        sliderInput("posicao_sol_x", 
                   "Posição Horizontal do Sol:",
                   min = 0.1, max = 0.9, value = 0.3, step = 0.05,
                   class = "slider-input"),
        
        sliderInput("posicao_sol_y", 
                   "Posição Vertical do Sol:",
                   min = 0.3, max = 0.7, value = 0.45, step = 0.05,
                   class = "slider-input"),
        
        colourInput("cor_sol", 
                   "Cor do Sol:", 
                   value = "#ff6600",
                   palette = "limited",
                   allowedCols = c("#ff6600", "#ff7722", "#ff8844", "#ff9966", "#ffaa88"))
      ),
      
      # Configurações da Água
      div(class = "control-panel",
        h3("🌊 Configurações da Água"),
        
        sliderInput("intensidade_reflexos", 
                   "Intensidade dos Reflexos:",
                   min = 0.2, max = 1.0, value = 0.8, step = 0.1,
                   class = "slider-input"),
        
        sliderInput("ondulacao_agua", 
                   "Ondulação da Água:",
                   min = 0.1, max = 2.0, value = 1.0, step = 0.1,
                   class = "slider-input"),
        
        colourInput("cor_agua_base", 
                   "Cor Base da Água:", 
                   value = "#2c5f7a"),
        
        colourInput("cor_agua_clara", 
                   "Cor da Água Clara:", 
                   value = "#5f92ad")
      ),
      
      # Configurações da Atmosfera
      div(class = "control-panel",
        h3("🌫️ Configurações da Atmosfera"),
        
        sliderInput("densidade_neblina", 
                   "Densidade da Neblina:",
                   min = 0.1, max = 1.0, value = 0.6, step = 0.1,
                   class = "slider-input"),
        
        colourInput("cor_ceu_superior", 
                   "Cor do Céu Superior:", 
                   value = "#4a6fa5"),
        
        colourInput("cor_ceu_horizonte", 
                   "Cor do Céu no Horizonte:", 
                   value = "#d4a574"),
        
        selectInput("estilo_pincelada", 
                   "Estilo de Pincelada:",
                   choices = list(
                     "🎨 Impressionista (Monet)" = "impressionista",
                     "📐 Geométrico Moderno" = "geometrico",
                     "🌊 Expressivo Fluido" = "expressivo"
                   ),
                   selected = "impressionista")
      ),
      
      # Configurações dos Elementos
      div(class = "control-panel",
        h3("⛵ Elementos da Cena"),
        
        sliderInput("num_barcos", 
                   "Número de Barcos:",
                   min = 0, max = 5, value = 3, step = 1,
                   class = "slider-input"),
        
        checkboxInput("mostrar_estruturas_porto", 
                     "Mostrar Estruturas do Porto", 
                     value = TRUE),
        
        checkboxInput("mostrar_mastros", 
                     "Mostrar Mastros e Guindastes", 
                     value = TRUE),
        
        sliderInput("intensidade_silhuetas", 
                   "Intensidade das Silhuetas:",
                   min = 0.3, max = 1.0, value = 0.7, step = 0.1,
                   class = "slider-input")
      ),
      
      # Presets Impressionistas
      div(class = "control-panel",
        h3("🎭 Presets Impressionistas"),
        
        actionButton("preset_monet_original", 
                    "🌅 Monet Original", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_amanhecer_dourado", 
                    "🌇 Amanhecer Dourado", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_por_do_sol", 
                    "🌆 Pôr do Sol", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_minimalista", 
                    "⚪ Minimalista", 
                    class = "btn btn-secondary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_aleatorio", 
                    "🎲 Aleatório", 
                    class = "btn btn-secondary btn-block")
      ),
      
      # Botão de geração
      div(class = "control-panel", style = "text-align: center;",
        actionButton("gerar_impression", 
                    "🎨 GERAR IMPRESSION", 
                    class = "btn btn-primary btn-lg",
                    style = "font-size: 1.5em; padding: 20px 40px; font-weight: bold; margin: 15px;")
      )
    ),
    
    # Área de exibição da arte
    column(8,
      div(class = "art-display",
        h3("🖼️ Sua Interpretação Impressionista"),
        
        # Área inicial
        conditionalPanel(
          condition = "input.gerar_impression == 0",
          div(style = "padding: 80px; text-align: center;",
            h4("👆 Configure os parâmetros e clique em 'GERAR IMPRESSION'", 
               style = "color: #ecf0f1; font-style: italic; margin-bottom: 25px;"),
            p("Explore as técnicas revolucionárias do Impressionismo", 
              style = "color: #bdc3c7; margin-bottom: 18px; font-size: 1.1em;"),
            p("e crie sua própria interpretação desta obra histórica!", 
              style = "color: #bdc3c7; margin-bottom: 30px; font-size: 1.1em;"),
            
            div(class = "impressionist-info",
              h5("🎨 Sobre o Impressionismo:", style = "color: #e67e22; margin-bottom: 18px;"),
              p("O Impressionismo revolucionou a arte ao capturar a luz e a atmosfera", 
                style = "text-align: justify; margin-bottom: 12px;"),
              p("através de pinceladas rápidas e espontâneas, pintando 'en plein air'", 
                style = "text-align: justify; margin-bottom: 12px;"),
              p("para observar os efeitos da luz natural em diferentes momentos do dia.", 
                style = "text-align: justify; font-style: italic;")
            ),
            
            div(class = "technique-info",
              h5("🌅 'Impression, soleil levant' (1872):", style = "color: #3498db; margin-bottom: 18px;"),
              p("Esta obra deu nome ao movimento Impressionista e retrata", 
                style = "text-align: justify; margin-bottom: 12px;"),
              p("o porto de Le Havre ao amanhecer, com o sol emergindo", 
                style = "text-align: justify; margin-bottom: 12px;"),
              p("no horizonte e seus reflexos dançando na água.", 
                style = "text-align: justify; font-style: italic;")
            )
          )
        ),
        
        # Área da arte gerada
        conditionalPanel(
          condition = "input.gerar_impression > 0",
          div(
            plotOutput("impression_plot", 
                      width = "100%", 
                      height = "450px"),
            
            br(),
            
            # Informações técnicas
            div(style = "background: rgba(44,62,80,0.6); padding: 20px; border-radius: 12px; margin-top: 25px; border: 2px solid #7f8c8d;",
              h5("📊 Análise Técnica da Obra:", style = "color: #e67e22; margin-bottom: 18px;"),
              verbatimTextOutput("info_tecnica_impression"),
              br(),
              div(style = "text-align: center;",
                downloadButton("download_impression", 
                             "💾 Download da Obra", 
                             class = "btn btn-success",
                             style = "font-weight: bold; margin-right: 20px; font-size: 1.1em;"),
                
                actionButton("nova_variacao", 
                           "🔄 Nova Variação", 
                           class = "btn btn-info",
                           style = "font-weight: bold; font-size: 1.1em;")
              )
            )
          )
        )
      ),
      
      # Seção educativa sobre técnicas
      div(class = "control-panel", style = "margin-top: 30px;",
        h3("📚 Técnicas Impressionistas Implementadas"),
        
        fluidRow(
          column(6,
            h5("🎨 Pinceladas Rápidas:", style = "color: #e67e22;"),
            p("• Traços horizontais para o céu"),
            p("• Pinceladas verticais para reflexos"),
            p("• Variação aleatória de espessura"),
            
            h5("🌈 Teoria das Cores:", style = "color: #e67e22;"),
            p("• Cores complementares (laranja/azul)"),
            p("• Gradientes atmosféricos"),
            p("• Mistura óptica de cores")
          ),
          column(6,
            h5("💡 Efeitos de Luz:", style = "color: #3498db;"),
            p("• Halo solar atmosférico"),
            p("• Reflexos fragmentados na água"),
            p("• Neblina matinal difusa"),
            
            h5("🏗️ Composição:", style = "color: #3498db;"),
            p("• Linha do horizonte baixa"),
            p("• Sol descentrado (regra dos terços)"),
            p("• Silhuetas para contraste")
          )
        )
      )
    )
  ),
  
  # Rodapé
  hr(style = "border-color: #7f8c8d; margin-top: 60px;"),
  
  div(style = "text-align: center; padding: 30px; color: #95a5a6;",
    p("Desenvolvido com 🧡 em R por Diogo Rego - UFPB", 
      style = "margin: 10px 0; font-size: 1.2em; font-family: 'Georgia', serif;"),
    p("Projeto Pixel Poesia R - Onde Impressionismo encontra Algoritmos", 
      style = "margin: 10px 0; font-style: italic; font-size: 1.1em;"),
    p("© 2025 - Explorando a revolução artística através da programação", 
      style = "margin: 10px 0; font-size: 1em;")
  )
)

# ===============================================================================
# LÓGICA DO SERVIDOR (SERVER)
# ===============================================================================

server <- function(input, output, session) {
  
  # Variáveis reativas
  obra_atual <- reactiveVal(NULL)
  
  # ===============================================================================
  # FUNÇÕES DE GERAÇÃO ARTÍSTICA
  # ===============================================================================
  
  # Função principal para criar a obra
  criar_impression_shiny <- function(largura, altura, intensidade_sol, pos_sol_x, pos_sol_y,
                                    intensidade_reflexos, num_barcos, densidade_neblina,
                                    estilo_pincelada, cor_sol, cor_agua_base, cor_agua_clara,
                                    cor_ceu_superior, cor_ceu_horizonte, mostrar_estruturas,
                                    mostrar_mastros, intensidade_silhuetas, ondulacao_agua) {
    
    # Configuração da plotagem
    par(mar = c(0, 0, 0, 0), bg = "#2c3e50")
    plot(0, 0, type = "n", xlim = c(0, largura), ylim = c(0, altura), 
         axes = FALSE, xlab = "", ylab = "", asp = 1)
    
    # Linha do horizonte
    horizonte_y <- altura * 0.4
    
    # 1. CRIAR CÉU COM GRADIENTE
    criar_ceu_shiny(largura, altura, horizonte_y, cor_ceu_superior, cor_ceu_horizonte, 
                    densidade_neblina, estilo_pincelada)
    
    # 2. CRIAR ÁGUA
    criar_agua_shiny(largura, altura, horizonte_y, cor_agua_base, cor_agua_clara, 
                     ondulacao_agua, estilo_pincelada)
    
    # 3. DESENHAR SOL
    sol_x <- largura * pos_sol_x
    sol_y <- altura * pos_sol_y
    desenhar_sol_shiny(sol_x, sol_y, intensidade_sol, cor_sol, estilo_pincelada)
    
    # 4. CRIAR REFLEXOS
    criar_reflexos_shiny(largura, altura, sol_x, sol_y, horizonte_y, 
                         intensidade_reflexos, cor_sol, ondulacao_agua, estilo_pincelada)
    
    # 5. ADICIONAR BARCOS
    if (num_barcos > 0) {
      adicionar_barcos_shiny(largura, altura, horizonte_y, num_barcos, 
                             intensidade_silhuetas, estilo_pincelada)
    }
    
    # 6. ESTRUTURAS DO PORTO
    if (mostrar_estruturas) {
      adicionar_estruturas_shiny(largura, altura, horizonte_y, intensidade_silhuetas, estilo_pincelada)
    }
    
    # 7. MASTROS E GUINDASTES
    if (mostrar_mastros) {
      adicionar_mastros_shiny(largura, altura, horizonte_y, intensidade_silhuetas, estilo_pincelada)
    }
    
    # 8. NEBLINA FINAL
    aplicar_neblina_shiny(largura, altura, densidade_neblina)
    
    # Assinatura
    text(largura * 0.02, altura * 0.02, 
         "Impression, soleil levant - Algoritmos Impressionistas", 
         col = "white", cex = 0.8, adj = 0, font = 2)
    
    text(largura * 0.02, altura * 0.06, 
         "Diogo Rego - UFPB | Pixel Poesia R", 
         col = "#cccccc", cex = 0.7, adj = 0)
  }
  
  # Função para criar céu
  criar_ceu_shiny <- function(largura, altura, horizonte_y, cor_superior, cor_horizonte, 
                             densidade_neblina, estilo) {
    
    for (y in horizonte_y:altura) {
      proporcao <- (y - horizonte_y) / (altura - horizonte_y)
      
      # Interpolar cores
      cor_rgb_sup <- col2rgb(cor_superior)
      cor_rgb_hor <- col2rgb(cor_horizonte)
      
      r <- cor_rgb_hor[1] + proporcao * (cor_rgb_sup[1] - cor_rgb_hor[1])
      g <- cor_rgb_hor[2] + proporcao * (cor_rgb_sup[2] - cor_rgb_hor[2])
      b <- cor_rgb_hor[3] + proporcao * (cor_rgb_sup[3] - cor_rgb_hor[3])
      
      cor_interpolada <- rgb(r, g, b, maxColorValue = 255)
      
      if (estilo == "impressionista") {
        # Pinceladas horizontais
        for (x in seq(0, largura, by = 4)) {
          largura_pincelada <- sample(8:20, 1)
          x_fim <- min(x + largura_pincelada, largura)
          
          # Variação de cor
          if (runif(1) < densidade_neblina * 0.3) {
            cor_final <- "#e8e8e8"  # Neblina
          } else {
            cor_final <- cor_interpolada
          }
          
          y_variacao <- y + sample(-1:1, 1)
          lines(c(x, x_fim), c(y_variacao, y_variacao), 
                col = cor_final, lwd = sample(1:2, 1))
        }
      } else {
        rect(0, y, largura, y+1, col = cor_interpolada, border = NA)
      }
    }
  }
  
  # Função para criar água
  criar_agua_shiny <- function(largura, altura, horizonte_y, cor_base, cor_clara, ondulacao, estilo) {
    
    for (y in 0:horizonte_y) {
      proporcao_profundidade <- y / horizonte_y
      
      # Interpolar cores da água
      cor_rgb_base <- col2rgb(cor_base)
      cor_rgb_clara <- col2rgb(cor_clara)
      
      r <- cor_rgb_base[1] + proporcao_profundidade * (cor_rgb_clara[1] - cor_rgb_base[1])
      g <- cor_rgb_base[2] + proporcao_profundidade * (cor_rgb_clara[2] - cor_rgb_base[2])
      b <- cor_rgb_base[3] + proporcao_profundidade * (cor_rgb_clara[3] - cor_rgb_base[3])
      
      cor_agua <- rgb(r, g, b, maxColorValue = 255)
      
      if (estilo == "impressionista") {
        # Pinceladas horizontais onduladas
        for (x in seq(0, largura, by = 5)) {
          largura_pincelada <- sample(10:25, 1)
          x_fim <- min(x + largura_pincelada, largura)
          
          # Ondulação da água
          y_ondulacao <- y + sin(x * 0.02 * ondulacao) * 2 + sample(-1:1, 1)
          
          lines(c(x, x_fim), c(y_ondulacao, y_ondulacao), 
                col = cor_agua, lwd = sample(1:2, 1))
        }
      } else {
        rect(0, y, largura, y+1, col = cor_agua, border = NA)
      }
    }
  }
  
  # Função para desenhar sol
  desenhar_sol_shiny <- function(sol_x, sol_y, intensidade, cor_sol, estilo) {
    
    raio_sol <- 20 * intensidade
    
    # Halo externo
    for (r in seq(raio_sol * 2.5, raio_sol, by = -1)) {
      alpha <- (raio_sol * 2.5 - r) / (raio_sol * 1.5) * 0.3
      
      theta <- seq(0, 2*pi, length.out = 80)
      x_halo <- sol_x + r * cos(theta)
      y_halo <- sol_y + r * sin(theta)
      
      cor_halo <- paste0(cor_sol, sprintf("%02x", as.integer(alpha * 255)))
      lines(x_halo, y_halo, col = cor_halo, lwd = 1)
    }
    
    # Sol principal
    if (estilo == "impressionista") {
      # Pinceladas radiais
      for (i in 1:40) {
        angulo <- runif(1, 0, 2*pi)
        raio_pincelada <- runif(1, raio_sol * 0.4, raio_sol)
        
        x_pincelada <- sol_x + raio_pincelada * cos(angulo)
        y_pincelada <- sol_y + raio_pincelada * sin(angulo)
        
        x_centro <- sol_x + (raio_pincelada * 0.6) * cos(angulo)
        y_centro <- sol_y + (raio_pincelada * 0.6) * sin(angulo)
        
        lines(c(x_centro, x_pincelada), c(y_centro, y_pincelada), 
              col = cor_sol, lwd = sample(2:4, 1))
      }
    } else {
      symbols(sol_x, sol_y, circles = raio_sol, add = TRUE, 
              fg = NA, bg = cor_sol, inches = FALSE)
    }
    
    # Centro brilhante
    symbols(sol_x, sol_y, circles = raio_sol * 0.5, add = TRUE, 
            fg = NA, bg = "#ffcc00", inches = FALSE)
  }
  
  # Função para criar reflexos
  criar_reflexos_shiny <- function(largura, altura, sol_x, sol_y, horizonte_y, 
                                  intensidade, cor_sol, ondulacao, estilo) {
    
    reflexo_x <- sol_x
    
    for (y in 0:horizonte_y) {
      proporcao_reflexo <- (horizonte_y - y) / horizonte_y
      largura_reflexo <- 8 + proporcao_reflexo * 35
      
      intensidade_local <- intensidade * (1 - proporcao_reflexo * 0.6)
      
      if (estilo == "impressionista") {
        # Pinceladas verticais fragmentadas
        num_pinceladas <- round(largura_reflexo / 3)
        
        for (i in 1:num_pinceladas) {
          x_reflexo <- reflexo_x + runif(1, -largura_reflexo/2, largura_reflexo/2)
          
          # Ondulação
          x_ondulacao <- x_reflexo + sin(y * 0.1 * ondulacao) * 4
          
          altura_pincelada <- sample(2:6, 1)
          
          alpha <- intensidade_local * 255
          cor_final <- paste0(cor_sol, sprintf("%02x", as.integer(alpha)))
          
          lines(c(x_ondulacao, x_ondulacao), 
                c(y, y + altura_pincelada), 
                col = cor_final, lwd = sample(1:3, 1))
        }
      } else {
        # Reflexo uniforme
        alpha <- intensidade_local * 255
        cor_final <- paste0(cor_sol, sprintf("%02x", as.integer(alpha)))
        
        rect(reflexo_x - largura_reflexo/2, y, 
             reflexo_x + largura_reflexo/2, y + 1, 
             col = cor_final, border = NA)
      }
    }
  }
  
  # Função para adicionar barcos
  adicionar_barcos_shiny <- function(largura, altura, horizonte_y, num_barcos, intensidade, estilo) {
    
    posicoes_barcos <- list(
      list(x = largura * 0.6, y = horizonte_y * 0.8, tamanho = 1.0),
      list(x = largura * 0.75, y = horizonte_y * 0.6, tamanho = 0.8),
      list(x = largura * 0.85, y = horizonte_y * 0.9, tamanho = 0.6),
      list(x = largura * 0.45, y = horizonte_y * 0.7, tamanho = 0.9),
      list(x = largura * 0.9, y = horizonte_y * 0.5, tamanho = 0.5)
    )
    
    cor_silhueta <- paste0("#000000", sprintf("%02x", as.integer(intensidade * 255)))
    
    for (i in 1:min(num_barcos, length(posicoes_barcos))) {
      barco <- posicoes_barcos[[i]]
      
      comprimento <- 35 * barco$tamanho
      altura_barco <- 12 * barco$tamanho
      
      if (estilo == "impressionista") {
        # Casco com pinceladas
        for (j in 1:8) {
          x_pincelada <- barco$x + runif(1, -comprimento/2, comprimento/2)
          y_pincelada <- barco$y + runif(1, -altura_barco/2, altura_barco/2)
          
          largura_pincelada <- sample(4:10, 1)
          
          lines(c(x_pincelada, x_pincelada + largura_pincelada), 
                c(y_pincelada, y_pincelada), 
                col = cor_silhueta, lwd = sample(2:4, 1))
        }
      } else {
        # Barco geométrico
        rect(barco$x - comprimento/2, barco$y - altura_barco/2, 
             barco$x + comprimento/2, barco$y + altura_barco/2, 
             col = cor_silhueta, border = cor_silhueta)
      }
      
      # Mastro
      mastro_altura <- 25 * barco$tamanho
      lines(c(barco$x, barco$x), 
            c(barco$y, barco$y + mastro_altura), 
            col = cor_silhueta, lwd = 3)
    }
  }
  
  # Função para estruturas do porto
  adicionar_estruturas_shiny <- function(largura, altura, horizonte_y, intensidade, estilo) {
    
    estruturas <- list(
      list(x = largura * 0.08, largura_est = 18, altura_est = 35),
      list(x = largura * 0.13, largura_est = 12, altura_est = 28),
      list(x = largura * 0.92, largura_est = 22, altura_est = 40),
      list(x = largura * 0.96, largura_est = 15, altura_est = 25)
    )
    
    cor_estrutura <- paste0("#1a1a1a", sprintf("%02x", as.integer(intensidade * 255)))
    
    for (estrutura in estruturas) {
      if (estilo == "impressionista") {
        # Pinceladas verticais
        for (j in 1:6) {
          x_pincelada <- estrutura$x + runif(1, -estrutura$largura_est/2, estrutura$largura_est/2)
          altura_pincelada <- runif(1, estrutura$altura_est * 0.6, estrutura$altura_est)
          
          lines(c(x_pincelada, x_pincelada), 
                c(horizonte_y, horizonte_y + altura_pincelada), 
                col = cor_estrutura, lwd = sample(2:4, 1))
        }
      } else {
        rect(estrutura$x - estrutura$largura_est/2, horizonte_y, 
             estrutura$x + estrutura$largura_est/2, horizonte_y + estrutura$altura_est, 
             col = cor_estrutura, border = cor_estrutura)
      }
    }
  }
  
  # Função para mastros
  adicionar_mastros_shiny <- function(largura, altura, horizonte_y, intensidade, estilo) {
    
    mastros_x <- c(largura * 0.05, largura * 0.11, largura * 0.89, largura * 0.94)
    cor_mastro <- paste0("#0a0a0a", sprintf("%02x", as.integer(intensidade * 255)))
    
    for (mastro_x in mastros_x) {
      altura_mastro <- sample(20:45, 1)
      
      lines(c(mastro_x, mastro_x), 
            c(horizonte_y, horizonte_y + altura_mastro), 
            col = cor_mastro, lwd = 2)
      
      # Cabos ocasionais
      if (runif(1) > 0.7) {
        cabo_x_fim <- mastro_x + sample(c(-15, 15), 1)
        lines(c(mastro_x, cabo_x_fim), 
              c(horizonte_y + altura_mastro, horizonte_y + altura_mastro * 0.8), 
              col = cor_mastro, lwd = 1)
      }
    }
  }
  
  # Função para neblina
  aplicar_neblina_shiny <- function(largura, altura, densidade) {
    
    for (i in 1:round(densidade * 150)) {
      x <- runif(1, 0, largura)
      y <- runif(1, altura * 0.25, altura * 0.75)
      
      tamanho <- runif(1, 8, 25)
      alpha <- runif(1, 0.05, 0.2)
      cor_neblina <- paste0("#f0f0f0", sprintf("%02x", as.integer(alpha * 255)))
      
      symbols(x, y, circles = tamanho, add = TRUE, 
              fg = NA, bg = cor_neblina, inches = FALSE)
    }
  }
  
  # ===============================================================================
  # OUTPUTS REATIVOS
  # ===============================================================================
  
  # Plot principal
  output$impression_plot <- renderPlot({
    
    if (input$gerar_impression == 0) return()
    
    isolate({
      criar_impression_shiny(
        largura = 600,
        altura = 450,
        intensidade_sol = input$intensidade_sol,
        pos_sol_x = input$posicao_sol_x,
        pos_sol_y = input$posicao_sol_y,
        intensidade_reflexos = input$intensidade_reflexos,
        num_barcos = input$num_barcos,
        densidade_neblina = input$densidade_neblina,
        estilo_pincelada = input$estilo_pincelada,
        cor_sol = input$cor_sol,
        cor_agua_base = input$cor_agua_base,
        cor_agua_clara = input$cor_agua_clara,
        cor_ceu_superior = input$cor_ceu_superior,
        cor_ceu_horizonte = input$cor_ceu_horizonte,
        mostrar_estruturas = input$mostrar_estruturas_porto,
        mostrar_mastros = input$mostrar_mastros,
        intensidade_silhuetas = input$intensidade_silhuetas,
        ondulacao_agua = input$ondulacao_agua
      )
      
      obra_atual(list(
        intensidade_sol = input$intensidade_sol,
        posicao_sol_x = input$posicao_sol_x,
        posicao_sol_y = input$posicao_sol_y,
        intensidade_reflexos = input$intensidade_reflexos,
        num_barcos = input$num_barcos,
        densidade_neblina = input$densidade_neblina,
        estilo_pincelada = input$estilo_pincelada,
        timestamp = Sys.time()
      ))
    })
  })
  
  # Informações técnicas
  output$info_tecnica_impression <- renderText({
    req(obra_atual())
    
    obra <- obra_atual()
    paste(
      "Obra: Impression, soleil levant (1872) - Claude Monet",
      "\nEstilo de Reprodução:", switch(obra$estilo_pincelada,
        "impressionista" = "Impressionista Clássico",
        "geometrico" = "Geométrico Moderno", 
        "expressivo" = "Expressivo Fluido",
        obra$estilo_pincelada
      ),
      "\nIntensidade do Sol:", round(obra$intensidade_sol, 2),
      "\nPosição do Sol: (", round(obra$posicao_sol_x, 2), ", ", round(obra$posicao_sol_y, 2), ")",
      "\nIntensidade dos Reflexos:", round(obra$intensidade_reflexos, 2),
      "\nNúmero de Barcos:", obra$num_barcos,
      "\nDensidade da Neblina:", round(obra$densidade_neblina, 2),
      "\nGerado em:", format(obra$timestamp, "%d/%m/%Y %H:%M:%S"),
      "\nAutor da Reprodução: Diogo Rego - UFPB"
    )
  })
  
  # ===============================================================================
  # PRESETS
  # ===============================================================================
  
  # Preset Monet Original
  observeEvent(input$preset_monet_original, {
    updateSliderInput(session, "intensidade_sol", value = 0.9)
    updateSliderInput(session, "posicao_sol_x", value = 0.3)
    updateSliderInput(session, "posicao_sol_y", value = 0.45)
    updateSliderInput(session, "intensidade_reflexos", value = 0.8)
    updateSliderInput(session, "num_barcos", value = 3)
    updateSliderInput(session, "densidade_neblina", value = 0.7)
    updateSelectInput(session, "estilo_pincelada", selected = "impressionista")
    updateColourInput(session, "cor_sol", value = "#ff6600")
    updateColourInput(session, "cor_agua_base", value = "#2c5f7a")
    updateColourInput(session, "cor_ceu_superior", value = "#4a6fa5")
    updateColourInput(session, "cor_ceu_horizonte", value = "#d4a574")
    updateCheckboxInput(session, "mostrar_estruturas_porto", value = TRUE)
    updateCheckboxInput(session, "mostrar_mastros", value = TRUE)
    
    showNotification("🌅 Preset Monet Original aplicado!", type = "success", duration = 3)
  })
  
  # Preset Amanhecer Dourado
  observeEvent(input$preset_amanhecer_dourado, {
    updateSliderInput(session, "intensidade_sol", value = 1.2)
    updateSliderInput(session, "posicao_sol_x", value = 0.25)
    updateSliderInput(session, "posicao_sol_y", value = 0.5)
    updateSliderInput(session, "intensidade_reflexos", value = 0.9)
    updateSliderInput(session, "densidade_neblina", value = 0.5)
    updateColourInput(session, "cor_sol", value = "#ff8844")
    updateColourInput(session, "cor_ceu_horizonte", value = "#ffbb77")
    
    showNotification("🌇 Preset Amanhecer Dourado aplicado!", type = "success", duration = 3)
  })
  
  # Preset Pôr do Sol
  observeEvent(input$preset_por_do_sol, {
    updateSliderInput(session, "intensidade_sol", value = 1.0)
    updateSliderInput(session, "posicao_sol_x", value = 0.7)
    updateSliderInput(session, "posicao_sol_y", value = 0.35)
    updateSliderInput(session, "intensidade_reflexos", value = 1.0)
    updateColourInput(session, "cor_sol", value = "#ff4400")
    updateColourInput(session, "cor_ceu_horizonte", value = "#ff6600")
    updateColourInput(session, "cor_ceu_superior", value = "#cc3300")
    
    showNotification("🌆 Preset Pôr do Sol aplicado!", type = "success", duration = 3)
  })
  
  # Preset Minimalista
  observeEvent(input$preset_minimalista, {
    updateSliderInput(session, "num_barcos", value = 1)
    updateSliderInput(session, "densidade_neblina", value = 0.3)
    updateSelectInput(session, "estilo_pincelada", selected = "geometrico")
    updateCheckboxInput(session, "mostrar_estruturas_porto", value = FALSE)
    updateCheckboxInput(session, "mostrar_mastros", value = FALSE)
    
    showNotification("⚪ Preset Minimalista aplicado!", type = "success", duration = 3)
  })
  
  # Preset Aleatório
  observeEvent(input$preset_aleatorio, {
    updateSliderInput(session, "intensidade_sol", value = runif(1, 0.5, 1.3))
    updateSliderInput(session, "posicao_sol_x", value = runif(1, 0.2, 0.8))
    updateSliderInput(session, "posicao_sol_y", value = runif(1, 0.35, 0.65))
    updateSliderInput(session, "intensidade_reflexos", value = runif(1, 0.4, 1.0))
    updateSliderInput(session, "num_barcos", value = sample(0:5, 1))
    updateSliderInput(session, "densidade_neblina", value = runif(1, 0.2, 0.9))
    
    cores_sol <- c("#ff6600", "#ff7722", "#ff4400", "#ff8844", "#ff9966")
    updateColourInput(session, "cor_sol", value = sample(cores_sol, 1))
    
    showNotification("🎲 Configuração aleatória aplicada!", type = "info", duration = 3)
  })
  
  # Nova variação
  observeEvent(input$nova_variacao, {
    # Pequenas variações nos parâmetros atuais
    updateSliderInput(session, "densidade_neblina", 
                     value = max(0.1, min(1.0, input$densidade_neblina + runif(1, -0.2, 0.2))))
    updateSliderInput(session, "ondulacao_agua", 
                     value = max(0.1, min(2.0, input$ondulacao_agua + runif(1, -0.3, 0.3))))
    
    showNotification("🔄 Nova variação criada!", type = "info", duration = 2)
  })
  
  # Botão de geração
  observeEvent(input$gerar_impression, {
    showNotification("🎨 Criando sua Impression, soleil levant...", type = "message", duration = 3)
  })
  
  # ===============================================================================
  # DOWNLOAD
  # ===============================================================================
  
  output$download_impression <- downloadHandler(
    filename = function() {
      req(obra_atual())
      timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
      paste0("impression_soleil_levant_", timestamp, ".png")
    },
    content = function(file) {
      req(obra_atual())
      
      # Gerar em alta resolução
      png(file, width = 1200, height = 900, res = 300, bg = "#2c3e50")
      
      criar_impression_shiny(
        largura = 1200,
        altura = 900,
        intensidade_sol = input$intensidade_sol,
        pos_sol_x = input$posicao_sol_x,
        pos_sol_y = input$posicao_sol_y,
        intensidade_reflexos = input$intensidade_reflexos,
        num_barcos = input$num_barcos,
        densidade_neblina = input$densidade_neblina,
        estilo_pincelada = input$estilo_pincelada,
        cor_sol = input$cor_sol,
        cor_agua_base = input$cor_agua_base,
        cor_agua_clara = input$cor_agua_clara,
        cor_ceu_superior = input$cor_ceu_superior,
        cor_ceu_horizonte = input$cor_ceu_horizonte,
        mostrar_estruturas = input$mostrar_estruturas_porto,
        mostrar_mastros = input$mostrar_mastros,
        intensidade_silhuetas = input$intensidade_silhuetas,
        ondulacao_agua = input$ondulacao_agua
      )
      
      dev.off()
    }
  )
}

# ===============================================================================
# EXECUÇÃO DA APLICAÇÃO
# ===============================================================================

# Executar aplicação Shiny
shinyApp(ui = ui, server = server)

