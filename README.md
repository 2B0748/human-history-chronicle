# 🌍 人类历史长卷 · Chronicle of Humanity

> 在 3D 地球与时间线上探索人类 700 万年文明史  
> Explore 7 million years of human civilization on a 3D globe and interactive timeline

---

## 📸 项目预览 / Preview

| 3D 地球 / 3D Globe | 时间线 / Timeline |
|:---:|:---:|
| 23 个历史地标，10 个时代 | 150+ 历史事件，线性叙事 |
| 拖拽旋转 · 缩放 · 点击详情 | 滚动阅读 · 金色时间线 |

---

## 🌐 在线体验 / Live Demo

打开 `earth-history.html` 即可体验 3D 地球浏览器。由于浏览器安全策略，需要通过本地服务器打开（Three.js 需从 CDN 加载）：

```bash
# 方法 1：npx（推荐）
npx http-server -p 8080

# 方法 2：Python
python -m http.server 8080

# 然后访问
# http://localhost:8080/earth-history.html     → 3D 地球
# http://localhost:8080/human-history.html     → 时间线
```

---

## 📂 项目结构 / Project Structure

```
├── earth-history.html      # 3D 交互式地球浏览器 (3744行)
├── human-history.html      # 线性历史时间线 (1836行)
├── people-history.html     # 人物志页面
├── images/
│   ├── people/             # 52 张历史人物画像 (Wikipedia)
│   └── real/               # 96 张历史场景照片 (Wikipedia)
└── README.md
```

---

## ✨ 功能特性 / Features

### 3D 地球浏览器 / 3D Globe Browser (`earth-history.html`)

| 功能 | 说明 |
|------|------|
| 🌍 **3D 地球** | Three.js 渲染，程序化高清纹理（4096px），大陆/山脉/沙漠/冰盖 |
| 📍 **23 个历史地标** | 覆盖六大洲：东非大裂谷、美索不达米亚、尼罗河、黄河流域、雅典、罗马、中美洲、吴哥、西非、大洋洲... |
| ⏳ **10 个时代** | 史前→古文明→古典→中世纪→大航海→启蒙→帝国主义→世界大战→冷战→数字时代 |
| 🖱️ **交互** | 拖拽旋转地球、滚轮缩放、悬停预览、点击查看详细历史 |
| 👤 **80+ 历史人物** | 每人含画像、头衔、详细介绍（孔子、拿破仑、莎士比亚、成吉思汗...） |
| 🖼️ **历史图片** | 109 张 Wikipedia 真实历史照片，支持灯箱放大浏览 |
| 🌐 **中英双语** | 点击右上角 EN/中 切换界面语言，所有 UI、时代、地名、历史、人物均已翻译 |
| 📱 **移动端适配** | 自动检测设备降级球体分辨率，响应式布局 |
| 🎨 **毛玻璃 UI** | Apple 风格 Glass UI，入场动画，地球脉冲效果 |

### 时间线 / Timeline (`human-history.html`)

| 功能 | 说明 |
|------|------|
| 📜 **线性时间线** | 150+ 历史事件卡片，左右交替布局 |
| 🎨 **金色主题** | 暗色背景 + 金色点缀，丝滑滚动动画 |
| 📱 **响应式** | 移动端自动切换为单列布局 |
| ⭐ **回到顶部** | 浮动按钮，阅读进度条 |

---

## 🔧 技术栈 / Tech Stack

| 技术 | 用途 |
|------|------|
| **Three.js** (r128) | 3D 地球渲染，5 层 CDN 容灾回退 |
| **Canvas API** | 4096px 程序化地球纹理（大陆/海洋/山脉/沙漠/冰盖） |
| **Vanilla JavaScript** | 无框架，纯原生实现 |
| **Wikipedia REST API** | 自动下载真实历史图片（93/109 成功，剩余 SVG 占位） |
| **CSS Glass UI** | backdrop-filter 毛玻璃效果，cubic-bezier 缓动动画 |
| **Intersection Observer** | 高性能滚动检测和元素可见性 |

---

## 📊 数据覆盖 / Data Coverage

### 历史地标 / Historical Landmarks (23个)

| 地区 | 地标 |
|------|------|
| 🌍 非洲 | 东非大裂谷、尼罗河流域、西非（马里/廷巴克图） |
| 🏛️ 中东 | 美索不达米亚、麦加 |
| 🏯 东亚 | 黄河流域、日本、朝鲜 |
| 🌏 南亚/东南亚 | 印度河流域、吴哥（高棉） |
| 🏰 欧洲 | 雅典、罗马、君士坦丁堡、巴黎、伦敦、莫斯科、伊比利亚 |
| 🗽 美洲 | 中美洲、北美东海岸、安第斯、硅谷 |
| 🌊 大洋洲 | 大洋洲（澳大利亚/新西兰/太平洋） |

### 历史人物 / Historical Figures (80+人)

孔子、秦始皇、凯撒、拿破仑、莎士比亚、牛顿、成吉思汗、哥伦布、曼萨·穆萨、世宗大王、华盛顿、爱因斯坦、乔布斯......

---

## 🚀 本地运行 / Local Setup

```bash
# 1. 克隆仓库
git clone https://github.com/YOUR_USERNAME/human-history.git
cd human-history

# 2. 启动本地服务器
npx http-server -p 8080

# 3. 浏览器打开
# http://localhost:8080/earth-history.html
```

---

## 📝 数据来源 / Data Sources

- 📚 Wikipedia & Wikimedia Commons — 图片与历史参考
- 📖 *Sapiens* (Yuval Noah Harari) · *Guns, Germs, and Steel* (Jared Diamond) · *The Silk Roads* (Peter Frankopan)
- 🏛️ 中国通史 · UNESCO 世界遗产名录
- 🤖 AI 辅助编纂与翻译

---

## ⚠️ 声明 / Disclaimer

本项目内容仅供学习参考。历史年代和部分细节可能存在学术争议。图片版权归属原始权利人（Wikipedia / Wikimedia Commons），遵循相应开放许可协议。

---

## 📄 许可 / License

MIT License — 欢迎 Fork、修改和分享

---

*"以铜为镜，可以正衣冠；以史为镜，可以知兴替。" — 唐太宗*
*"History is a guide to navigation in perilous times." — David McCullough*
