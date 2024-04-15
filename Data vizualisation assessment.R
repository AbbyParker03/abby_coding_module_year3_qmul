#Abby Parker
#210439799


install.packages("tidyverse")
library(tidyverse)
library(patchwork)



#loading in the spotify dataset 
spotify_songs <- tibble(readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv'))

#loading in additional datsets the top 50 songs in 2018/2019
top18_19<- read.csv("Top2018_2019.csv")             
                   
#loading in additional datasets the top 50 songs in 2020
top50_20 <- read.csv("Top2020.csv")



#this has changed danceability into a percentage rather than decimal making it easier to compare with the other datasets. 
spotify_songs$danceability <- 100*(spotify_songs$danceability)


#this has created a vector with the outliers of the dataset which have a low danceability but a high popularity
outliers <- spotify_songs %>% group_by(track_popularity)%>%
  summarise(mean_dance = mean(danceability))%>%
  filter(mean_dance < 67 & track_popularity > 75)



#grouped the track popularities together and calculated the mean danceability for each popularity. 
#then created a ggplot with popularity on the x axis and mean danceability on the y to show their relationship.
#i then plotted a scatter plot and a line to assess their relationship. 
#used geom_text to hilight the datapoints with a low danceability but a high popularity and labelled them as outlier


p1 <- spotify_songs %>% group_by(track_popularity)%>%
  summarise(mean_dance = mean(danceability))%>%
  ggplot(aes(x = mean_dance , y = track_popularity))+
  geom_point()+
  geom_smooth(method = "gam" , se = FALSE)+
  labs(title = "Impact of danceability on track popularity of songs listened to in 2020",
       x = "Mean danceability",
       y = "Track popularity", 
       subtitle = "By Abby Parker 210439799")+
  geom_text(
    data = outliers,
    mapping = aes(label = "outlier"),
    nudge_y = 1,
    nudge_x = -0.5,
    colour = "purple")



#this again has grouped the track popularities together and calculated the mean danceability for each popularity of the top 50 songs in 2019 and 2018 which is before covid-19. 
#created a ggplot, but instead of a line graph, i used geom smooth to show the overall correlation between mean danceability and popularity. 
#i have used the theme function to make the title font size smaller so that it would fit in the patchwork. 


p2 <- top18_19 %>% group_by(pop)%>%
  summarise(mean_dance = mean(dnce))%>%
  ggplot(aes(x = mean_dance , y = pop))+
  geom_point()+
  geom_smooth(method = "lm" , se = FALSE, colour = "blue")+
  labs(title = "Impact of danceability on the top 50 songs before COVID-19", 
       x = "Mean danceability",
       y = "Track popularity")+
  theme(plot.title = element_text(size = 12))



#this has done the same things again, however it is for the top 50 songs in 2020 which is during covid-19.
#i have used the same graph to show this information as above. 
#and used the theme function to ensure the title fitted into the patchwork. 


p3 <- top50_20 %>% group_by(pop)%>%
  summarise(mean_dance = mean(dnce))%>%
  ggplot(aes(x = mean_dance , y = pop))+
  geom_point()+
  geom_smooth(method = "lm" , se = FALSE, colour = "blue")+
  labs (title = "Impact of danceability on the top 50 songs during COVID-19", 
   x = "Mean danceability",
   y = "Track popularity")+
  theme(plot.title = element_text(size = 12))



#this has used the patchwork function to but all the graphs together so they can easily be compared. 
p1/(p2+p3)



