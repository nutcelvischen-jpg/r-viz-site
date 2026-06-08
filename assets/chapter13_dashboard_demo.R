# Chapter 13: 互動式儀表板示範
library(ggplot2)
library(dplyr)
library(patchwork)

set.seed(123)

# 模擬銷售資料
df <- data.frame(
  month = rep(month.abb[1:6], 4),
  product = rep(c("A", "B", "C", "D"), each = 6),
  sales = round(rnorm(24, 80, 25))
)

# 長條圖
p1 <- ggplot(df, aes(x = product, y = sales, fill = product)) +
  geom_col() +
  labs(title = "產品銷售額", x = "產品", y = "銷售額") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"))

# 折線圖
p2 <- ggplot(df, aes(x = month, y = sales, group = product, color = product)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2.5) +
  labs(title = "月度銷售趨勢", x = "月份", y = "銷售額") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold"))

# 合併
final <- (p1 | p2) + 
  plot_annotation(
    title = "Chapter 13: 互動式儀表板示範",
    theme = theme(plot.title = element_text(size = 18, face = "bold"))
  )

ggsave("/Users/elvis/r-viz-site/assets/chapter13_dashboard_demo.png", 
       final, width = 12, height = 5, dpi = 150)

cat("✅ Chapter 13 儀表板 PNG 已生成\n")