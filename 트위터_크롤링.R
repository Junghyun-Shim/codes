# 트위터 크롤링 및 워드클라우드 만들기
getwd()
install.packages(c("twitteR", "ROAuth", "base63enc"))
library(twitteR)
library(ROAuth)
library(base64enc)
library(devtools)
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
install.packages("tm")
library(tm)
install.packages("wordcloud2")
library(wordcloud2)
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
library(plyr)

consumerKey <- "Dvi0kMGKit5WrPtgVv9dAC9cX"
consumerSecret <- "HRhRrejXANp8zezabuVhvpioO3oKHJ4c45B3CM3ub5PW76NGfK"
accessToken <- "1217340948687929344-NKVEfaKyjGb7PPLsCOts73KviPrqUa"
accessTokenSecret <- "3S14h7L1wrnWscWbIuigwHQ7SfkPSGPp9vBHuDSZrl0eL"
setup_twitter_oauth(consumerKey, consumerSecret,accessToken,accessTokenSecret)

keyword <- enc2utf8("AI")

AI <- searchTwitter(keyword, n=2000, lang="en")
#한국어는 ko 영어는 en

length(AI)
head(AI)
View(AI)

AI_twitter.df <- twListToDF(AI)
AI_twitter.text <- AI_twitter.df$text

write.table(AI_twitter.text, "tw.txt")

#콘솔창이 1000개 까지만 보여주는데 만개 까지 보여주도록 설정
options(max.print=10000)

path <- "C:/Users/user/Desktop/JH/R_programmig (2)/data(f)/Rcrawl/tw.txt"
tw_txt <- readLines(path)
tw_txt

last_number_of_lines <- length(readLines(path))
last_number_of_lines
line_numbers <- seq(1, last_number_of_lines, 1)

doc_ids <- line_numbers

df <- data.frame(doc_id = doc_ids, text = tw_txt, stringsAsFactors = FALSE)

tw_data <- Corpus(DataframeSource(df))



inspect(tw_data)

text_delete = c("AI")

# tw_data <- tm_map(modi_data, removeWords,text_delete)



Sys.setlocale(category = "LC_ALL", locale = "us")

tw_data <- tm_map(tw_data, stripWhitespace)

tw_data <- tm_map(tw_data, tolower)

tw_data <- tm_map(tw_data, removeNumbers)

tw_data <- tm_map(tw_data, removeWords, stopwords("english"))

tw_data <- tm_map(tw_data, removePunctuation)

inspect(tw_data)

stopwords("english")



tdm_tw <- TermDocumentMatrix(tw_data)

TDM1 <- as.matrix((tdm_tw))

v=sort(rowSums(TDM1), decreasing =T)

profile = data.frame(word=names(v), freq=v)

head(profile, 10)





path2 <- paste0(getwd(),"./tw4.csv")



write.csv(profile, path2)

data <- read.csv(path2)

data <- data[,-1]

data <- data[-1,]

data_pick <- subset(data, freq >= 30)

head(data_pick, 20)





in_out_colors = "function(word,weight){return(weight>100) ? '#F3EF12',:#1EC612}"

x11()

wordcloud2(data_pick, shape="circle", size=0.5, backgroundColor = "white")

# figPath = system.file("./bird.png", package = "wordcloud2")
# figPath
# wordcloud2(demoFreq, figPath =figPath, size = 1.5,color = "skyblue")
