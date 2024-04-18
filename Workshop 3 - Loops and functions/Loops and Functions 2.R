#while loops

x <- 0 
while (x < 5){
  x <- x + 1
  print(paste('The number is now ' , x ,sep = ''))
}

# the code stops after 5 iterations as it takes 5 iterations for x > 5
# x starts at 0 and x becomes 5 at the start of the loop, before the print function.

x <- 1 
while(x %% 5 != 0 | x %% 6 != 0 | x %% 7 != 0){
  x <- x + 1
}

print(paste('The lowest number that is a factor of 5, 6 and 7 is ' , x, sep = ''))

# the logical statement 'x %% 5 != 0' checks whether x is a multiple of 5.  
# the code does not work if x starts as 0 as 0 divided by any number is 0 so the loop won't run. 

x <- 1 
while (x < 10){
  x <- x -1 
} # this code would run indefinitely as the values of x would always be below 10. 

x <- 0.999
while (x >= 0.5){
  x <- x ^ 2
}
print(x)    # this makes a loop that starts with a value of x <- 0.999 that squares x in each loop until x is less than 0.5. 

#basic functions 
# sometimes we need to do the same thing over and over and can write a function for this. 

powers <- function(x){   # the basic syntax to create a function is to define its name (powers) and inputs (in this case x) 
  y <- x ^ 2       # place the code that the function is composed of in the curly brackets
  return (y)       #most functions will also define an output using the return() function
}

powers(1)
powers(30)
powers(5189)

powers <- function (x){  #we have refined our previous function called powers() 
                       #as one that takes a value(x)
                          #calculate the square of that value (y) 
                        #and the cube of that value (z) amd returns them as a vector. 
  y <- x ^ 2
  z <- x ^ 3
  return (c(y , z))
}

powers(1)
powers(30)
powers(5189)



month_converter <- function(month){
  months <- c('January' , 'Feburary' , 'March' , 'April' , 'May' , 'June' , 'July' , 'August' , 'September', 'October' , 'November' , 'December')  
  return (grep(pattern = month, x = months))
}

month_converter('January')
month_converter('November')


month_converter <- function(month_input){
  months <- c('January' , 'February' , 'March' , 'April' , 'May' , 'June' , 'July' , 'August' , 'September' , 'October' , 'November' , 'December')
  output <- vector ()
  for(i in month_input){
    output[i] <- grep(pattern = i, x = months)
  }
  return(c(output))
}

month_converter(output('March' , 'April'))


powers <- function(x, y = 2){
  z <- x ^ y
  return(c(z))
}
powers(3) #y has the default value of 2 
powers(3, 3) #we now define y as 3. 

Bird <- function(x){    #i don't understand this 
  run <- paste(x, 'is the word', seq = '')
  return(run)
}
Bird('bird')


birds <- function(x){
  y <- gsub(pattern = '$' , x = x , replacement = ' is the word')
  return(y)
}
birds('bird')

Bird <- function(x , y = ' is the word'){
  run <- paste(x , y , seq = '')
  return(run)
}

Bird('bird')
Bird('bird' , 'is flying')


quotes <- list()       #the subscripting of a list is a double square bracket. 
quotes[[1]] <- c("We're", 'gonna', 'need', 'a', 'bigger', 'boat.')
quotes[[2]] <- c('Never', 'taken', 'a', 'shortcut', 'before?')

quotes[[1]][2:3] #use double brackets to show which list you want and then the single bracket to subscribt from that list 


fib <- function(x){ # define a function called fib that takes an input of x
  sequence <- c(x, x) # create a sequence where the first two values are x
  for(i in 3:10){ # loop over 3 to 10 
    sequence[i] <- sequence[i - 1] + sequence[i - 2] # save each position as the sum of the previous two (in positions 3 to 10)
  }
  return(sequence) # return the sequence
}
fib(1) # this returns the standard fibonacci sequence

fib(3)

output_list <- list()
for(i in 1:10){
  output_list[[i]] <- fib(i)
}
output_list[[3]][10] #the double brackets specify what number is put into the function, the single bracket picks out the specific number in that sequence. 

powers2 <- function(x , y){
  output <- vector()
  for(i in 1:y)
  output [i] <- x ^ i 
  return(output)
}
powers2(2 ,3)
powers2(3 , 4)

list_out <- list()
for(i in 1:10){
  list_out [[i]] <- powers2(3,i)
}

list_out[[5]]
