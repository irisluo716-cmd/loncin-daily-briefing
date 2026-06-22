# 每日行业简报 · 网络版（GitHub Pages）

## 仓库说明

每日通机行业简报的网络版部署。每张图 + 链接清单整合为一个滚动页面（`index.html`），可直接在 GitHub Pages 上发布。

## 文件结构

```
.
├── index.html       # 单页 HTML（含全部卡片 + 链接清单 + Top 5 + 行业观察）
├── logo.png         # LONCIN 红蓝底 logo（base64 内嵌在 index.html 中）
├── README.md        # 本文件
└── deploy.sh        # 一键部署脚本（未来 cron 调用）
```

## 本期（2026-06-22）内容

- **总览**：Top 5 + 今日行业观察
- **A 政策法规**（4 条）：EPA Phase 4、欧盟 Stage V 噪音、CPSC 草坪安全标准、Section 232 关税专题
- **B 大公司动态**（2 条）：2026 大西洋飓风季开启 + Generac 渠道动态、Honda 中国通机 2,500 万台
- **C 用户评价**（2 条）：Reddit r/Generators 启动失败吐槽、WEN DF500iX 重量/CO 监测差评
- **D 大宗商品**（1 条）：LME 铜价
- **E 海运货运**（1 条）：SCFI 美西航线上涨

## 部署方式（手动）

### 首次设置

1. 在 GitHub 创建新仓库：`loncin-daily-briefing`（Public，开启 GitHub Pages）
2. 把本目录所有文件 push 到 main 分支
3. GitHub Pages 会自动从 main 分根目录发布

### 每次更新

```bash
# 1. 生成新一期内容（在本机运行）
cd "/Users/luoyalan/Desktop/Claude Cowork/每日行业简报"
python3 生成简报.py
# 然后重新生成 index.html（脚本中带）
python3 -c "from pathlib import Path; import shutil; ..."

# 2. 推送到 GitHub
cd 网络版
git add -A
git commit -m "更新简报 2026-06-22"
git push origin main

# 或者用 deploy.sh（如果已经配好 remote）
./deploy.sh
```

### 自动部署（未来 cron）

```bash
# 每天 8:30 自动生成 + push
30 8 * * * cd /path/to/每日行业简报 && python3 生成简报.py && cd 网络版 && git add -A && git commit -m "auto: $(date +%Y-%m-%d)" && git push
```

## 访问地址

部署后访问：`https://<your-github-username>.github.io/loncin-daily-briefing/`

## 数据边界

本简报所有数据来源于公开渠道（NOAA、EPA、欧盟委员会、CPSC、Federal Register、LME、SCFI、Reddit、Amazon、本田动力官方公告等），**不包含任何内部客户/对手/产品数据**。

如有数据隐私疑问，请联系：产品策划部
