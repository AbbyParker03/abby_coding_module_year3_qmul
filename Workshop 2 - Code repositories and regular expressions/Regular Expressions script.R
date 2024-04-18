sentence <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out', 'and', 'everybody', 'was', 'asleep.', 'Everybody,', 'that', 'is,', 'except', 'for', 'Guih', 'Kyom', 'the', 'dung', 'beetle.', 'He', 'was', 'wide', 'awake', 'and', 'on', 'duty,', 'lying', 'on', 'his', 'back', 'with', 'his', 'legs', 'in', 'the', 'air', 'to', 'save', 'the', 'world', 'in', 'case', 'the', 'heavens', 'fell.')
grep_out<-grep(pattern = 'the', x=sentence) # pattern is what we want to look for in our text. x is the character vector to search through. 
grep_out
sentence[grep_out]# this subscripts the sentence returning all the words at the positions grep() gave us 

grep_out<-grep(pattern='^the$', x=sentence)
grep_out
sentence[grep_out] # using ^ and $ makes it find the words starting with T and ending with E to not include the word They. 

grep_in<-grep(pattern='^in$' , x=sentence)
grep_in
sentence[grep_in]

grep_3<- grep(pattern = 'his & on' , x=sentence)
grep_3
sentence[grep_3]

grep_out <-grep(pattern = '[A-Z]', x = sentence)
grep_out
sentence[grep_out] # searching within vector sentence for capital letters 

grep_out<- grep(pattern = '[a-z]' , x=sentence)
grep_out # this finds all the words as they all contain a lowercase between a-z 

grep_out <- grep(pattern = 'a.e', x = sentence)
grep_out
sentence[grep_out] # grep has found four elements that contain an 'a' and 'e' and are separated by a any character. 


grep_out <-grep(pattern = 'c.s', x = sentence)
grep_out
sentence [grep_out] # finds words with a character between c and s

# use of quantifies, specifies how many of a character grep()is matching to. 
# three main symbols are '?' '*' '+'
# ? denotes 0 or 1 instances 
# * denotes 0 or more instances 
# + denotes 1 or more instances

sentence[grep(pattern = 'e.?e', x = sentence)]#this shows whether there is none or one character between two E's. 
sentence[grep(pattern = 'e.*e', x=sentence)] # this shows all the words with two E's with 0 or more characters between them. 
sentence[grep(pattern = 'e.+e', x = sentence)] # this shows all the words with two E's and 1 or more characters between them. 

gsub_out <-gsub(pattern = 'a.e', x = sentence, replacement = '!!!')
gsub_out # this substitutes the matched text (pattern) with the text of our choosing which is the replacement. 

gsub_out <-gsub(pattern = 't', x=sentence , replacement = '?')
gsub_out # replaces all the t's with ? 




