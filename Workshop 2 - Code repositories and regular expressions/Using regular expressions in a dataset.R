df<- read.csv('dung_beetles.csv')
# this is a dung beetle community data set. Each row is a sample, with a count of each species in each column. 
speciesnames <- colnames(df)[3:length(colnames(df))]
speciesnames # makes a new vector called speciesnames that includes all the species names. 

grep_beetles <- grep(x = speciesnames, pattern = '^C')
speciesnames[grep_beetles] # this finds all the names of speciess that have a genus that starts with the letter 'C'.

grep_second <-grep(pattern = '_r', x = speciesnames)
grep_second
speciesnames[grep_second] # this finds all the second words starting with 'r'

grep_typo<- gsub(pattern = 'Copis' , x=speciesnames , replacement = 'Copris')
grep_typo # this corrects the typos

grep_typo1 <- gsub(pattern = 'Microcopis', x=speciesnames , replacement = 'Microcopris' )
grep_typo1 # this also corrects the typos

grep_typo2 <- gsub('Copis', 'Copris', 
                 gsub ('Microcopis', 'Microcopris', 
                   x = speciesnames) )
grep_typo2 # this corrects all the typos into one command.

speciesnames<-gsub(x=speciesnames,pattern = 'opis', replacement = 'opris')
speciesnames

colnames(df)[3:length(colnames(df))] <- speciesnames

grep_species <- grep(pattern = '^O.+s$' , x = speciesnames)
speciesnames [grep_species]#this finds all the species where the genus starts with an O and the species name ends in a s. 

subsetted <- df[grep(x=df$Month , pattern = 'y$'), c(1,2, grep(x=colnames(df) , pattern = '^O'))]
subsetted #subsets the dataframe so that it only contains data from months ending in a 'y' and genera starting with a 'O'. 



