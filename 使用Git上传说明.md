# 🚀 使用Git上传到GitHub（一键脚本）

我已经为您创建了自动化脚本！超级简单！

---

## 📋 准备工作（2分钟）

### 第1步：在GitHub上创建仓库

1. **打开浏览器**，访问：https://github.com/new

2. **填写信息**：
   - Repository name（仓库名）：`authmod`
   - Description（描述）：`Minecraft 1.20.1 登录验证Mod`
   - 选择 **Public**（公开）
   - **不要勾选** 任何选项（不要添加README等）

3. 点击绿色按钮 **"Create repository"**

4. **复制仓库URL**：
   - 创建后页面会显示一个URL
   - 类似：`https://github.com/你的用户名/authmod.git`
   - **复制这个URL**（后面要用）

---

## ⚙️ 第2步：修改脚本配置

打开 `上传到GitHub.bat` 文件（右键→编辑），修改这两行：

**第12行**：把 `YourGitHubUsername` 改成您的GitHub用户名
```bat
git config --global user.name "你的GitHub用户名"
```

**第13行**：把邮箱改成您注册GitHub用的邮箱
```bat
git config --global user.email "你的邮箱@example.com"
```

例如：
```bat
git config --global user.name "zhangsan123"
git config --global user.email "zhangsan@gmail.com"
```

保存并关闭。

---

## 🎯 第3步：运行脚本上传（1分钟）

1. **双击** `上传到GitHub.bat` 文件

2. 脚本会自动执行前5步

3. 当看到提示：`请粘贴您的GitHub仓库URL:`
   - **粘贴**您在第1步复制的URL
   - 按 **回车键**

4. **输入GitHub密码**：
   - 如果弹出登录窗口，输入您的GitHub用户名和密码
   - 如果要求使用Personal Access Token，看下面的说明

5. 等待上传完成（可能需要1-2分钟）

6. 看到 "上传完成！" ✅

7. 完成！

---

## 🔑 如果要求Personal Access Token

GitHub现在推荐使用Token而不是密码：

### 创建Token：

1. 访问：https://github.com/settings/tokens

2. 点击 **"Generate new token"** → **"Generate new token (classic)"**

3. 填写：
   - Note（备注）：`AuthMod上传`
   - Expiration（过期时间）：选择 `30 days` 或 `90 days`
   - 勾选 **repo**（所有repo选项）

4. 滚动到底部，点击 **"Generate token"**

5. **复制显示的token**（类似：`ghp_xxxxxxxxxxxx`）
   - ⚠️ 这个token只显示一次，要保存好！

6. 回到脚本，当要求输入密码时：
   - **粘贴token**（不是密码）
   - 按回车

---

## ✅ 第4步：查看编译进度

上传成功后：

1. 打开您的GitHub仓库页面

2. 点击 **"Actions"** 标签

3. 看到黄色圆圈在转 🟡（正在编译）

4. 等待5-10分钟，变成绿色勾 ✅

5. 点击构建任务 → 滚动到底部 → 下载 **"authmod-jar"**

6. 解压得到 `authmod-1.0.0.jar`

7. ✅ 大功告成！

---

## 📋 完整流程总结

```
在GitHub创建仓库（1分钟）
    ↓
修改脚本中的用户名和邮箱（30秒）
    ↓
双击运行脚本（1分钟）
    ↓
等待自动编译（5-10分钟）
    ↓
下载jar文件（30秒）
    ↓
完成！🎉
```

---

## 🆘 常见问题

### Q1: 脚本运行后报错 "git不是内部或外部命令"

**原因**：Git没有正确安装或没有添加到环境变量

**解决**：
1. 重新下载Git：https://git-scm.com/download/win
2. 安装时确保勾选 "Add to PATH"
3. 安装完重启电脑

### Q2: 提示 "Permission denied"

**原因**：没有权限或密码错误

**解决**：
1. 确认GitHub用户名和密码正确
2. 或者使用Personal Access Token（见上面说明）

### Q3: 提示 "repository not found"

**原因**：仓库URL错误

**解决**：
1. 确认复制的URL正确
2. 确保仓库已经在GitHub上创建好了

### Q4: 上传很慢或卡住

**原因**：网络问题

**解决**：
1. 检查网络连接
2. 如果在国内，可能需要配置代理
3. 或者使用GitHub Desktop（图形界面更稳定）

---

## 💡 小贴士

1. **第一次上传最慢**：因为要上传所有文件，可能需要2-3分钟

2. **保存Token**：如果使用了Personal Access Token，保存好，下次还能用

3. **检查.github文件夹**：确保 `.github` 文件夹也被上传了，这样才能自动编译

4. **网络要稳定**：上传期间不要关闭命令窗口

---

## 📊 脚本做了什么？

脚本会自动执行这些操作：
1. ✅ 配置Git用户信息
2. ✅ 初始化Git仓库
3. ✅ 添加所有文件到Git
4. ✅ 提交更改
5. ✅ 设置main分支
6. ✅ 连接到GitHub远程仓库
7. ✅ 推送所有文件到GitHub

**您只需要双击运行，然后粘贴仓库URL！**

---

## 🎉 成功标志

上传成功时，命令窗口会显示：
```
[6/6] 上传到GitHub...
Enumerating objects: XX, done.
Counting objects: 100% (XX/XX), done.
Writing objects: 100% (XX/XX), done.
Total XX (delta X), reused X (delta X)
To https://github.com/你的用户名/authmod.git
 * [new branch]      main -> main

==========================================
   上传完成！
==========================================
```

看到这个就说明成功了！🎊

---

**遇到问题随时告诉我，我会帮您解决！** 😊

