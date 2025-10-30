# AuthMod 构建说明

## 前置要求

在开始构建之前，请确保您的系统已安装：

### 必需软件
- **Java Development Kit (JDK) 17** 或更高版本
  - 下载地址：https://adoptium.net/
  - 验证安装：`java -version`

### 可选软件
- **IntelliJ IDEA** 或 **Eclipse**（用于开发）
- **Git**（用于版本控制）

## 构建步骤

### 方法1：使用命令行构建（推荐）

#### Windows系统

1. 打开命令提示符（CMD）或PowerShell
2. 导航到项目目录：
```cmd
cd D:\网页\看视频网站
```

3. 运行构建命令：
```cmd
gradlew.bat clean build
```

4. 等待构建完成（首次构建可能需要5-10分钟下载依赖）

5. 查找生成的jar文件：
```cmd
dir build\libs\
```

#### Linux/Mac系统

1. 打开终端
2. 导航到项目目录
3. 赋予gradlew执行权限：
```bash
chmod +x gradlew
```

4. 运行构建命令：
```bash
./gradlew clean build
```

5. 查找生成的jar文件：
```bash
ls -l build/libs/
```

### 方法2：使用IDE构建

#### IntelliJ IDEA

1. 打开IntelliJ IDEA
2. 选择 File → Open
3. 选择项目目录（包含build.gradle的目录）
4. 等待Gradle导入完成
5. 打开Gradle工具窗口（View → Tool Windows → Gradle）
6. 展开 Tasks → build
7. 双击 `build` 任务

#### Eclipse

1. 打开Eclipse
2. 选择 File → Import → Gradle → Existing Gradle Project
3. 选择项目目录
4. 等待导入完成
5. 右键项目 → Run As → Gradle Build
6. 在Goals中输入 `clean build`
7. 点击Run

## 构建输出

成功构建后，您将在以下位置找到生成的文件：

```
build/
├── libs/
│   └── authmod-1.0.0.jar          # ← 这是您需要的Mod文件！
└── ...
```

## 常见构建问题

### 问题1：Java版本不正确

**错误信息**：
```
Unsupported class file major version XX
```

**解决方案**：
- 确保安装了Java 17或更高版本
- 设置JAVA_HOME环境变量指向JDK 17

Windows:
```cmd
set JAVA_HOME=C:\Program Files\Java\jdk-17
```

Linux/Mac:
```bash
export JAVA_HOME=/path/to/jdk-17
```

### 问题2：网络连接问题

**错误信息**：
```
Could not resolve dependencies
Connection timeout
```

**解决方案**：
1. 检查网络连接
2. 配置代理（如需要）
3. 在build.gradle中添加国内镜像：

```gradle
repositories {
    maven { url 'https://maven.aliyun.com/repository/public/' }
    mavenCentral()
}
```

### 问题3：权限问题

**错误信息**（Linux/Mac）：
```
Permission denied: ./gradlew
```

**解决方案**：
```bash
chmod +x gradlew
```

### 问题4：内存不足

**错误信息**：
```
OutOfMemoryError: Java heap space
```

**解决方案**：
编辑 `gradle.properties`，增加内存：
```properties
org.gradle.jvmargs=-Xmx4G
```

## 开发模式构建

如果您想在开发中测试Mod：

### 运行测试服务器

Windows:
```cmd
gradlew.bat runServer
```

Linux/Mac:
```bash
./gradlew runServer
```

服务器将在 `run/` 目录中启动。

### 仅编译（不打包）

```bash
gradlew.bat classes     # Windows
./gradlew classes       # Linux/Mac
```

### 清理构建文件

```bash
gradlew.bat clean       # Windows
./gradlew clean         # Linux/Mac
```

## 验证构建

构建完成后，验证jar文件：

### 检查文件大小
jar文件应该在 500KB - 2MB 之间

### 检查文件内容
Windows:
```cmd
jar tf build\libs\authmod-1.0.0.jar
```

Linux/Mac:
```bash
jar tf build/libs/authmod-1.0.0.jar
```

应该看到：
- com/authmod/*.class
- META-INF/mods.toml
- assets/authmod/lang/*.json

## 构建性能优化

### 启用Gradle守护进程
在 `gradle.properties` 中：
```properties
org.gradle.daemon=true
```

### 启用并行构建
```properties
org.gradle.parallel=true
```

### 使用构建缓存
```properties
org.gradle.caching=true
```

## 发布准备

在发布Mod之前：

1. ✅ 更新版本号（gradle.properties）
2. ✅ 更新CHANGELOG.md
3. ✅ 运行完整测试
4. ✅ 构建最终版本：`gradlew clean build`
5. ✅ 验证jar文件可用

## 持续集成（CI）

如果使用GitHub Actions，创建 `.github/workflows/build.yml`：

```yaml
name: Build

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up JDK 17
        uses: actions/setup-java@v2
        with:
          java-version: '17'
          distribution: 'adopt'
      - name: Grant execute permission for gradlew
        run: chmod +x gradlew
      - name: Build with Gradle
        run: ./gradlew build
      - name: Upload artifact
        uses: actions/upload-artifact@v2
        with:
          name: authmod
          path: build/libs/*.jar
```

## 故障排除日志

如果构建失败，查看详细日志：

```bash
gradlew.bat build --stacktrace --info    # Windows
./gradlew build --stacktrace --info      # Linux/Mac
```

## 获取帮助

如果遇到构建问题：

1. 查看Gradle日志
2. 检查Java版本
3. 清理并重新构建
4. 查看GitHub Issues
5. 联系开发者

## 构建时间参考

| 操作 | 首次 | 后续 |
|------|------|------|
| 下载依赖 | 5-10分钟 | - |
| 编译代码 | 30-60秒 | 10-20秒 |
| 打包jar | 5-10秒 | 5-10秒 |
| 总计 | 6-12分钟 | 20-40秒 |

## 成功标志

构建成功时，您应该看到：

```
BUILD SUCCESSFUL in XXs
XX actionable tasks: XX executed
```

---

**祝您构建顺利！** 🎉

如有问题，请查看 README.md 或 INSTALL.md 获取更多帮助。

