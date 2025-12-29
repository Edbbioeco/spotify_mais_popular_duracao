# Pacotes ----

library(tidyverse)

library(magrittr)

# Dados ----

## Importando ----

dados <- readr::read_csv("spotify_songs.csv")

## Visualizando ----

dados

dados |> dplyr::glimpse()

## Tratando ----

# Histograma dos valores numérciso ----

## Nomes das variáveis ----

nomes_var <- dados |> 
  dplyr::select_if(is.numeric) |> 
  names()

nomes_var

## Loop para todas as variáveis ----

histo_vars <- function(nomes_var){
  
  ggplt <- dados |> 
    dplyr::select(nomes_var) |> 
    ggplot(aes(dados[[nomes_var]])) +
    geom_histogram(color = "black") +
    labs(title = nomes_var,
         x = nomes_var)
  
  print(ggplt)
  
}

purrr::walk(nomes_var, histo_vars)
