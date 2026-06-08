# R Vibe Coding Chapter Generator

這個 skill 會自動為 R Vibe Coding 網站的章節生成 R 圖片。

## 使用方式

```bash
# 1. 檢查 HTML 檔案
# 2. 根據 HTML 內容生成 R 程式碼
# 3. 執行 R 程式碼，生成圖片，存到 /Users/elvis/r-viz-site/assets

# 範例
r-viz-generate chapter-05
```

## 支援的章節

- chapter-00: 視覺化示範
- chapter-01: 視覺通道
- chapter-02: 圖表類型
- chapter-03: 顏色理論
- chapter-04: 構圖
- chapter-05: ggplot2 三要素
- chapter-06: 主題
- chapter-07: 多圖層
- chapter-08: 分面
- chapter-09: 倫理

## 技術細節

- 使用 ggplot2 + gridExtra 生成圖片
- 圖片存到 `/Users/elvis/r-viz-site/assets/`
- 圖片尺寸：1200x750，dpi 150
- 風格：米色背景 + 黑色 pixel 復古風

## 注意事項

- 確保 R 和 ggplot2 已安裝
- 確保 `gridExtra` 套件已安裝
- 圖片檔案名稱格式：`chapterXX_*.png`