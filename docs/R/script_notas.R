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
