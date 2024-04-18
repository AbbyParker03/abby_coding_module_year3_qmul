#introduce a range of functions to clean, alter, and process data within your tables

library(tidyr) #installing packages
library(dplyr)

beetles <- read.table("dung_beetles.csv" , sep = "," , header = T)
str(beetles)
print(beetles) #reading in the file and looking at the raw data set. 

?select #tidy select is very flexible and this can be numbers, names, or a helper function. 

beetles %>% select(1:68) #this is clumsy and needs us to count all the columns. 

beetles %>% select (contains ("_")) # this selects only the species names as they all contain an "_"

beetles %>% select(c(Site, Month, contains("_"))) #this code using the contains function to include all the species names and the site and month column 
#this does not require you to count the columns. 

beetles %>% select(!Month) #this uses a negation operator "!" if this is put in front of any tidy-select command it will select everything except that. 

beetles2 <- beetles %>% select(!starts_with('X'))#this removes the extra columns at the end which start with an X.  
beetles2 

#filter function removes data from a dataset. 
#this selects subsets of rows based on specific criteria. 

beetles2 %>% 
  filter(Onthophagus_sideki > 10) # this removes rows (all sites) that were found to have less than 10 Onthophagus sideki

beetles3 <- beetles2 %>%
  filter(Onthophagus_sideki & Ochicanthon_woroae > 10) # 
                   
#when two species are included the number of rows decreases compared to when they are used alone. 
#this is because the more rows you are getting rid of the dataset can get smaller. 

beetles4 <- beetles2 %>%
  filter(Ochicanthon_woroae > 15 & Month == "July")

beetles2 %>% rename(c(Copris_agnus=Copis_agnus,
                     Copris_ramosiceps=Copis_ramosiceps))

fixcopris <- function(x){
  gsub("opis" , "opris" , x)
}

?rename

match<- beetles2 %>% rename_with(fixcopris, matches("Copis")) #this renames the columns using the function and the rename_with function 
match


beetles2 %>% rename_with(.,
                         .fn = ~ gsub("opis" , "opris" , .x),
              matches("Copis"))



??pivot_longer

newbeetles <- pivot_longer(data = beetles2,
             col = 3:length(beetles2),
             names_to = "Spp")%>%
  select(!starts_with("X")) %>%
  rename_with(fixcopris, matches("Copis"))
newbeetles
  
  rename_with(~ gsub("opis" , "opris" ,.x), matches("Copis"))
  

newbeetles
              
??matches                                


??separate_wider_delim


#separate 

newbeetles %>% separate_wider_delim("Spp" , delim = "_",
                                  names = c("genus" , "species"))
#this separates the spp column into genus and species. 


#mutate
#this will take a new column with the output of a function that we apply to a column. 

newbeetles %>% mutate("Spp" = gsub("_" , " " , Spp))


casesdf <- read.table("WMR2022_reported_cases_3.txt",
                      sep = "\t",
                      header = T,
                      na.strings = c(""))%>%
  fill(country)%>%
  pivot_longer(cols = c(3:14),
               names_to = "year",
               values_to = "cases")%>%
  pivot_wider(names_from = method,
              values_from = cases)%>% 
  rename (c("Suspected" = "Suspected cases",
            "Examined" = "Microscopy examined",
            "Positive" = "Microscopy positive"))

casesdf



casesdf <- casesdf %>% rename (c("Suspected" = "Suspected cases",
                                 "Examined" = "Microscopy examined",
                                 "Positive" = "Microscopy positive")) 
str(casesdf,vec.len = 2)

casesdf <- casesdf %>% mutate("year" = as.numeric(gsub("X" , "" , year)))
casesdf
str(casesdf)

casesdf <- casesdf %>% mutate("country" = gsub("[0-9]" ,"", country))
casesdf

casesdf <- casesdf %>% mutate("Suspected" = as.numeric(gsub("[^0-9]" , "" , Suspected)))
casesdf #this removes the values which don not start with a number. surely we still need those values? 

clean_number <- function(x){
  as.numeric(gsub("[^0-9]" , "" , x))
}
casesdf %>% mutate(clean_number("Suspected")) #this uses the function to clean the suspected column. 

?across


casesdf <- casesdf %>% mutate(across(c("Suspected" , "Examined" , "Positive") , clean_number))


casesdf %>% mutate(across(!country, clean_number))
#this is the tidy_select way to select everything except "country". 

 
casesdf %>% mutate(test_positivity = round("Positive" / "Examined",2))


str(casesdf)

casesdf %>% mutate("country" = as.factor(country))

levels(casesdf$country)

casesdf %>% mutate("country" = as.factor(gsub("Eritrae" , "Eritrea" , country)))
