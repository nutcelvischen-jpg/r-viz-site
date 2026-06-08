# Chapter 11: 相關性與多變量視覺化示範（純 base + ggplot2）
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

# 手動建立相關係數矩陣長格式
cor_matrix <- cor(df)
vars <- colnames(cor_matrix)

cor_df <- expand.grid(Var1 = vars, Var2 = vars)
cor_df$value <- as.vector(cor_matrix)

p1 <- ggplot(cor_df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "#1a1714", linewidth = 1.5) +
  geom_text(aes(label = round(value, 2)), color = "white", size = 6, fontface = "bold") +
  scale_fill_gradient2(low = "#4a3f35", mid = "#c45c5c", high = "#8B0000", 
                       midpoint = 0, limits = c(-1, 1)) +
  labs(title = "相關係數熱圖", x = "", y = "") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 18))

p2 <- ggplot(df, aes(x = varA, y = varB)) +
  geom_point(color = "#8B0000", size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", color = "#1a1714", se = FALSE, linewidth = 1.2) +
  labs(title = "變數A vs 變數B（散點圖）", x = "varA", y = "varB") +
  theme_minimal(base_size = 14)

library(patchwork)
final <- p1 / p2 + plot_annotation(
  title = "Chapter 11: 相關性與多變量視覺化",
  theme = theme(plot.title = element_text(size = 20, face = "bold"))
)

ggsave("/Users/elvis/r-viz-site/assets/chapter11_correlation_demo.png", 
       final, width = 10, height = 9, dpi = 150)

cat("✅ Chapter 11 相關性 PNG 已生成\n")