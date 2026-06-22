#!/usr/bin/env bash
# deploy.sh - 一键推送每日简报到 GitHub Pages
# 用法：在网络版目录下执行 ./deploy.sh
set -e

# 检查 git remote
REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE" ]; then
  echo "❌ 错误：未配置 git remote，请先执行："
  echo "   git remote add origin https://github.com/<your-username>/loncin-daily-briefing.git"
  exit 1
fi

git add -A
git commit -m "auto: 简报更新 $(date +%Y-%m-%d)"
git push origin main

echo "✅ 部署完成"
echo "🌐 访问地址：$(git remote get-url origin | sed 's|github.com/|github.io/|' | sed 's|.git$||')"
