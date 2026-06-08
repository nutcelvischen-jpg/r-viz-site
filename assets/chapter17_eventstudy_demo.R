library(ggplot2)
df <- data.frame(
  day = -10:10,
  car = cumsum(rnorm(21, 0.1, 0.8))
)
p <- ggplot(df, aes(x = day, y = car)) +
  geom_line(color = "#8B0000", linewidth = 1.5) +
  geom_vline(xintercept = 0, linetype = "dashed") +
  labs(title = "Chapter 17: 事件研究 - 累積異常報酬") +
  theme_minimal()
ggsave("/Users/elvis/r-viz-site/assets/chapter17_eventstudy_demo.png", p, width = 10, height = 5, dpi = 150)
cat("Chapter 17 done\n")