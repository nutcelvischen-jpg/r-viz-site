#!/usr/bin/env Rscript
# R Vibe Coding Chapter Generator
# 用法: Rscript generate-chapter.R chapter-05

args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0) {
  cat("用法: Rscript generate-chapter.R chapter-05\n")
  quit(status = 1)
}

chapter <- args[1]
output_dir <- "/Users/elvis/r-viz-site/assets"

# 確保輸出目錄存在
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

library(ggplot2)
library(gridExtra)

# 根據章節生成對應的圖片
if (chapter == "chapter-00") {
  df <- data.frame(year = 2023:2026, value = c(124, 138, 167, 201))
  p1 <- ggplot(df, aes(x = year, y = value)) +
    geom_col(fill = "#8B0000") +
    labs(title = "壞圖：只有數字") +
    theme_minimal(base_size = 14)
  p2 <- ggplot(df, aes(x = year, y = value)) +
    geom_line(color = "#8B0000", linewidth = 1.5) +
    geom_point(color = "#8B0000", size = 4) +
    labs(title = "好圖：清楚呈現趨勢") +
    theme_minimal(base_size = 14)
  p <- grid.arrange(p1, p2, ncol = 2)
  ggsave(file.path(output_dir, "chapter00_visualization_demo.png"), 
         p, width = 12, height = 5, dpi = 150)
  
} else if (chapter == "chapter-05") {
  df <- data.frame(
    category = rep(c("A", "B", "C"), each = 3),
    group = rep(c("X", "Y", "Z"), 3),
    value = c(10, 15, 12, 8, 20, 14, 18, 9, 16)
  )
  p1 <- ggplot(df, aes(x = category, y = value, fill = group)) +
    geom_col(position = "dodge") +
    labs(title = "aes() 全域 vs 區域") +
    theme_minimal(base_size = 14)
  p2 <- ggplot(df, aes(x = category, y = value, fill = group)) +
    geom_col(position = "dodge") +
    labs(title = "條件式顏色") +
    theme_minimal(base_size = 14) +
    scale_fill_manual(values = c("#8B0000", "#006400", "#4a3f35"))
  p <- grid.arrange(p1, p2, ncol = 2)
  ggsave(file.path(output_dir, "chapter05_ggplot_demo.png"), 
         p, width = 12, height = 5, dpi = 150)
  
} else {
  cat("尚未支援的章節:", chapter, "\n")
  quit(status = 1)
}

cat("圖片已生成:", chapter, "\n")