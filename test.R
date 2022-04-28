library(ggplot2)
library(dplyr)
library(tidyverse)
library(tidyr)
library(gganimate)
library(gifski)
library(png)
library(ggthemes)


# RNA-Seq
all_pca <- read_csv("all_pca.csv")

graph1 <- all_pca %>% ggplot(aes(x = PC1, y = PC2, color = group)) + 
  geom_point(size = 3, alpha = 0.7, stroke = 0) +
  scale_size(range = c(6, 6), guide = "none") + 
  theme_calc() + 
  labs(title = "PCA across Ontology Gene Groupings") + 
  theme(axis.title = element_text(), 
        text = element_text(), 
        legend.text = element_text(size = 10)) 
graph1.animation = graph1 + transition_states(ontology_name, transition_length = 3, 
                                              state_length = 3) +
  labs(subtitle = "Ontology Names: {closest_state}") +
  shadow_wake(wake_length = 0.1)
animate(graph1.animation, height = 700, width = 600, fps = 30, end_pause = 5, res = 100, 
        duration = 15, renderer = gifski_renderer())
anim_save("all_pca.gif")

#Ribo-Seq
all_pca2 <- read_csv("all_pca2.csv")

graph2 <- all_pca2 %>% ggplot(aes(x = PC1, y = PC2, color = group)) + 
  geom_point(size = 3, alpha = 0.7, stroke = 0) +
  scale_size(range = c(6, 6), guide = "none") + 
  theme_calc() + 
  labs(title = "PCA across Ontology Gene Groupings") + 
  theme(axis.title = element_text(), 
        text = element_text(), 
        legend.text = element_text(size = 10)) 
graph2.animation = graph2 + transition_states(ontology_name, transition_length = 3, 
                                              state_length = 3) +
  labs(subtitle = "Ontology Names: {closest_state}") +
  shadow_wake(wake_length = 0.1)
animate(graph2.animation, height = 700, width = 600, fps = 30, end_pause = 5, res = 100, 
        duration = 15, renderer = gifski_renderer())
anim_save("all_pca2.gif")
