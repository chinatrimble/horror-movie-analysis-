install.packages("tidyverse")
install.packages("lubridate")
library(readr)
library(dplyr)
library(ggplot2)

movies <- read_csv("top-TMDB-movies.csv")
colnames(movies)

horror_movies <- movies %>%
  filter(grepl("Horror", genre))
head(horror_movies)

horror_clean <- horror_movies %>% 
  filter(vote_count >= 2000) 
head(horror_clean)

library(dplyr)

top_genres <- horror_movies %>%
  group_by(genre) %>%
  summarise(
    avg_rating = mean(vote_average, na.rm = TRUE),
    avg_votes = mean(vote_count, na.rm = TRUE)
  ) %>%
  filter(avg_votes >= 2000) %>% 
  arrange(desc(avg_rating)) %>%
  slice_head(n = 10)


head(top_genres)

ggplot(
  top_genres,
  aes(
    x = reorder(genre, avg_rating),
    y = avg_rating)) + 
  geom_col() +
  coord_flip() + 
  labs(
    title = "Top 10 Rated Horror Hybrids",
    x = "Genre Combination",
    y = "Average Rating"
  )
ggsave("top_horror_genres.png")

cor(horror_clean$popularity,
    horror_clean$vote_average)

cor(horror_movies$popularity,
    horror_movies$vote_average,
    use = "complete.obs")

ggplot(horror_movies,
       aes(x = popularity,
           y = vote_average)) +
  geom_point(alpha=.4) +
  labs(
    title = "Popularity vs Ratings for Horror Movies",
    x = "Popularity",
    y = "Vote Average"
  )
ggsave("popularity_vs_rating.png")

top_votes <- horror_movies %>% 
  group_by(genre) %>% 
  summarise(avg_votes = mean(vote_count, na.rm = TRUE)) %>% 
  arrange(desc(avg_votes)) %>% 
  slice_head(n = 10)

ggplot(top_votes,
       aes(x = reorder(genre,avg_votes), y = avg_votes)) + 
  geom_col() + 
  coord_flip()
ggsave("top_votes.png")