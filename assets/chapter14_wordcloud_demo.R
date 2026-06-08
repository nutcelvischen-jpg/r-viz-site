# Chapter 14: 文字視覺化與詞雲示範
library(ggplot2)
library(dplyr)

# 模擬詞頻資料
set.seed(42)
words <- c("資料", "視覺化", "分析", "R語言", "ggplot2", "機器學習", 
           "統計", "圖表", "互動", "儀表板", "時間序列", "相關性",
           "台灣", "地圖", "詞雲", "文字探勘", "情緒分析")

freq <- sample(30:120, length(words), replace = TRUE)

df <- data.frame(word = words, freq = freq)

# 簡易詞雲風格視覺化（用 ggplot2 模擬）
p <- ggplot(df, aes(label = word, size = freq)) +
  geom_text(aes(x = runif(length(words), 1, 10), 
                y = runif(length(words), 1, 8),
                color = freq),
            check_overlap = TRUE) +
  scale_size(range = c(4, 18)) +
  scale_color_gradient(low = "#c45c5c", high = "#8B0000") +
  labs(title = "Chapter 14: 文字視覺化與詞雲",
       subtitle = "詞彙大小代表出現頻率") +
  theme_void(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

ggsave("/Users/elvis/r-viz-site/assets/chapter14_wordcloud_demo.png", 
       p, width = 10, height = 7, dpi = 150)

cat("✅ Chapter 14 詞雲 PNG 已生成\n")