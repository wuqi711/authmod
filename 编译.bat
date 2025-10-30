@echo off
chcp 65001 >nul
title AuthMod 编译
color 0E

echo.
echo ========================================
echo           AuthMod 编译工具
echo ========================================
echo.

if exist .gradle (
  echo 清理缓存中...
  rmdir /s /q .gradle 2>nul
)
if exist build (
  rmdir /s /q build 2>nul
)

echo 开始编译...
echo.
call gradlew.bat clean build --no-daemon --refresh-dependencies

echo.
if %errorlevel% equ 0 (
  echo ========================================
  echo            ✓ 编译成功！
  echo ========================================
  echo 产物: build\libs\authmod-1.0.0.jar
  start explorer build\libs
) else (
  echo ========================================
  echo            ✗ 编译失败
  echo ========================================
  echo 请复制上方错误信息发我
)

echo.
pause


