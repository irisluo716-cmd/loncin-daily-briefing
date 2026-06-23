# Cloudflare Workers 部署说明

## 实际部署情况（2026-06-23）

- **项目名**: `loncin-db`（Cloudflare Dashboard 项目名）
- **类型**: Cloudflare Workers (Static Assets)
- **生产域名**: `https://loncin-db.iris-luo716.workers.dev/`
- **来源仓库**: `irisluo716-cmd/loncin-daily-briefing` (GitHub, Public)
- **部署方式**: 手动 `wrangler pages deploy . --project-name=loncin-db`
- **状态**: ✅ 200 OK，1-3s 响应（CDN 加速到位）

## URL 列表

| 类型 | URL |
|---|---|
| 累积索引 | `https://loncin-db.iris-luo716.workers.dev/` |
| 当日详情 (例) | `https://loncin-db.iris-luo716.workers.dev/2026-06-23.html` |
| GitHub Pages fallback | `https://irisluo716-cmd.github.io/loncin-daily-briefing/` |

## 如何重新部署

```bash
cd ~/Desktop/Claude\ Cowork/每日行业简报/网络版
npx wrangler pages deploy . --project-name=loncin-db
```

第一次会弹窗授权 Cloudflare 账号。授权后 30 秒内完成部署。

## 自动部署（推荐）

Cloudflare Dashboard → **Workers & Pages** → `loncin-db` → **Settings** → **Builds** → 启用 **"Connected Builds"** → 选 GitHub repo + branch = `main`。

之后 `git push origin main` 触发自动部署，30 秒内生效。

## 配置文件

- `网络版/_headers` — 静态资源缓存策略 (HTML 5min, PNG 24h, logo 30d)
- `网络版/CLOUDFLARE.md` — 本文档

## 国内访问

通过 Cloudflare 全球 CDN 加速，香港/新加坡/日本节点绕路，国内秒开（1-3s 响应）。

## 与 GitHub Pages 对比

| | GitHub Pages | Cloudflare Workers |
|---|---|---|
| 国内访问 | 经常超时 | 秒开 |
| HTTPS | ✅ | ✅ |
| 自定义域名 | ✅ | ✅ |
| 部署时间 | 1-2 分钟 | 30 秒 |
| 免费额度 | 100GB/月 | 100k req/day |
| 触发方式 | push 即部署 | push 或 wrangler 手动 |

## Gitee 状态

Gitee Pages 服务对 `loncin-planning-department` 组织账号不可用（之前已试过）。仓库同步正常但无 Pages 部署。
