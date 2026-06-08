library(ggplot2)
df <- data.frame(
  asset = c("台股", "美股", "債券", "現金"),
  weight = c(45, 30, 15, 10)
)
p <- ggplot(df, aes(x = "", y = weight, fill = asset)) +
  geom_col(width = 1) +
  coord_polar("y") +
  labs(title = "Chapter 16: 投資組合配置") +
  theme_void()
ggsave("/Users/elvis/r-viz-site/assets/chapter16_portfolio_demo.png", p, width = 8, height = 6, dpi = 150)
cat("Chapter 16 done\n")