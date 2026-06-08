# Generate Chapter 07, 08, 09 demo PNGs for R Vibe Coding site
# Style: clean ggplot2 with good visualization practices

library(ggplot2)
library(dplyr)

set.seed(42)
n <- 120
df <- data.frame(
  year = rep(2018:2023, each = 20),
  category = sample(c("A", "B", "C"), n, replace = TRUE),
  value = rnorm(n, mean = 50, sd = 15),
  group = sample(c("North", "South", "East", "West"), n, replace = TRUE)
)
df$value <- pmax(5, df$value)

# ========== Chapter 07: Layer Demo ==========
p7 <- ggplot(df, aes(x = year, y = value, color = category)) +
  geom_point(size = 2.5, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 1.2) +
  geom_text(
    data = df %>% group_by(year) %>% summarise(value = max(value)),
    aes(label = round(value, 0)),
    vjust = -0.8, size = 4, color = "#1a1714"
  ) +
  labs(
    title = "Chapter 07: 多圖層疊加示範",
    subtitle = "point + smooth + text annotation",
    x = "年份", y = "數值",
    caption = "資料來源：模擬資料 | 圖層順序：背景 → 資料 → 註解"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(color = "gray40"),
    legend.position = "bottom"
  )

ggsave("/Users/elvis/r-viz-site/assets/chapter07_layer_demo.png", p7, width = 10, height = 6, dpi = 150)

# ========== Chapter 08: Facet Demo ==========
p8 <- ggplot(df, aes(x = year, y = value, fill = category)) +
  geom_col(position = "dodge") +
  facet_wrap(~ group, ncol = 2, scales = "free_y") +
  labs(
    title = "Chapter 08: facet_wrap 示範",
    subtitle = "按地區分面，展示不同群組的趨勢",
    x = "年份", y = "數值",
    caption = "使用 facet_wrap(~ group, ncol = 2) 快速建立小多圖"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    strip.background = element_rect(fill = "#f5f0e8", color = "#4a3f35"),
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold", size = 16)
  )

ggsave("/Users/elvis/r-viz-site/assets/chapter08_facet_demo.png", p8, width = 10, height = 7, dpi = 150)

# ========== Chapter 09: Ethics Demo (Good vs Bad) ==========
# Bad chart: misleading y-axis, no labels, ugly colors
p9_bad <- ggplot(df %>% filter(category == "A"), aes(x = year, y = value)) +
  geom_col(fill = "pink") +
  labs(title = "壞圖：誤導性視覺化") +
  theme_minimal() +
  theme(plot.title = element_text(color = "red", size = 14))

# Good chart: proper scale, labels, source, better aesthetics
p9_good <- ggplot(df, aes(x = factor(year), y = value, fill = category)) +
  geom_boxplot(outlier.shape = 21, outlier.fill = "white") +
  labs(
    title = "好圖：誠實且清晰的呈現",
    subtitle = "箱形圖顯示分布、中位數、四分位數",
    x = "年份", y = "數值",
    fill = "類別",
    caption = "資料來源：模擬資料 | 避免截斷 y 軸 | 清楚標示來源"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 16, color = "#1a1714"),
    plot.subtitle = element_text(color = "gray40"),
    legend.position = "bottom"
  )

# Combine good vs bad
library(patchwork)
p9 <- (p9_bad + p9_good) +
  plot_annotation(
    title = "Chapter 09: 視覺化倫理 — 好圖 vs 壞圖",
    subtitle = "左：誤導讀者 | 右：誠實呈現",
    theme = theme(plot.title = element_text(size = 18, face = "bold"))
  )

ggsave("/Users/elvis/r-viz-site/assets/chapter09_ethics_demo.png", p9, width = 14, height = 6, dpi = 150)

cat("✅ Chapter 07, 08, 09 PNGs generated successfully!\n")