@echo off
chcp 65001 >nul
echo ==========================================
echo    AuthMod 自动上传到 GitHub 脚本
echo ==========================================
echo.

REM 配置Git用户信息（首次使用需要）
echo [1/6] 配置Git用户信息...
git config --global user.name "YourGitHubUsername"
git config --global user.email "your.email@example.com"
echo ✓ Git配置完成
echo.

REM 初始化Git仓库
echo [2/6] 初始化Git仓库...
git init
echo ✓ 仓库初始化完成
echo.

REM 添加所有文件
echo [3/6] 添加文件...
git add .
echo ✓ 文件添加完成
echo.

REM 提交更改
echo [4/6] 提交更改...
git commit -m "Initial commit: AuthMod project"
echo ✓ 提交完成
echo.

REM 设置主分支名称
echo [5/6] 设置分支...
git branch -M main
echo ✓ 分支设置完成
echo.

REM 添加远程仓库并推送
echo [6/6] 上传到GitHub...
echo.
echo ⚠ 请在GitHub上创建好仓库后，复制仓库URL
echo 例如: https://github.com/你的用户名/authmod.git
echo.
set /p REPO_URL="请粘贴您的GitHub仓库URL: "
echo.

git remote add origin %REPO_URL%
git push -u origin main

echo.
echo ==========================================
echo    上传完成！
echo ==========================================
echo.
echo 现在访问您的GitHub仓库，等待自动编译完成
echo Actions标签会显示编译进度
echo.
pause

