# Chapter 13: 互動式儀表板完整範例
library(ggplot2)
library(plotly)
library(dplyr)

df <- data.frame(
  month = rep(month.abb[1:6], 4),
  product = rep(c("A", "B", "C", "D"), each = 6),
  sales = round(rnorm(24, 80, 25))
)

p <- ggplot(df, aes(x = month, y = sales, color = product)) +
  geom_line() +
  geom_point()

# 轉成 plotly 互動圖
ggplotly(p)