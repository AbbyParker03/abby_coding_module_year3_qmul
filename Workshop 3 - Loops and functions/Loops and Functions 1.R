#loops, 'loop' over something many times, repeating a set of code. 
# most used type of loop is a 'for()' loop

for(i in 1:5){ #create a for loop that runs 5 times (1 to 5)
print (i)  # each time the for loop runs, print the value of i. 
}

#each time the codes run it processes the code between the curly brackets {} we have simply printed the object called i each time the loop runs. 
# i is what we call the iterable and its value is determined in each loop by the vector we specified (1:5)

x <- 0 #make a new scaler called x with a value of 0 

for(i in 1:10){ #create a for loop that runs 10 times (1 to 10)
  x <- x + i    #within our for loop we are adding the value of i to the value of x
}
 print(x) # the value of i becomes 55 (0+1+2+3+4+5+6+7+8+9+10) =55
 
for(i in 1:10){    #by adding print(x) into the loop command it shows how the numbers between 1:10 add together to make 55.
  x <- x + i
  print(x)    
}
 
for(i in 1:20){ #changing the numbers to 1:20
  x <- x + i 
}

 print(x) 

 x <-0 #scaler with a value of 0
 
 for(i in 6:36){  # changing the numbers to 6:36 with the print(x) showing how they reach 651. 
   x <- x + i 
   print (x) 
}
 
 z <- 4     #scaler with a value of 0
  for(i in 1:16){    # changing the numbers to 1:16
    z <- z + i
    print (z)
  }
 

for(f in 1:10){
 print(f)
}

print(x)

for (i in 10:20){  #this loops over the numbers 10 to 20 and prints the square of each. 
  print (i^2)
}

shrek_quote <- c('What' , 'are' , 'you' , 'doing' , 'in' , 'my' , 'swamp')
for (word in shrek_quote){        #the iterator is now word, rather than the usual i. 
  print(toupper(word))            # we could also use a numeric vector to accomplish the same task.
}

for(donkey in 1:length(shrek_quote)){
  print(toupper(shrek_quote[donkey]))
}

#what is the function of the following parts 
# donkey - is the iterative 
# toupper() - is making them to upper case
#1:length () - the length of the shrek_quote vector. number 1 starts at the first word if you change this to 2 it starts at the second word. to the length of the shrek_quote to loop over.
#shrek_quote - is the name of the vector (what are you doing in my swamp) input vector
#shrek_quote[donkey] - the word changes each time the loop runs. 


#saving outputs 

#a common requirement from a loop is to save your outputs, a way to do this is using an output vector. 

output <- vector() #creates an empty vector that we can fill with values. 

input <- c('red' , 'yellow' , 'green' , 'blue' , 'purple')
for (i in 1:length(input)){
  output[i] <- nchar(input[i])
}

print(output)

#nchar() counts the number of characters in a word.

wordwords <- vector()

words <- c('buzz' , 'cross' , 'broads' , 'fore' , '')
for (i in words){
  wordwords[i] <- paste(i, "word" , sep = '')
}

print(wordwords)
unlist(wordwords)

wordwords <-vector()
wordwords <-paste(words, 'word' , sep = '')   #paste() takes vectors as inputs
wordwords

#the conditional statement allows you to evaluate whether certain conditions are tru or not, and carry out tasks based on the outcome. 
#they always start with if() the code only runs if the statement if TRUE. 

numbers <- c(1 , 4 , 7 , 33 , 12.1 , 180000 , -20.5)

for(i in numbers){
  if( i > 5){          #when the i > 5 is TRUE the loop runs the print(i) line within the curly brackets following the if() statement. 
    print(i)
  }
}

#any logical expression can be used to create an if statement in this way. 

for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i , 'is less than five and an integer.' , sep = ''))
  }
}

#the conditional statement above states that if 'i' is less than five 'and' an integer then print. 
#the paste function in the above code writes 'is less than five and an integer' for each number. it sticks the number to the text and prints it. 

nums <- c(11 , 22 , 33 , -0.01 , 25 , 100000 , 7.2 , 0.3 , -2000 , 20 , 17 , -11 , 0)

for(i in nums){
  if(i > 15 & i %% 5 == 0){
    print(paste(i, 'is greater than 15 and divisible by 5.' , sep = ''))
  } else if(i <= 15 & i %% 5 == 0){
    print(paste(i, 'is not greater than 15 but is divisible by 5.', sep = ''))
  } else if(i > 15 & i %% 5 != 0){
    print(paste(i, 'is not divisible by 5 but is greater than 15.', sep = ''))
  } else {
    print(paste(i , 'is not greater than 15 and is not divisible by 5.', sep = ''))
  }
}

#what can define what code to run if the conditional is FALSE by using else()
#this is used after the initial if() statement. 

numbers <- c(1 , 4 , 7 , 33 , 12.1 , 180000 , -20.5)
for (i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else {
       print(paste(i, ' is not less than five or is not an integer (or both!).' , sep = ''))
     }
}

#we can combine the else and if() commands in the form of else if ()

for(i in numbers){
  if(i < 5 & i %% 1 == 0){
    print(paste(i, ' is less than five and an integer.', sep = ''))
  } else if(i < 5 & i %% 1 != 0){
    print(paste(i, ' is not an integer.', seq = ''))
  } else if(i >= 5 & i %% 1 == 0) {
    print(paste(i, ' is not less than five.', sep = ''))
  } else {
    print(paste(i, ' is not less than five and is not an integer.', sep = ''))
  }
}

number <- c(1, 1, 3, 5, 8, 13, 21)
 for(i in number){
    print(sqrt(i))
 }        
#loops the vector number and prints the square root of each number. 

movie <- c('Its' , 'not' , 'about' , 'the' , 'money.' , 'Its' , 'about' , 'sending' ,  'a' , 'message.')
for(i in movie){
  if(nchar(i) == 4 | nchar(i) == 5 | nchar(i) == 6){
    print(i)
  } else if (nchar(i) < 4){
    print('no')
  }else {
    print('harry potter')
  }
}

garbled_film_quote <- vector()
for(i in 1:length(movie)){
  if(nchar(movie[i]) == 4 | nchar(movie[i]) == 5 | nchar(movie[i]) == 6){
    garbled_film_quote[i] <-movie[i]
  }else if(nchar(movie[i]) < 4){
      garbled_film_quote[i] <- 'no'
  } else {
    garbled_film_quote[i] <- 'harry potter'
  }
    }
garbled_film_quote

alphabet <- matrix(data = c('A','B','C','D','E','F','G','H',
                            'I','J','K','L','M','N','O','P',
                            'Q','R','T','S','U','V','W','X',
                            'Y','Z'),
                   nrow = 2)
position <- matrix(data = c('first','second','third',
                            'fourth','fifth','sixth',
                            'seventh','eighth','ninth',
                            'tenth','eleventh','twelfth',
                            'thirteenth','fourteenth','fifteenth',
                            'sixteenth','seventeenth','eighteenth',
                            'nineteenth','twentieth','twenty first',
                            'twenty second','twenty third','twenty fourth',
                            'twenty fifth','twenty sixth'),
                   nrow = 2)

alphabet
position
for(i in 1:13){
  for(j in 1:2){
    print(paste(alphabet[j,i], ' is the ', position[j,i], ' letter of the alphabet.', collapse = ''))
  }
}

