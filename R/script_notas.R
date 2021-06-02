#==============================================
# Script para testar lançamento de notas no R
# Ícaro Vidal Freire
# icarofreire7@gmail.com
#==============================================

# Carregando Pacotes ----------------------------------------------------------
library(tidyverse)
library(datapasta)

# Dados iniciais --------------------------------------------------------------
notas_base <- tribble(
  ~matricula, ~nome        ,
  "20101415"  , "JIRLEYDE" ,
  "201611179" , "JOSIANE"  ,
  "201111593" , "LUANA"    ,
  "201210054" , "MICHELL"  ,
  "201411224" , "MIQUEIAS" ,
  "2017204574", "NATIELY"  ,
  "2017204500", "REVVA"    ,
  "20101448"  , "VIVIANE"  ,
  "201611170" , "WASCHITON"
)

# Adicionando nota da Prova 01 ------------------------------------------------
nota <- notas_base %>%
  mutate(
    prova_01 = c(42, 52, 44, NA, 24, 100, 100, 40, 31)
  )

# Nota parcial ----------------------------------------------------------------
nota_parcial <- nota %>%
  select(matricula, prova_01)

nota_parcial

# Criando função de arredondamento

nota_licao <- function(n){
  round(n/23, 1)
}

nota_licao(1970)

# TESTES
nota_teste <- tribble(
  ~matricula  ,  ~prova_01, ~atv_01, ~atv_02, ~atv_03, ~atv_04, ~prova_02,
  "20101415"  ,  42, 58,  54, 45, 50, 35,
  "201611179" ,  52, 87, 100, 47, 65, 90,
  "201111593" ,  44, 58,  54, 45, 50, 53,
  "201210054" ,  NA, NA,  NA, NA, NA, NA,
  "201411224" ,  24, 87, 100, 47, 65, 78,
  "2017204574", 100, 95,  94, 80, 88, 98,
  "2017204500", 100, 95,  94, 80, 88, 97,
  "20101448"  ,  40, 58,  54, 45, 50, NA,
  "201611170" ,  31, 87, 100, 47, 65, 90
)


modi <- nota_teste %>%
  pivot_longer(
    !matricula,
    names_to = "todas_ativ",
    values_to = "notas"
  )

modi %>%
  group_by(matricula, todas_ativ) %>%
  summarise(
    media = mean(notas, na.rm = TRUE)
  )
