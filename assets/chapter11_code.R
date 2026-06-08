# Chapter 11: 相關性與多變量視覺化完整範例
library(ggplot2)
library(dplyr)

set.seed(123)
n <- 80
df <- data.frame(
  varA = rnorm(n, 50, 10),
  varB = rnorm(n, 30, 8),
  varC = rnorm(n, 70, 15)
)

df$varB <- df$varB + 0.7 * df$varA
df$varC <- df$varC - 0.4 * df$varA

# 相關係數熱圖
cor_df <- as.data.frame(as.table(cor(df)))
names(cor_df) <- c("Var1", "Var2", "value")

ggplot(cor_df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "#1a1714", linewidth = 1.5) +
  geom_text(aes(label = round(value, 2)), color = "white", size = 6) +
  scale_fill_gradient2(low = "#4a3f35", mid = "#c45c5c", high = "#8B0000", midpoint = 0) +
  theme_minimal() +
  labs(title = "相關係數熱圖")