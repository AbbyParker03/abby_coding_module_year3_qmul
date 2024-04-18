beetles1 <-read.csv("dung_beetles_v1.csv")
beetles1
#importing version 1 of dung beetles 

beetles2 <- read.csv("dung_beetles_v2.csv")
beetles2
#importing version 2 of dung beetles 

beetles3 <- read.csv("dung_beetles_v3.csv")
beetles3
#importing version 3 of dung beetles 

beetles4 <- read.csv("dung_beetles_v4.csv")
beetles4
#importing version 4 of dung beetles

#which of the three rules does each table fail?
#1 - each observation is not in its own row. 
#2 - each value should have its own cell
#3 - each value should have its own cell 
#4 - this is the tidy table 

#the tidy table is beetles 4
#each column is a variable 
#each row is a observation 
#each value has its own cell 

usites <- unique(beetles1$Site)
length(usites)
#gets all the unique values and counts the length of the vector of the site column in beetles1.

colnames(beetles1)[3:ncol(beetles1)]
#this counts the number of species from beetles1 

uspecies <- unique(beetles3$spp)
length(uspecies)
#gets all the unique values in beetles 3 species column and counts the number of species. there are 3 beetle species 

uall <- unique(colnames(beetles4))
length(uall)

#beetles4 allows you to count all unique values for Sites, Months and Species. 

str(beetles4) #this allows you to see the classes of each variable
summary(beetles4) #this provides some summary stastics on numeric data
head(beetles4) #shows the first chunk of data to see how it is formatted includes the headings. 
View(beetles4) # this opens the data set into a new window in R in a table. 

beetlesdf <- read.table("dung_beetles_read_1.csv" , sep = "," , header = T)
beetlesdf
#this is what read.csv uses under the hood 
#we had to use the separator to tell read.table that this file has a header. they are set by default in read.csv
#read.table is a lot more complex changing the default arguments lets us read in files in many different formats. 

?read.table
beetles2 <- read.table("dung_beetles_read_2.txt" , 
           sep = "\t" ,  #each line of the file is separated by a tab which is "\t"
           header = T )
beetles2

beetles3 <- read.table("dung_beetles_read_3.txt",
                       sep = "\t",
                       skip = 1 ,  #this skips the first line so that the table can be read. 
                       header = T)
beetles3

#beetlesdf has a common problem and only printed each site number once 
#these blank spaces need filling 
#fill is in a package called tibyr

library(tidyr)
?fill #fills missing values in selected columns using the next or previous entry. 

fill(beetlesdf , Site) #this fills the empty values with the data

beetlesdf <- fill(beetlesdf, Site)
beetlesdf

beetlesdf2 <- read.table("dung_beetles_read_4.txt",
                         sep = "\t",
                         header = T,
                         na.strings = "-") #in the read table the empty cells where filled with '-' in order to use the fill function these need to be NA, na.strings changes the dashes to NA.
beetlesdf2
fill(beetlesdf2 , Site)
beetlesdf2 <- fill(beetlesdf2 , Site)
beetlesdf2

#where we have more than one function applied to a table 
#R has a way to take the output of one function, and shove it straight into the next
#this is called piping 
#symbol for piping is '% > %'

beetlesdf <- read.table("dung_beetles_read_1.csv",
                        sep = ",",
                        header = T) %>% fill(Site) #the output of both functions is now placed in the variable 'beetlesdf'
beetlesdf

#Pivoting 
#common problem in untidy data is that column headers are values, not variable names. 

#pivot_longer - manipulate your table so these column names become variables.

?pivot_longer

pivot_longer(data=beetlesdf, 
             cols = c("Caccobius_bawangensis", "Catharsius_dayacus", "Catharsius_renaudpauliani", "Copis_agnus", "Copis_ramosiceps", "Copis_sinicus", "Microcopis_doriae", "Microcopis_hidakai"),
             names_to="Spp") # this makes the table longer by putting all these column names together under a new column called 'Spp'.

pivot_longer(data=beetlesdf, 
             cols = 3:length(beetlesdf),
             names_to="Spp") 
#this is the same as above but just cleans the code up using the column numerical index. 

pivot_longer(data=beetlesdf, cols = starts_with("C") ) #this replaces the list of columns that start with C

pivot_longer(data = beetlesdf, cols = contains("_") , values_to = "count") #this selects all the columns as they all contain a _ as well as changing value to count. 

#Pivot_wider
#multiple variables are stored in one column. 

casesdf <- read.table("WMR2022_reported_cases_1.txt",
                      sep = "\t",
                      header = T,
                      na.strings = "")%>% fill(country)
casesdf
fill(casesdf, country)

casesdf <- pivot_wider(casesdf , 
            names_from = "method" , 
            values_from = "n")
casesdf

bigdata <-read.table("WMR2022_reported_cases_2.txt" , 
           sep = "\t",
           header = T,
           check.names = F,   #removes the X in front of the numbers in the column
           na.strings = "")%>%fill(country)

bigdata

bigdata<- pivot_longer(data = bigdata, 
             col = 3:length(bigdata),
             names_to = "Years")
bigdata


bigdata <- pivot_wider(bigdata,
                       names_from = "method",
                       values_from = "value")
bigdata

bigdata1 <-read.table("WMR2022_reported_cases_2.txt" , 
                     sep = "\t",
                     header = T,
                     check.names = F,   #removes the X in front of the numbers in the column
                     na.strings = "")%>%
  fill(country) %>% 
  pivot_longer(., col = 3:14,names_to = "Years") %>% 
  pivot_wider(., names_from = 2 ,  values_from = 4)

bigdata1

#by adding in the dot and comma this shows where the input function would be. 