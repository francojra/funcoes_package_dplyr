# Pacote dplyr
# Autoria: Jeanne Franco
# Data: 25/06/21

# Carregar pacotes --------------------------------------------------------------------------

library(dplyr)

# Carregar dados ------------------------------------------------------------------------------

starwars
tibble(starwars)
View(starwars)

# Fun��es -------------------------------------------------------------------------------------

# mutate - adi��o de novas vari�veis ao conjunto de dados

starw <- starwars %>%
  mutate(imc = mass/height*height)
View(starw) # observe a nova coluna criada com o nome "imc"

# select - sele��o de vari�veis

star <- starw %>%
  select(name, imc, hair_color) # seleciona as tr�s vari�veis especificadas
View(star)

# filter - seleciona valores espec�ficos dos dados

star1 <- star %>%
  filter(imc >= 40) # filtar valores do imc maiores e/ou iguais a 40
View(star1)

# arrange - ordena os valores de uma coluna por ordem crescente ou decrescente

star2 <- star1 %>%
  arrange(imc, decreasing = TRUE) # Valores do imc do menor para o maior
View(star2)

starwars %>%
  arrange(desc(mass))

# summarise - resume o conjunto de dado; calculos de m�dia, mediana, etc.
# group_by - sele��o de grupos categ�ricos para calcular valores do summary

starwars %>%
  group_by(gender) %>% # seleciona a vari�vel categ�rica cor dos olhos
  summarise(mean_height = mean(height, na.rm = TRUE),
            max_height = max(height, na.rm = TRUE),
            min_height = min(height, na.rm = TRUE),
            desvio = sd(height, na.rm = T),
            mediana = median(height, na.rm = T)) 

# rename - modifica o nome de uma vari�vel

starwars %>%
  rename(novo_nome = hair_color)

# slice - permite indexar linhas pelas suas localiza��es

starwars %>%
  slice_sample(n = 5)

starwars %>%
  slice_head(n = 10)

starwars %>%
  slice_tail(n = 10)

starwars %>%
  slice_min(mass) # seleciona as observa��es relacionadas ao menor valor da massa

starwars %>%
  slice(n()) # Apresenta as �ltimas linhas da tabela

# Verificando outliers e valores extremos

library(rstatix)

starwars %>%   
  select(eye_color, height) %>%
  group_by(eye_color) %>% 
  identify_outliers(height)

