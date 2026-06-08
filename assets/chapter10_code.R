# Chapter 10: 時間序列視覺化完整範例
library(ggplot2)
library(dplyr)
library(lubridate)
library(zoo)

# 1. 日期格式處理
df <- data.frame(
  date = as.Date(c("2023-01-15", "2023-02-20", "2023-03-10")),
  value = c(120, 135, 148)
)

# 正確做法
df$date <- as.Date(df$date)

# 2. 移動平均
df <- df %>%
  mutate(ma3 = rollmean(value, k = 3, fill = NA, align = "right"))

# 3. 季節性分解（使用 AirPassengers 範例）
# decompose(AirPassengers)

# 4. 繪圖
ggplot(df, aes(x = date, y = value)) +
  geom_line(color = "#8B0000", linewidth = 1.2) +
  geom_line(aes(y = ma3), color = "#1a1714", linetype = "dashed") +
  labs(title = "時間序列 + 移動平均") +
  theme_minimal()