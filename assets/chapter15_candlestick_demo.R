library(ggplot2)
set.seed(123)
df <- data.frame(
  date = seq(as.Date("2024-01-01"), by = "day", length.out = 30),
  open = cumsum(rnorm(30, 0.5, 2)) + 100,
  close = cumsum(rnorm(30, 0.5, 2)) + 100,
  high = cumsum(rnorm(30, 0.5, 2)) + 105,
  low = cumsum(rnorm(30, 0.5, 2)) + 95
)
p <- ggplot(df, aes(x = date)) +
  geom_segment(aes(y = low, yend = high), color = "#1a1714") +
  geom_segment(aes(y = open, yend = close, color = close > open), linewidth = 4) +
  scale_color_manual(values = c("#4a3f35", "#8B0000")) +
  labs(title = "Chapter 15: K 線圖示範") +
  theme_minimal()
ggsave("/Users/elvis/r-viz-site/assets/chapter15_candlestick_demo.png", p, width = 10, height = 5, dpi = 150)
cat("Chapter 15 done\n")