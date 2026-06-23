# Cloudflare Pages 一键部署指南

## 📋 前置条件
- 一个 Cloudflare 账号（免费注册 https://dash.cloudflare.com/sign-up）
- 本仓库 `irisluo716-cmd/loncin-daily-briefing` 已通过 git push 同步

## 🚀 部署步骤（5 分钟）

### 1. 登录 Cloudflare Dashboard
打开 https://dash.cloudflare.com/

### 2. 进入 Pages 服务
左侧菜单 → **Workers 和 Pages** → **Pages** → **"连接到 Git"**

### 3. 选择 GitHub 仓库
- 选 **GitHub**
- 授权 Cloudflare 访问你的 GitHub（首次需要）
- 选 **irisluo716-cmd/loncin-daily-briefing** 仓库
- 点 **"开始设置"**

### 4. 配置 Build 设置
| 字段 | 值 |
|---|---|
| **项目名称** | `loncin-daily-briefing`（或自定义，会得到 `<name>.pages.dev`） |
| **生产分支** | `main` |
| **Framework preset** | `None`（纯静态） |
| **Build command** | *(留空)* |
| **Build output directory** | `/` （或 `.`） |
| **Root directory** | *(留空)* |
| **环境变量** | *(无)* |

> ⚠️ 关键：Build output directory 必须是 `/`（根），因为我们直接发布 `网络版/index.html` 等文件，没有 `dist/` 子目录。

### 5. 点 **"保存并部署"**
- Cloudflare 会自动 build（几秒，因为是纯静态）
- 部署成功后会得到一个 URL： `https://loncin-daily-briefing.pages.dev`

### 6. 验证部署
访问 `https://loncin-daily-briefing.pages.dev/` 看是不是显示了「通机行业每日简报 · 累积存档」索引页。

## 🎁 部署后能拿到什么

- **CDN 加速**：Cloudflare 全球 300+ 节点，国内访问通过香港/新加坡/日本节点绕路
- **自动 HTTPS**：Let's Encrypt 证书自动签发 + 续期
- **自动部署**：每次 `git push origin main` 触发 30 秒内重新部署
- **预览环境**：每个 PR 自动得到一个 `https://<branch>.loncin-daily-briefing.pages.dev` 预览链接

## 🔧 高级（可选）

### 自定义域名
1. Cloudflare Pages → 你的项目 → **"自定义域"** → 添加你的域名（如 `briefing.loncin.com`）
2. 按提示到你的 DNS 服务商加 CNAME 记录

### 强制 HTTPS / 最小化
1. 项目 → **Settings** → **SSL/TLS** → 选择 **Full (Strict)**
2. 项目 → **Settings** → **Speed** → 开启 **Auto Minify** (HTML/CSS/JS)

## 🆚 对比 GitHub Pages
| | GitHub Pages | Cloudflare Pages |
|---|---|---|
| 国内访问 | 经常超时 | 秒开（CDN 加速） |
| HTTPS | ✅ | ✅ |
| 自定义域名 | ✅ | ✅ |
| Build 时间 | 1-2 分钟 | 30 秒 |
| 免费额度 | 100GB/月 | 无限（无明确限制） |
| Functions | ❌ | ✅ Pages Functions |

## 🐛 常见问题

**Q: 部署后访问 404？**
A: 检查 Build output directory 是不是 `/`。如果是 `/网络版/` 会找不到文件。

**Q: 链接列表点不动？**
A: 我们的 `link-item` 用了 `<a href target="_blank">`，确保 Cloudflare 没把 `target="_blank"` 过滤掉（不会，但检查一下 `Cache-Control`）。

**Q: 想换源仓库？**
A: 项目 → **Settings** → **Connect to Git** → Disconnect → 重新选仓库。
