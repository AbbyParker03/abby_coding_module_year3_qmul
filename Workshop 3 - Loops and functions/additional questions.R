
#basic loop questions
x <- 111
  for(i in 1:5){
    z <- x / 13
  print(z)
}



x <- 4
y <- 6
for(i in 2:6){
    z <- x + y 
  print(z ^ i)
} 

#looping over non-integer vectors 

shrek <- c('WHAT' , 'ARE' , 'YOU' , 'DOING' , 'IN' , 'MY' , 'SWAMP')
for(i in shrek){          #using a character vector to loop with 'shrek'
  print(tolower(i))
}

shrek <- c('WHAT' , 'ARE' , 'YOU' , 'DOING' , 'IN' , 'MY' , 'SWAMP')
for(i in 1:length(shrek)){.     #using a integer vector to loop with (1:length(shrek)).
  print(tolower(shrek[i]))
}

words <- c('buzz' , 'cross' , 'broads' , 'fore' , '')
wordwords <- gsub(pattern = '$' , replacement = 'word' , x = words )

wordwords

surnames <- c('smith' , 'parker' , 'fallows' , 'short' , 'coppen', 
              'sutherland', 'cowley' , 'white' , 'neal' , 'boland')
intial_vec <- vector()
for(i in 1:length(surnames)){
  intial_vec[i] <- substr(surnames[i],1,1)
}    

intial_vec

x <- 0.999
while(x >= 0.5){
  x = x ^ 2
  print(x)
}

x <- 0.999
y <- 0 
while( x >= 0.5){
  x = x ^ 2 
  y = y +1
}

print(paste(c(' If you square 0.999 ' ,
              y, 
              ' times, you get a value of ' , 
              x)
            , collapse = ''))


fib_vec <- c(1,1)
  for(i in 3:12){
    fib_vec[i] <- fib_vec[i - 1] + fib_vec[i - 2]
  }


print(fib_vec)

fib <- function(x , y, z){
  sequence <- c(x , y , z)
  for(i in 4:20){
    sequence[i] <- sequence[i - 1] + sequence[i - 2] + sequence[i - 3]
  }
 return(sequence)
}

fib(2,2,2)

# the above code takes the Fibonacci sequence and takes 3 starting values and calculates each element as the previous 3 combined. ]
# it predicts up to 20 places. 

sumlow <- function (x){
  y <- unlist(strsplit(as.character(x)))
}

