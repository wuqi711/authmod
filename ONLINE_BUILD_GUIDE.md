# 在线编译指南

本项目支持多种在线编译平台，无需本地安装Java和Gradle。

## 方案1：GitHub Actions（推荐）⭐

**最简单、最快速的方式**

### 步骤：

1. **将项目上传到GitHub**
   - 访问 https://github.com/new
   - 创建新仓库（例如：authmod）
   - 在本地项目目录运行：
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/你的用户名/authmod.git
   git push -u origin main
   ```

2. **自动构建**
   - 推送后，GitHub Actions会自动开始构建
   - 访问仓库页面 → Actions标签查看构建进度
   - 构建时间约5-10分钟

3. **下载编译好的文件**
   - 构建完成后，在Actions页面点击最新的构建
   - 滚动到底部，找到 "Artifacts"
   - 下载 `authmod-jar` 文件
   - 解压即可获得 `authmod-1.0.0.jar`

### 优点：
- ✅ 完全免费
- ✅ 自动化构建
- ✅ 每次推送代码都会自动编译
- ✅ 构建日志详细
- ✅ 不需要本地环境

---

## 方案2：Gitpod（云端IDE）

**适合想要在线修改代码的用户**

### 步骤：

1. **上传到GitHub**（同方案1第1步）

2. **打开Gitpod**
   - 访问 https://gitpod.io/
   - 使用GitHub账号登录
   - 在浏览器地址栏输入：
   ```
   https://gitpod.io/#https://github.com/你的用户名/authmod
   ```

3. **等待环境启动**（约2-3分钟）

4. **在Gitpod终端中构建**
   ```bash
   chmod +x gradlew
   ./gradlew build
   ```

5. **下载jar文件**
   - 在左侧文件浏览器找到 `build/libs/authmod-1.0.0.jar`
   - 右键 → Download

### 优点：
- ✅ 完整的云端开发环境
- ✅ 可以在线修改代码
- ✅ 每月50小时免费使用
- ✅ 无需本地安装任何软件

---

## 方案3：Replit（在线IDE）

**最简单的在线IDE**

### 步骤：

1. **创建账号**
   - 访问 https://replit.com/
   - 注册/登录账号

2. **导入项目**
   - 点击 "Create Repl"
   - 选择 "Import from GitHub"
   - 输入GitHub仓库URL（需先上传到GitHub）
   
   或直接上传文件：
   - 选择 "Java"
   - 上传项目文件

3. **修改配置**
   - 在 `.replit` 文件中添加：
   ```
   run = "./gradlew build"
   ```

4. **点击Run按钮**
   - 等待构建完成
   - 在 `build/libs/` 目录找到jar文件

### 注意：
- ⚠️ Replit的免费版可能内存不足
- ⚠️ 首次构建可能需要15-20分钟

---

## 方案4：Codespaces（GitHub云端IDE）

**GitHub自带的云端开发环境**

### 步骤：

1. **上传到GitHub**（同方案1第1步）

2. **创建Codespace**
   - 在GitHub仓库页面
   - 点击绿色的 "Code" 按钮
   - 选择 "Codespaces" 标签
   - 点击 "Create codespace on main"

3. **等待环境启动**（约2-3分钟）

4. **在终端构建**
   ```bash
   chmod +x gradlew
   ./gradlew build
   ```

5. **下载jar文件**
   - 在文件浏览器找到jar文件
   - 右键 → Download

### 优点：
- ✅ GitHub官方支持
- ✅ 每月60小时免费
- ✅ 性能好，速度快
- ✅ VS Code体验

---

## 方案5：GitLab CI/CD

**类似GitHub Actions**

### 步骤：

1. **上传到GitLab**
   - 访问 https://gitlab.com/
   - 创建新项目并上传代码

2. **创建 `.gitlab-ci.yml`**（项目已包含，见下方）

3. **自动构建**
   - 推送后自动触发
   - 访问 CI/CD → Pipelines 查看进度

4. **下载产物**
   - 在Pipeline页面下载artifacts

---

## 快速使用GitHub Actions（最推荐）

### 1. 初始化Git仓库
```bash
# 在项目目录打开终端/命令提示符
git init
git add .
git commit -m "Add AuthMod project"
```

### 2. 创建GitHub仓库
- 访问 https://github.com/new
- 仓库名称：`authmod`
- 选择 Public 或 Private
- 点击 "Create repository"

### 3. 推送代码
```bash
# 替换为你的GitHub用户名和仓库名
git remote add origin https://github.com/你的用户名/authmod.git
git branch -M main
git push -u origin main
```

### 4. 查看构建
- 访问仓库的 Actions 标签
- 等待构建完成（绿色勾号）
- 点击构建任务
- 下载 Artifacts

---

## 配置文件说明

项目已包含以下配置文件：

### `.github/workflows/build.yml`
GitHub Actions的构建配置，会自动：
- 设置Java 17环境
- 下载依赖
- 编译项目
- 上传jar文件

### `.gitlab-ci.yml`（如需使用GitLab）
```yaml
image: openjdk:17-jdk-slim

stages:
  - build

build:
  stage: build
  script:
    - chmod +x gradlew
    - ./gradlew build --no-daemon
  artifacts:
    paths:
      - build/libs/*.jar
    expire_in: 1 week
  cache:
    paths:
      - .gradle
```

---

## 在线编译平台对比

| 平台 | 免费额度 | 构建速度 | 易用性 | 推荐度 |
|------|---------|---------|--------|--------|
| GitHub Actions | 2000分钟/月 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Gitpod | 50小时/月 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Codespaces | 60小时/月 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Replit | 无限 | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |
| GitLab CI | 400分钟/月 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

---

## 常见问题

### Q: 构建失败怎么办？
A: 
1. 检查Actions日志查看错误信息
2. 确保所有文件都已正确上传
3. 检查 `gradlew` 文件是否有执行权限

### Q: 下载的jar文件在哪？
A: 
- GitHub Actions: 在构建页面底部的 "Artifacts" 区域
- Gitpod/Codespaces: 在 `build/libs/` 目录

### Q: 构建需要多长时间？
A: 
- 首次构建：5-10分钟（需要下载依赖）
- 后续构建：2-3分钟（有缓存）

### Q: 可以修改代码后重新构建吗？
A: 
可以！修改代码后：
```bash
git add .
git commit -m "Update code"
git push
```
GitHub Actions会自动重新构建。

---

## 推荐流程（零基础）

1. ✅ 注册GitHub账号（免费）
2. ✅ 创建新仓库
3. ✅ 下载并安装Git（https://git-scm.com/）
4. ✅ 在项目目录运行上面的Git命令
5. ✅ 等待自动构建
6. ✅ 下载编译好的jar文件
7. ✅ 完成！

**整个过程不需要安装Java或Gradle！**

---

## 获取帮助

如果遇到问题：
1. 查看GitHub Actions的构建日志
2. 搜索错误信息
3. 在GitHub仓库提交Issue
4. 查看本项目的其他文档

祝您构建成功！🎉

