# 🌍 人类历史长卷 · Chronicle of Humanity

> 在 3D 地球上探索人类 700 万年文明史。拖拽旋转、点击标记，从东非大裂谷到硅谷。  
> Explore 7 million years of human civilization on a 3D globe. Drag to rotate, click markers, from the Great Rift Valley to Silicon Valley.

---

## 📸 项目预览 / Preview

| 功能 / Feature | 说明 / Description |
|:---|:---|
| 🌍 **3D 地球 / 3D Globe** | Three.js 渲染，程序化 4096px 高清纹理 / Procedural HD texture |
| 📍 **23 个历史地标 / 23 Landmarks** | 覆盖六大洲 / Covering 6 continents |
| ⏳ **10 个时代 / 10 Eras** | 史前→古文明→古典→中世纪→大航海→启蒙→帝国主义→世界大战→冷战→数字时代 / Prehistory through Digital Age |
| 👤 **80+ 历史人物 / 80+ Figures** | 每人含画像、头衔、详细介绍 / Portrait, title & biography for each |
| 🖼️ **109 张史料图片 / 109 Historical Images** | 来自 Wikipedia 的真实照片 / Real photos from Wikipedia |
| 🌐 **中英双语 / Bilingual CN/EN** | 一键切换，自动检测浏览器语言 / One-click toggle, auto-detects browser language |
| 📱 **移动端适配 / Mobile Ready** | 响应式布局，自动降级球体分辨率 / Responsive, auto quality reduction |

---

## 🌐 在线体验 / Live Demo

打开 `earth-history.html` 即可体验 3D 地球浏览器。

Open `earth-history.html` to explore the 3D globe. Requires a local server (Three.js loads from CDN):

```bash
# 推荐 / Recommended
npx http-server -p 8080

# 或使用 Python / Or with Python
python -m http.server 8080

# 浏览器打开 / Open in browser
# http://localhost:8080/earth-history.html
```

---

## 📂 项目结构 / Project Structure

```
human-history-chronicle/
├── earth-history.html      # 3D 交互式地球浏览器 / 3D Globe Browser (3800+ lines)
├── images/
│   ├── people/             # 54 张历史人物画像 / 54 historical figure portraits
│   └── real/               # 109 张历史场景照片 / 109 historical scene photos
├── README.md               # 项目介绍（中英双语） / Project overview (bilingual)
└── .gitignore
```

---

## ✨ 功能特性 / Features

### 🌍 3D 地球浏览器 / 3D Globe Browser

| 功能 Feature | 说明 Description |
|:---|:---|
| 🌍 **3D 地球 / 3D Globe** | Three.js 渲染，程序化高清纹理 4096px，包含大陆/山脉/沙漠/冰盖 / Procedural texture with continents, mountains, deserts, ice caps |
| 📍 **23 个历史地标 / 23 Landmarks** | 东非大裂谷 · 美索不达米亚 · 尼罗河 · 黄河流域 · 雅典 · 罗马 · 中美洲 · 吴哥 · 西非 · 朝鲜 · 大洋洲 等 / East African Rift, Mesopotamia, Nile, Yellow River, Athens, Rome, Mesoamerica, Angkor, West Africa, Korea, Oceania & more |
| ⏳ **10 个时代 / 10 Eras** | 史前→古文明→古典→中世纪→大航海→启蒙→帝国主义→世界大战→冷战→数字时代 / Prehistory → Ancient → Classical → Medieval → Discovery → Enlightenment → Imperialism → World Wars → Cold War → Digital Age |
| 🖱️ **交互操作 / Interaction** | 拖拽旋转地球 · 滚轮缩放 · 悬停预览 · 点击查看详细历史 / Drag to rotate · Scroll to zoom · Hover to preview · Click for details |
| 👤 **80+ 历史人物 / 80+ Figures** | 孔子 · 凯撒 · 拿破仑 · 莎士比亚 · 牛顿 · 成吉思汗 · 曼萨·穆萨 · 世宗大王 · 华盛顿 · 爱因斯坦 · 乔布斯 / Confucius, Caesar, Napoleon, Shakespeare, Newton, Genghis Khan, Mansa Musa, Sejong, Washington, Einstein, Jobs & more |
| 🖼️ **灯箱浏览 / Lightbox** | 点击图片全屏放大，键盘 ← → 翻页，支持缩放 / Click to enlarge, arrow keys to navigate, zoom support |
| 🌐 **中英双语 / Bilingual** | 界面、时代、地名、历史、人物全部中英双语，自动检测浏览器语言，localStorage 记忆偏好 / Full CN/EN for UI, eras, locations, history, and figures. Auto-detects browser language with localStorage persistence |
| 🎨 **毛玻璃 UI / Glass UI** | Apple 风格毛玻璃面板，backdrop-filter 模糊，入场动画，地球脉冲效果 / Frosted glass panels with backdrop-filter blur, entrance animations, earth pulse effects |
| 📱 **移动端 / Mobile** | 自动检测设备降级渲染（球体 64 段 / 星星 1000），响应式布局 / Auto quality reduction for mobile (64 segments / 1000 stars) |

---

## 🔧 技术栈 / Tech Stack

| 技术 / Technology | 用途 / Purpose |
|:---|:---|
| **Three.js** (r128) | 3D 地球渲染 / 3D globe rendering，5 层 CDN 容灾 / 5-tier CDN fallback |
| **Canvas API** | 4096px 程序化地球纹理（大陆/海洋/山脉/沙漠/冰盖/像素噪声）/ Procedural texture generation |
| **Vanilla JS** | 零框架，纯原生 JavaScript / Zero frameworks, pure vanilla JS |
| **Wikipedia REST API** | 自动下载真实历史图片（93/109 成功）/ Auto-download historical photos |
| **CSS Glass UI** | backdrop-filter 毛玻璃 + cubic-bezier 缓动动画 / Frosted glass with custom easing |
| **Intersection Observer** | 高性能可见性检测 / High-performance visibility detection |

---

## 📊 数据覆盖 / Data Coverage

### 历史地标 / Historical Landmarks (23)

| 地区 / Region | 地标 / Landmarks |
|:---|:---|
| 🌍 非洲 / Africa | 东非大裂谷 / East African Rift · 尼罗河流域 / Nile Valley · 西非 / West Africa |
| 🏛️ 中东 / Middle East | 美索不达米亚 / Mesopotamia · 麦加 / Mecca |
| 🏯 东亚 / East Asia | 黄河流域 / Yellow River · 日本 / Japan · 朝鲜 / Korea |
| 🌏 南亚东南亚 / S & SE Asia | 印度河流域 / Indus Valley · 吴哥 / Angkor |
| 🏰 欧洲 / Europe | 雅典 / Athens · 罗马 / Rome · 君士坦丁堡 / Constantinople · 巴黎 / Paris · 伦敦 / London · 莫斯科 / Moscow · 伊比利亚 / Iberia |
| 🗽 美洲 / Americas | 中美洲 / Mesoamerica · 北美东海岸 / US East Coast · 安第斯 / Andes · 硅谷 / Silicon Valley |
| 🌊 大洋洲 / Oceania | 大洋洲 / Oceania |

### 历史时代 / Historical Eras (10)

| 中文 | English | 时期 / Period |
|:---|:---|:---|
| 史前时代 | Prehistoric Era | ~7M BCE — 3000 BCE |
| 古代文明 | Ancient Civilizations | 3500 — 500 BCE |
| 古典帝国 | Classical Empires | 500 BCE — 500 CE |
| 中世纪 | Medieval Era | 500 — 1500 CE |
| 大航海时代 | Age of Discovery | 1450 — 1700 |
| 启蒙与革命 | Enlightenment & Revolution | 1700 — 1850 |
| 帝国主义 | Imperialism | 1850 — 1914 |
| 世界大战 | World Wars | 1914 — 1945 |
| 冷战格局 | Cold War | 1945 — 1991 |
| 数字时代 | Digital Age | 1991 — Present |

### 历史人物 / Historical Figures (80+)

孔子 / Confucius · 秦始皇 / Qin Shi Huang · 凯撒 / Caesar · 拿破仑 / Napoleon · 莎士比亚 / Shakespeare · 牛顿 / Newton · 成吉思汗 / Genghis Khan · 哥伦布 / Columbus · 曼萨·穆萨 / Mansa Musa · 世宗大王 / Sejong the Great · 华盛顿 / Washington · 爱因斯坦 / Einstein · 乔布斯 / Jobs ......

---

## 🚀 本地运行 / Local Setup

```bash
# 1. 克隆仓库 / Clone the repo
git clone https://github.com/2B0748/human-history-chronicle.git
cd human-history-chronicle

# 2. 启动本地服务器 / Start local server
npx http-server -p 8080

# 3. 浏览器打开 / Open in browser
# http://localhost:8080/earth-history.html
```

> ⚠️ 必须通过 HTTP 服务器打开（不能直接双击 HTML 文件），因为 Three.js 需要从 CDN 加载。  
> ⚠️ Must open via HTTP server (not by double-clicking the HTML file), as Three.js loads from CDN.

---

## 📝 数据来源 / Data Sources

- 📚 **Wikipedia & Wikimedia Commons** — 历史图片与参考 / Historical images & references
- 📖 **《人类简史》Sapiens** (Yuval Noah Harari) · **《枪炮、病菌与钢铁》Guns, Germs, and Steel** (Jared Diamond) · **《丝绸之路》The Silk Roads** (Peter Frankopan)
- 🏛️ **中国通史** · **UNESCO 世界遗产名录 / World Heritage List**
- 🤖 AI 辅助编纂与翻译 / AI-assisted compilation & translation

---

## ⚠️ 声明 / Disclaimer

本项目内容仅供学习参考。历史年代和部分细节可能存在学术争议。图片版权归属原始权利人（Wikipedia / Wikimedia Commons），遵循相应开放许可协议。

This project is for educational reference only. Historical dates and details may be subject to academic debate. Image copyrights belong to their original rights holders (Wikipedia / Wikimedia Commons) under applicable open licenses.

---

## 📄 许可 / License

**MIT License** — 欢迎 Fork、修改和分享 / Feel free to fork, modify, and share.

---

> *"以铜为镜，可以正衣冠；以史为镜，可以知兴替。" — 唐太宗 / Emperor Taizong of Tang*  
> *"History is a guide to navigation in perilous times." — David McCullough*
