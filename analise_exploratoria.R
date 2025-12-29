# Pacotes ----

library(tidyverse)

# Dados ----

## Importando ----

dados <- readr::read_csv("spotify_songs.csv")

## Visualizando ----

dados

dados |> dplyr::glimpse()
