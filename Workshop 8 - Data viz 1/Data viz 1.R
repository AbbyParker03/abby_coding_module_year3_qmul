#the grammar of graphics - ggplot2
#geometric objects that display our data are caled geoms (geom_point)
#each geom has features, which are called aesthetics (position along the x and y axis, shape, size or colour)
#we map variables of our data to those aesthhetic. 

install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse) #installing the packages 

head(penguins)
palmerpenguins::penguins
penguins<- penguins
str(penguins)     #looking at the penguins dataframe 

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm , y = body_mass_g))

#this uses the data penguins, and the columns bill length and body mass. 

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g , colour = species))

#this correlates the different species with a colour to see the different clusters are species differences. 


ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm , y = body_mass_g, colour = species, shape = island))

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g, colour = island))

#this correlates the species shown in colour and the island they are on by shape. 
#the correlation between clusters and island is not at strong. 

ggplot(data = penguins) +
  geom_point(mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_smooth(mapping = aes(x = bill_length_mm, y = body_mass_g))

#this adds layers to our plot by specifying additional geoms. 
#we can clean this code as we don't need to repeat the mapping of variables if we use the same ones in different layers.
#we can pass them to ggplot() which means they will be inherited by the geoms that follow

ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g))+
  geom_point() +
  geom_smooth()
#this has done the same thing as the code above but is cleaner 

ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species))+
  geom_smooth()
#this curve is still going through all three species 

ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species))+
  geom_smooth(mapping = aes(colour = species))
#this gives each cluster its own curve 

pengu_plot <- ggplot(data = penguins, 
                     mapping = aes(x = bill_length_mm, y = body_mass_g))+
  geom_point(aes(colour = species))

pengu_plot +
  geom_smooth()
#this has assigned it to a variable and we can add other layers after. 

ggplot(data = penguins, mapping = aes(x = bill_length_mm , y = bill_depth_mm))+
  geom_point(mapping = aes(colour = species , shape = species))+
  geom_smooth(mapping = aes(colour = species), method = lm, se = FALSE)
#this has created a ggplot with straight lines and has removed the confidence interval. 
#method = lm makes it a straight line 
#se = FALSE removes the confidence intervals 

ggsave(filename = "penguin_plot_1.png" , plot = pengu_plot)
#this will save our plots to a file using ggsave this gives it a plot variable

pengu_plot +
  geom_smooth()
ggsave("penguin_plot_2.png")

ggsave(filename = "penguin_plot_200mmx300mm.png" , plot = pengu, width = 300, height = 200, units = 'mm')
#this has saved the documentation with the linear model lines as a 200mm x 300mm

#if we want to innvestigate the body_mass for each species we can use box plots. 
 ggplot(data = penguins,
        mapping = aes(x = species, y = body_mass_g))+
   geom_boxplot(mapping = aes(fill = species))
 #this only changes the colour of the line, how to fill the boxes? 
 
# if we want to determine the order in which we display our data factors come into handy. 
# the three species in penguins can be defined as factors 
#factors have levels whc=ich are essentially rank positions for each unique value. 
#by default levels are in alphanumerical order. 
 
head(penguins) #shows the class and factor 
str(penguins) #str also shows the levels 

df_days <-
  data.frame(day = c("Mon", "Tues", "Wed", "Thu"),
             counts = c(3, 8, 10, 5))
df_days$day <- as.factor(df_days$day)
str(df_days)

ggplot(data = df_days, mapping = aes(x = day, y = counts)) +
  geom_col()
#here is an example where alphanumerical order is annoying

df_days$day <- factor(df_days$day, levels = c("Mon", "Tues", "Wed", "Thu"))
str(df_days)

ggplot(data = df_days, mapping = aes(x = day, y = counts)) +
  geom_col()
#this can be changed very easily by using the command factor and levels

penguins$species <- factor(penguins$species, levels = c("Chinstrap" , "Gentoo" , "Adelie"))

penguin_1 <- ggplot(data = penguins,
       mapping =  aes(x = species , y = body_mass_g))+
  geom_violin(mapping = aes(fill = island))

penguin_1
#this has created a ggplot of the body mass of each species on each island 

#lots of geom do statistical transformations i.e. calcualtions of counts, means etc by default. 

ggplot(data = penguins) +
  geom_bar(mapping = aes(x = species)) +
  coord_flip()
#geom calculates statistics the dataframe doesn't include
#geom_bar() calculates the counts of these penguins 

#geom_bar makes the height of the bar proportional to the number of cases in each group. uses stat_count() it counts the number of cases at each x position
#geom_col if you want the heights of the bars to represent values in the data. uses stat_identity it leaves the data as is. 

#coord_flip() useful for geoms and statistics that do not support the orientation setting, and converting the display of y conditional on x, to x conditional on y.


#the plot on the left is transparent and the one on the right is not 

penguins$species <- factor(penguins$species , levels = c("Adelie" , "Chinstrap" , "Gentoo"))

ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm))+
  geom_histogram(mapping = aes(fill = species) , alpha = 0.5)

#alpha makes then transparent, the position function for this plot is "stack"

ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm))+
  geom_histogram(mapping = aes(fill = species), position = 'identity' , alpha = 0.5)
#position overlaps the hiostograms so they can be seen clearer 

#plotting only a subset using filter()
penguins %>% filter(!species == "Chinstrap") %>%
  ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(colour = species, shape = island))

#filter() is useful together with the function is.na() to get rid of NAs

penguins %>% filter(!sex == is.na(sex))%>%
  ggplot(mapping = aes(x = species , y = body_mass_g))+
  geom_violin(mapping = aes(fill = sex))
#this uses the filter and is.na to remove the na values in the column sex 

#the function to manipulate or add labels is labs()
penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Plot generated by E. Busch-Nentwich, March 2023",
       x = "Species",
       y = "Weight in g",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  )

#changing the legend labels can not be done within labs()
#here we have mapped a variable (sex) to fill, so the function to use is scale_fill_discrete()
#this also allows you to change the colours. 

penguins %>%
  ggplot(mapping = aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Plot generated by E. Busch-Nentwich, March 2023",
       x = "Species",
       y = "Weight in g",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
  ) +
  scale_fill_discrete(name = "Sex",
                      labels = c("Female", "Male", "Unknown"),
                      type = c("yellow3", "magenta4", "grey"))


penguins %>% filter(!sex == is.na(sex))%>%
  ggplot(mapping = aes(x = species , y = body_mass_g))+
  geom_violin(mapping = aes(fill = sex)) +
  labs(title = "Weight distribution among penguins",
       subtitle = "Plot generated by A.Parker, March 2023",
       x = "Species",
       y = "Weight in g",
       caption = "Data from Palmer Penguins package\nhttps://allisonhorst.github.io/palmerpenguins/"
       ) +
  scale_fill_discrete(name = "Sex",
                      labels = c("Female" , "Male"),
                      type = c("pink" , "purple"))


malaria <- read.csv("wmr_modelling.txt" , header = T , sep = "\t")
head(malaria)

#filter for 2020 and reorder in deaths order 
malaria20 <- malaria %>% filter(year == 2020) %>% arrange(deaths)
malaria20

#make countries factors in the order of deaths 
deathorder20 <-malaria20$country
malaria20$country <- factor(malaria20$country , levels = deathorder20)
deathorder20

#plot data
ggplot(data = malaria20,
       mapping = aes(x = country , y = deaths))+
  geom_col()+
  coord_flip()+
  labs(title = "Malaria Deaths in 2020")










