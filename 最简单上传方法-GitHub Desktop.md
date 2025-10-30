# 🎯 最简单的上传方法 - 使用GitHub Desktop

**这个方法可以上传文件夹，而且超级简单，不需要命令行！**

---

## 📥 第1步：下载GitHub Desktop（2分钟）

1. **打开这个网址**：https://desktop.github.com/

2. 点击 **"Download for Windows"**（大大的紫色按钮）

3. 等待下载完成（大约80MB）

4. **双击安装**：
   - 下载完后，双击 `GitHubDesktopSetup.exe`
   - 会自动安装，不需要选择任何东西
   - 等待30秒，安装完成

5. ✅ 完成！

---

## 🔐 第2步：登录GitHub账号（1分钟）

安装完成后会自动打开GitHub Desktop：

1. 点击 **"Sign in to GitHub.com"**（登录GitHub）

2. 浏览器会打开，点击 **"Authorize desktop"**（授权）

3. 回到GitHub Desktop，会显示你的用户名

4. ✅ 登录成功！

---

## 📦 第3步：创建仓库并上传（3分钟）

### 3.1 在GitHub Desktop中创建仓库

1. 点击左上角 **"File"** → **"New repository"**（新建仓库）

2. 填写信息：
   - **Name**（名称）：填 `authmod`
   - **Local path**（本地路径）：选择一个临时文件夹（比如桌面）
   - **不要勾选** "Initialize this repository with a README"

3. 点击 **"Create repository"**（创建仓库）

4. ✅ 仓库创建完成！

### 3.2 复制项目文件

1. GitHub Desktop会显示仓库的路径（比如：`C:\Users\你的用户名\Desktop\authmod`）

2. **打开这个文件夹**（点击 "Show in Explorer" 或 "在文件资源管理器中显示"）

3. **打开你的项目文件夹**：`D:\网页\看视频网站`

4. **选中所有需要的文件和文件夹**：
   - `src` 文件夹
   - `gradle` 文件夹
   - `.github` 文件夹
   - `build.gradle`
   - `gradle.properties`
   - `settings.gradle`
   - `gradlew`
   - `gradlew.bat`
   - 所有 `.md` 文件

5. **复制**（Ctrl+C）

6. **粘贴到刚才打开的authmod文件夹**（Ctrl+V）

7. ✅ 文件复制完成！

### 3.3 上传到GitHub

1. 回到 **GitHub Desktop**

2. 你会看到左边列出了很多文件（这些就是你复制的文件）

3. 在左下角看到两个输入框：
   - 第一个框（Summary）填：`初始上传`
   - 第二个框可以不填

4. 点击蓝色按钮 **"Commit to main"**

5. 点击右边的 **"Publish repository"**（发布仓库）

6. 在弹出的窗口：
   - **取消勾选** "Keep this code private"（保持代码私有）- 要选公开
   - 点击 **"Publish repository"**

7. 等待上传完成（1-2分钟）

8. ✅ 上传完成！

---

## ✅ 第4步：等待自动编译（5-10分钟）

1. 上传完成后，点击 **"View on GitHub"**（在GitHub上查看）

2. 浏览器会打开你的仓库页面

3. 点击顶部的 **"Actions"** 标签

4. 看到黄色圆圈在转 🟡（正在编译）

5. 等待5-10分钟，变成绿色勾 ✅

6. ✅ 编译完成！

---

## 📥 第5步：下载编译好的文件（1分钟）

1. 点击绿色勾的构建任务

2. 滚动到页面最底部

3. 在 **"Artifacts"** 区域，点击 **"authmod-jar"**

4. 下载并解压zip文件

5. 得到 `authmod-1.0.0.jar`

6. ✅ 大功告成！🎉

---

## 📋 完整流程（只需要15分钟）

```
下载GitHub Desktop（2分钟）
    ↓
安装并登录（1分钟）
    ↓
创建仓库（30秒）
    ↓
复制文件到仓库文件夹（1分钟）
    ↓
在GitHub Desktop中提交并发布（2分钟）
    ↓
等待自动编译（5-10分钟）
    ↓
下载jar文件（30秒）
    ↓
完成！🎉
```

---

## 🎯 为什么用GitHub Desktop？

✅ **可以上传文件夹**（网页版不行）
✅ **图形界面**，不需要命令行
✅ **自动处理**所有Git操作
✅ **简单易用**，点几下鼠标就行
✅ **一次上传**所有文件

---

## 💡 小贴士

1. **显示隐藏文件**：
   - 在文件夹中，点击"查看" → 勾选"隐藏的项目"
   - 这样才能看到 `.github` 文件夹

2. **全选文件**：
   - 在文件夹中按 `Ctrl+A` 全选
   - 然后 `Ctrl+C` 复制

3. **检查上传**：
   - 在GitHub Desktop左边应该能看到很多文件
   - 如果只看到几个文件，说明复制不完整

4. **网络要好**：
   - 上传需要良好的网络连接
   - 如果失败了，点击 "Retry" 重试

---

## 🆘 需要更详细的帮助？

告诉我你在哪一步卡住了：
- [ ] 下载GitHub Desktop
- [ ] 安装GitHub Desktop
- [ ] 登录账号
- [ ] 创建仓库
- [ ] 复制文件
- [ ] 上传到GitHub
- [ ] 等待编译
- [ ] 下载文件

**我会给你更详细的指导！** 😊

---

## 📸 关键画面说明

### GitHub Desktop登录后应该长这样：
- 左上角显示你的头像和用户名
- 中间有 "Let's get started" 或者仓库列表
- 顶部有 "File" 菜单

### 创建仓库窗口应该长这样：
- 标题是 "Create a New Repository"
- 有 Name 和 Local path 两个输入框
- 底部有蓝色的 "Create Repository" 按钮

### 提交界面应该长这样：
- 左边列出了所有要上传的文件
- 左下角有 "Summary" 输入框
- 底部有蓝色的 "Commit to main" 按钮

---

**这个方法是最简单的，推荐使用！** 🌟

