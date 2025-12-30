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

dados %<>%
  dplyr::mutate(duration_ms = duration_ms / 1000)

dados

dados |> dplyr::glimpse()

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

# Gráfico de barra dos valores categóricos ----

## Nomes das variáveis ----

nomes_var_cat <- dados |> 
  dplyr::select_if(is.character) |> 
  names()

nomes_var_cat

## Loop para todas as variáveis ----

bar_vars <- function(nomes_var_cat){
  
  ggplt <- dados |> 
    dplyr::select(nomes_var_cat) |> 
    tidyr::pivot_longer(cols = dplyr::everything(),
                        names_to = "Variável",
                        values_to = "Categoria") |> 
    dplyr::summarise(Quantidade = dplyr::n(),
                     .by = Categoria) |> 
    ggplot(aes(Categoria, Quantidade)) +
    geom_col(color = "black") +
    labs(title = nomes_var) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  print(ggplt)
  
}

purrr::walk(nomes_var_cat, bar_vars)
