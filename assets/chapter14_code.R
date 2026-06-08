# Chapter 14: 文字視覺化與詞雲完整範例
library(wordcloud2)
library(jiebaR)

# 假設已斷詞的文字向量
words <- c("資料視覺化", "R語言", "ggplot2", "機器學習", "統計分析")

# 產生詞雲
wordcloud2(data.frame(word = words, freq = c(120, 95, 80, 65, 50)))