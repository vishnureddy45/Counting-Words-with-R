

sentences<-scan("test.txt","character",sep="\n");

# data<-read.csv("data.csv",header=TRUE,stringsAsFactors=FALSE)
# data <- data$text

sentences<-tolower(sentences)

#Function to remove words
rm_words <- function(string, words) {
  stopifnot(is.character(string), is.character(words))
  spltted <- strsplit(string, " ", fixed = TRUE) # fixed = TRUE for speedup
  vapply(spltted, function(x) paste(x[!tolower(x) %in% words], collapse = " "), character(1))
}

sentences <- rm_words(sentences, tm::stopwords("en"))

words<-strsplit(gsub("[^[:alnum:] ]", "", sentences), " ")

words<-words[words!=""]

words.freq<-table(words)

words.freq

