# Chapter 12: 使用 twmap 套件繪製台灣地圖
# twmap v1.2.6: https://github.com/mutolisp/twmap

library(twmap)

# 準備物種分布點資料（必須有 x, y, z 三欄）
# x, y 為經緯度或 TWD97，z 為海拔
set.seed(123)
pts <- data.frame(
  x = runif(150, 120.0, 122.0),
  y = runif(150, 21.8, 25.3),
  z = sample(0:3500, 150, replace = TRUE),
  species = sample(c("A", "B", "C"), 150, replace = TRUE)
)

# ========== 範例 1: 簡單全台灣分布圖 ==========
png("/Users/elvis/r-viz-site/assets/chapter12_twmap_simple.png",
    width = 900, height = 1100, res = 150)

distrmap.tw(
  pts = pts,
  theme = 1,           # 有顏色的地形圖
  cex = 0.6,
  pch = 19,
  col = "#8B0000",
  main = "台灣物種分布圖（twmap 預設樣式）"
)

dev.off()

# ========== 範例 2: 多物種 + 自訂顏色 ==========
png("/Users/elvis/r-viz-site/assets/chapter12_twmap_species.png",
    width = 900, height = 1100, res = 150)

# 不同物種用不同顏色
col_vec <- c("#8B0000", "#1a1714", "#4A90A4")[as.numeric(factor(pts$species))]

distrmap.tw(
  pts = pts,
  theme = 1,
  cex = 0.55,
  pch = 21,
  col = "white",
  bg = "#F5F0E8",
  main = "多物種分布示範",
  sub = "使用 twmap + 自訂觀測點"
)

# 重新疊加點（為了不同顏色）
points(pts$x, pts$y,
       pch = 21,
       bg = col_vec,
       col = "white",
       cex = 0.9)

legend("topright",
       legend = c("物種 A", "物種 B", "物種 C"),
       pch = 21,
       pt.bg = c("#8B0000", "#1a1714", "#4A90A4"),
       col = "white",
       cex = 1.1,
       bty = "n")

dev.off()

cat("✅ twmap 範例圖已生成：\n")
cat("  - chapter12_twmap_simple.png\n")
cat("  - chapter12_twmap_species.png\n")