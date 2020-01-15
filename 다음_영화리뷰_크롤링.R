# install.packages("KoNLP")
# library(KoNLP)
# 
# useSejongDic()
# mergeUserDic(data.frame)

# 다음 영화 리뷰 크롤링 
setwd('C:/Users/user/Desktop/JH/R_programmig (2)/data(f)/Rcrawl/')
getwd()

install.packages("rvest")
library(rvest)

url_base = "https://movie.daum.net/moviedb/grade?movieId=127153&type=netizen&page="

all.reviews <- c()
for (page in 1:5) {
	url <- paste(url_base, page, sep='', encoding="euc-kr")
	htxt <- read_html(url)
	table <- html_nodes(htxt, ".review_info")
	content <-html_nodes(table, ".desc_review")
	reviews <- html_text(content)
	if(length(reviews)==0){break}
	all.reviews <- c(all.reviews, reviews)
	print(page)
}

read_html("https://movie.daum.net/moviedb/grade?movieId=127153&type=netizen&page=1")


write.table(all.reviews, "daum.txt")



