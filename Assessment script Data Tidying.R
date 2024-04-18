#Abby Parker 210439799
library(tidyr)         #installing the packages for the assessment 
library(dplyr)

spotifymessy <- read.table('Spotify_Messy_210439799.txt' , sep = "\t" , header = T)         #reading in the data file 
spotifymessy
str(spotifymessy)        #checking the layout of the table to see the classes of each variable

all_equal <- spotifymessy$track_id == spotifymessy$track_album_id & spotifymessy$track_album_id == spotifymessy$playlist_id
all_equal #this has checked whether the columns track_id, track_album_id and playlist_id all contain the same information as this is not needed only one column containing this information is needed. 

spotifymessy <- spotifymessy %>% select(!track_album_id & !playlist_id)%>% 
  rename(track_album_playlist_id = track_id)
spotifymessy #this has removed the columns which are the same leaving just the track_id and renamed the track_id to contain album and playlist so that we can see that the all these ids are the same. 

spotifymessy <- spotifymessy %>% rename(track_name = TTrack_nameff5) #this renames the column TTrack_nameff5 as this is incorrect and overwrites the dataframe spotifymessy to include this new column name. 
spotifymessy

spotifymessy <- spotifymessy %>% separate_wider_delim("danceability.energy" , delim = "_",
                                                      names = c("danceability" , "energy"))%>%
  mutate("danceability" = as.numeric(danceability) , "energy" = as.numeric(energy))

str(spotifymessy) #this has changed the class of these variables from character to numeric by piping it onto the end of this code. 
spotifymessy #this separates the column danceability.energy column into two separate columns as these are both individual columns. 

spotifymessy <- pivot_longer(data = spotifymessy,
                             cols = c("pop" , "rap" , "rock" , "r.b" , "edm"),
                             names_to = "playlist_genre",
                             values_to = "playlist_sub_genre",
                             values_drop_na = TRUE) #this has pivoted the table get rid of the NA values in the last columns as there a cleaner way to represent this data that is easier to work with. 
spotifymessy

#i have removed the previous code and made a function to make it easier to search for the artist names 

artistnamecheck <- function(x){
  check_artist <- spotifymessy$track_artist[grep(x = spotifymessy$track_artist , pattern = x)]
  return (check_artist)
}     #this function has created a much easier way to check for the name of artists within the track_artist column allowing me to search for the particular artists of interest. 

artistnamecheck('t.t')  #taylor swift
artistnamecheck('s.a')  #shakira
artistnamecheck('j.n')  #janis joplin
artistnamecheck('t.s')  #the four owls
artistnamecheck('b.y')  #bad bunny

artistnamecheck('s.f') #taylor swift
artistnamecheck('y.r') #taylor swift
artistnamecheck('h.i') #shakira
artistnamecheck('a.a') #shakira
artistnamecheck('a.j') #janis joplin
artistnamecheck('i.l') #janis joplin
artistnamecheck('f.w') #the four owls
artistnamecheck('h.u') #the four owls
artistnamecheck('a.n') #bad bunny
artistnamecheck('d.n') #bad bunny
#after checking some more letters within the names of these artists i don't believe that any are present in the dataset. 

str(spotifymessy)
#this has checked the classes of each variable to check they are correct. 
#danceability and energy need to be changed from character to numeric. this can be piped to the previous code to do this in one go. 


spotifymessy <- spotifymessy %>% separate_wider_delim("track_album_release_date" , delim = "-",
                                                      names = c("track_album_release_year" , "track_album_release_month" , "track_albulm_release_day"),
                                                      too_few = "align_start")
spotifymessy     #when looking at the track album release date there were many dates that had 75 as the year. However after checking a couple a the release dates of these songs they all were released in different years, meaning 75 had no correlation.
#therefore i have separated the date into year, month and date so that it will be easy to use as not all the dates are formatted the same. 

spotifymessy <- spotifymessy %>%
  mutate(track_album_release_year = na_if(track_album_release_year, "75"))
spotifymessy
#this code has changed the year values that are 75 as these are not usually and turned them to NA as they are unknown. 

spotifymessy <- spotifymessy %>% mutate("mode" = as.integer(gsub(pattern = "T" , "" , x = mode)))
spotifymessy #in the mode column there is T present on some of the integers which need to be removed. 
#this converts mode to an integer class and removes the T. 

danceabilitycomparison <- spotifymessy %>% select(track_album_playlist_id:danceability)
danceabilitycomparison      
#it is stated than a collague wants to compare the danceability scores across the playlists 
#this vector contains only the playlist information columns and the danceability column making it easier to compare without the other columns. 

write.csv(spotifymessy , file = "cleaned data.csv")
cleaned_data <- read.csv("cleaned data.csv" , header = TRUE , sep = ",")
