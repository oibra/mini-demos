# Student sentence analysis - look at sentiments of students' sentences

# install.packages('syuzhet')
library(syuzhet)

# Create a vector of emotional sentences. 
# Add some happy ones, angry ones - you name it!
student_sentences <- c('I really like the pie you gave me this morning.', 
                       'Your shoes suck and are just plain ugly.',
                       'I\'d really truly love going out in this weather!',
                       'I\'m so glad we\'re here today!',
                       'Andrew and Michelle\'s presentation was so good!'

                       )

# Analyze sentiment for student sentences

student_sentiments <- data.frame(get_sentiment(student_sentences, method = "syuzhet"))
# View(student_sentiments)

student_analysis <- cbind(sentence = student_sentences,
                          student_sentiments)
# View(student_analysis)
