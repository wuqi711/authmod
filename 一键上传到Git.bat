@echo off
chcp 65001 >nul
title 一键上传到 Git
color 0A

echo.
echo ========================================
echo            一键上传到 Git
echo ========================================
echo.
echo 请输入你的远程仓库地址（HTTPS）：
echo 例如: https://github.com/yourname/yourrepo.git
set /p REMOTE_URL=Remote URL: 

if "%REMOTE_URL%"=="" (
  echo 远程地址不能为空！
  pause
  exit /b 1
)

echo.
echo 初始化 Git...
git init 1>nul 2>nul

echo 设置默认分支为 main...
git branch -M main 1>nul 2>nul

echo 添加文件...
git add .

echo 提交...
git commit -m "chore: initial publish" || echo 已存在提交，跳过

echo 配置远程...
git remote remove origin 1>nul 2>nul
git remote add origin "%REMOTE_URL%"

echo 推送到远程 main 分支...
git push -u origin main

if %errorlevel% neq 0 (
  echo.
  echo 推送失败：
  echo 1) 若提示需要密码，请使用 GitHub Personal Access Token 作为密码
  echo 2) 若提示历史不相关：先执行
  echo    git pull origin main --allow-unrelated-histories
  echo    然后再运行本脚本
)

echo.
pause


