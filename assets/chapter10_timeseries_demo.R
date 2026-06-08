# Chapter 10: 時間序列視覺化示範
library(ggplot2)
library(dplyr)
library(lubridate)

set.seed(42)

# 模擬 24 個月時間序列資料
dates <- seq(as.Date("2023-01-01"), by = "month", length.out = 24)
values <- 120 + cumsum(rnorm(24, 3, 8)) + 15 * sin(2 * pi * (1:24) / 12)

df <- data.frame(
  date = dates,
  value = values
)

# 計算 3 個月移動平均
df <- df %>%
  mutate(
    ma3 = zoo::rollmean(value, k = 3, fill = NA, align = "right"),
    month = month(date, label = TRUE)
  )

# 繪圖
p <- ggplot(df, aes(x = date)) +
  geom_line(aes(y = value), color = "#8B0000", linewidth = 1.2) +
  geom_line(aes(y = ma3), color = "#1a1714", linewidth = 1.5, linetype = "dashed") +
  geom_point(aes(y = value), color = "#8B0000", size = 2.5) +
  labs(
    title = "Chapter 10: 時間序列視覺化",
    subtitle = "原始數值 + 3 個月移動平均線",
    x = "日期", y = "數值",
    caption = "使用 ggplot2 + lubridate + zoo::rollmean"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(color = "gray40"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

ggsave("/Users/elvis/r-viz-site/assets/chapter10_timeseries_demo.png", 
       p, width = 10, height = 6, dpi = 150)

cat("✅ Chapter 10 時間序列 PNG 已生成\n")