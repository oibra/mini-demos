# install.packages('dplyr')
# install.packages('stringr')
# install.packages('tidytext')
# install.packages('tidyr')
# install.packages('ggplot2')

library(dplyr)
library(stringr)
library(tidytext)
library(tidyr)
library(ggplot2)

##### LEXICONS #####
# Use the get_sentiments() function to get your dictionary of positive
# and negative words. Use the lexicon which categorizes words into
# positive and negative.

bing_sentiments <- get_sentiments("bing")



##### DATA ANALYSIS + WRANGLING #####
# Read books data in 

books <- read.csv('./data/austen_books.csv', stringsAsFactors = F)




# Map each word in the 'books' dataset to its dictionary-prescribed sentiment.

jane_austin_sentiment <- books %>% 
  inner_join(bing_sentiments, by = "word")



# Instead of having each individual word, count the number of positive/negative
# words in each chapter.

jane_austin_sentiment <- jane_austin_sentiment %>% 
  count(book, chapter, sentiment)



# A chapter's overarching feeling will be calculated by the number of positive
# words minus the number of negative words. Create a new column called 
# 'sentiment' with this value.

jane_austin_sentiment <- jane_austin_sentiment %>% 
  spread(sentiment, n, fill = 0) %>% 
  mutate(sentiment = positive - negative)



##### CREATE OUR VISUALIZATION #####
# Use ggplot to plot each chapter's sentiment by book.

ggplot(jane_austin_sentiment, aes(sentiment, chapter, fill = book)) +
  geom_col(show.legend = F) +
  facet_wrap(~book, ncol = 2, scales = 'free_x')



