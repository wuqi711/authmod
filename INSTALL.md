# AuthMod 安装和使用指南

## 快速开始

### 1. 环境要求

在开始之前，请确保您的环境满足以下要求：

- **Java开发工具包 (JDK)**: Java 17 或更高版本
- **Minecraft版本**: 1.20.1
- **Forge版本**: 47.2.0 或更高版本

### 2. 构建Mod

#### Windows用户

1. 打开命令提示符或PowerShell
2. 进入项目目录：
```bash
cd D:\网页\看视频网站
```

3. 运行构建命令：
```bash
gradlew.bat build
```

4. 等待构建完成，生成的jar文件位于 `build/libs/authmod-1.0.0.jar`

#### Linux/Mac用户

1. 打开终端
2. 进入项目目录
3. 赋予gradlew执行权限：
```bash
chmod +x gradlew
```

4. 运行构建命令：
```bash
./gradlew build
```

5. 生成的jar文件位于 `build/libs/authmod-1.0.0.jar`

### 3. 安装到服务器

1. 将构建好的 `authmod-1.0.0.jar` 复制到您的Minecraft服务器的 `mods` 目录
2. 确保服务器安装了Forge 1.20.1
3. 启动服务器

首次启动时，Mod会自动创建：
- 配置文件：`config/authmod-server.toml`
- 数据目录：`authmod/`
- 数据库文件：`authmod/authmod.db`

## 配置服务器

### 配置文件说明

编辑 `config/authmod-server.toml` 文件以自定义设置：

```toml
[AuthMod Configuration]
    # 登录超时时间（秒）- 玩家必须在此时间内登录，否则被踢出
    loginTimeout = 60
    
    # 会话超时时间（分钟）- 玩家离线后会话保持有效的时间
    sessionTimeout = 30
    
    # 最小密码长度 - 注册时密码的最小字符数
    minPasswordLength = 6
    
    # 是否启用会话管理 - 允许玩家断线重连时自动登录
    enableSessionManagement = true
    
    # 登录后传送到出生点 - 登录成功后是否将玩家传送到世界出生点
    spawnOnLogin = false
    
    # 未登录玩家保护半径 - 玩家在未登录时可移动的最大距离
    protectionRadius = 5
    
    # 最大登录尝试次数 - 超过此次数后玩家将被踢出
    maxLoginAttempts = 3
```

### 推荐配置

#### 高安全性服务器
```toml
loginTimeout = 30
sessionTimeout = 10
minPasswordLength = 8
enableSessionManagement = false
spawnOnLogin = true
protectionRadius = 0
maxLoginAttempts = 3
```

#### 友好型服务器
```toml
loginTimeout = 120
sessionTimeout = 60
minPasswordLength = 4
enableSessionManagement = true
spawnOnLogin = false
protectionRadius = 5
maxLoginAttempts = 5
```

## 玩家使用指南

### 新玩家首次加入

1. 加入服务器后，您会看到提示：
   ```
   欢迎来到服务器！请使用 /register <密码> <确认密码> 注册账户
   ```

2. 注册账户：
   ```
   /register mypassword123 mypassword123
   ```

3. 注册成功后会自动登录

### 已注册玩家登录

1. 加入服务器后，您会看到提示：
   ```
   欢迎回来！请使用 /login <密码> 登录
   ```

2. 输入登录命令：
   ```
   /login mypassword123
   ```

3. 登录成功！

### 修改密码

如果您想更改密码：
```
/changepassword 旧密码 新密码
```

### 自动登录

如果服务器启用了会话管理，您在短时间内重新连接服务器时会自动登录（需要相同IP地址）。

## 管理员操作指南

### 获取OP权限

首先，您需要在服务器控制台或作为OP执行：
```
/op <您的用户名>
```

### 常用管理命令

#### 注销玩家账户
当玩家忘记密码或需要重新注册时：
```
/authmod unregister <玩家名>
```

#### 重置玩家密码
为玩家设置新密码：
```
/authmod resetpassword <玩家名> <新密码>
```

#### 踢出所有未登录玩家
清理服务器中所有未登录的玩家：
```
/authmod kickunlogged
```

#### 重载配置
修改配置文件后重新加载：
```
/authmod reload
```

## 故障排除

### 问题：玩家无法注册

**可能原因**：
1. 密码太短（检查配置文件中的 `minPasswordLength`）
2. 两次输入的密码不一致
3. 玩家已经注册过

**解决方案**：
- 确认密码长度符合要求
- 仔细检查两次输入的密码是否完全一致
- 使用 `/authmod unregister <玩家名>` 删除已有账户后重新注册

### 问题：忘记密码

**解决方案**：
联系服务器管理员，使用以下命令重置密码：
```
/authmod resetpassword <玩家名> <新密码>
```

### 问题：登录超时被踢出

**可能原因**：
登录时间超过了配置的超时时间

**解决方案**：
- 重新加入服务器
- 更快地输入登录命令
- 管理员可以增加配置文件中的 `loginTimeout` 值

### 问题：无法移动/交互

**可能原因**：
您还未登录

**解决方案**：
使用 `/login <密码>` 命令登录

### 问题：数据库错误

**解决方案**：
1. 检查服务器日志查看详细错误信息
2. 确保 `authmod` 目录有读写权限
3. 如果数据库损坏，备份后删除 `authmod/authmod.db` 重新生成

## 数据备份

### 备份玩家数据

玩家的所有注册信息都存储在 `authmod/authmod.db` 文件中。

**备份步骤**：
1. 停止服务器
2. 复制 `authmod/authmod.db` 文件到安全位置
3. 定期创建备份

**恢复备份**：
1. 停止服务器
2. 将备份的 `authmod.db` 文件复制回 `authmod/` 目录
3. 启动服务器

## 开发和调试

### 启用调试日志

在服务器启动参数中添加：
```
-Dforge.logging.console.level=debug
```

### 运行测试服务器

使用Gradle运行测试服务器：
```bash
gradlew.bat runServer  # Windows
./gradlew runServer    # Linux/Mac
```

## 安全建议

1. **定期备份数据库**：防止数据丢失
2. **设置合理的密码长度**：建议至少6-8个字符
3. **启用会话管理**：提升玩家体验，但会稍微降低安全性
4. **限制登录尝试次数**：防止暴力破解
5. **保护数据库文件**：确保只有服务器管理员可以访问

## 更多帮助

如果遇到其他问题：
- 查看服务器日志文件：`logs/latest.log`
- 查看GitHub Issues页面
- 联系Mod开发者

## 卸载

如果需要卸载Mod：
1. 停止服务器
2. 从 `mods` 目录删除 `authmod-1.0.0.jar`
3. （可选）删除 `authmod/` 目录和配置文件

**警告**：删除 `authmod` 目录将永久删除所有玩家的注册信息！

