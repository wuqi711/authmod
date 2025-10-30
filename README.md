# AuthMod - Minecraft 1.20.1 登录验证Mod

一个类似AuthMe插件的Minecraft 1.20.1 Forge服务器Mod，提供玩家注册、登录和会话管理功能。

## 功能特性

### 核心功能
- ✅ 玩家注册系统
- ✅ 玩家登录系统
- ✅ 密码修改功能
- ✅ SHA-256密码加密（带盐值）
- ✅ SQLite数据库存储

### 安全功能
- ✅ 限制未登录玩家的所有操作（移动、聊天、交互、攻击等）
- ✅ 登录超时自动踢出
- ✅ 登录失败次数限制
- ✅ 会话管理（断线重连自动登录）
- ✅ 防止玩家在未登录时受到伤害

### 管理功能
- ✅ 管理员命令（注销账户、重置密码、踢出未登录玩家）
- ✅ 可配置的参数（超时时间、密码长度、会话时间等）
- ✅ 中英文语言支持

## 安装方法

1. 确保服务器安装了 **Minecraft 1.20.1** 和 **Forge 47.2.0** 或更高版本
2. 将编译好的 `authmod-1.0.0.jar` 文件放入服务器的 `mods` 目录
3. 启动服务器，Mod会自动创建配置文件

## 构建方法

### 前置要求
- Java 17 或更高版本
- Gradle（项目自带Gradle Wrapper）

### 构建步骤

1. 克隆或下载项目：
```bash
git clone <repository-url>
cd authmod
```

2. 使用Gradle构建：

Windows:
```bash
gradlew.bat build
```

Linux/Mac:
```bash
./gradlew build
```

3. 构建完成后，在 `build/libs/` 目录下找到生成的jar文件

## 使用方法

### 玩家命令

#### 注册账户
```
/register <密码> <确认密码>
/reg <密码> <确认密码>
```

#### 登录
```
/login <密码>
/l <密码>
```

#### 修改密码
```
/changepassword <旧密码> <新密码>
/changepw <旧密码> <新密码>
```

### 管理员命令

需要OP权限（等级2）

#### 注销玩家账户
```
/authmod unregister <玩家>
```

#### 重置玩家密码
```
/authmod resetpassword <玩家> <新密码>
```

#### 踢出所有未登录玩家
```
/authmod kickunlogged
```

#### 重载配置
```
/authmod reload
```

## 配置文件

配置文件位于 `config/authmod-server.toml`，首次启动后自动生成。

### 配置选项

| 配置项 | 默认值 | 说明 |
|--------|--------|------|
| `loginTimeout` | 60 | 登录超时时间（秒） |
| `sessionTimeout` | 30 | 会话超时时间（分钟） |
| `minPasswordLength` | 6 | 最小密码长度 |
| `enableSessionManagement` | true | 是否启用会话管理 |
| `spawnOnLogin` | false | 登录后是否传送到出生点 |
| `protectionRadius` | 5 | 未登录玩家保护半径 |
| `maxLoginAttempts` | 3 | 最大登录尝试次数 |

### 配置示例

```toml
[AuthMod Configuration]
    loginTimeout = 60
    sessionTimeout = 30
    minPasswordLength = 6
    enableSessionManagement = true
    spawnOnLogin = false
    protectionRadius = 5
    maxLoginAttempts = 3
```

## 数据存储

玩家数据存储在 `authmod/authmod.db` SQLite数据库文件中，包含以下信息：
- 玩家UUID
- 用户名
- 密码哈希值
- 盐值
- 最后登录IP
- 最后登录时间
- 注册时间
- 会话令牌

## 工作原理

### 注册流程
1. 新玩家加入服务器
2. 玩家被冻结，无法进行任何操作
3. 使用 `/register` 命令注册账户
4. 密码使用SHA-256加密并存储到数据库
5. 自动登录并解除限制

### 登录流程
1. 已注册玩家加入服务器
2. 检查会话是否有效（IP和时间）
3. 如果会话有效，自动登录
4. 否则要求手动登录
5. 登录成功后解除所有限制

### 安全机制
- 密码使用SHA-256哈希，每个账户使用独立的随机盐值
- 未登录玩家无法移动、聊天、交互、攻击或受伤
- 登录超时自动踢出
- 登录失败次数限制，超过上限自动踢出
- 会话管理防止频繁断线重连

## 兼容性

- **Minecraft版本**: 1.20.1
- **Forge版本**: 47.2.0+
- **Java版本**: 17+

## 技术栈

- Forge 1.20.1
- SQLite JDBC 3.43.0.0
- Java 17

## 许可证

MIT License

## 致谢

本Mod灵感来源于Bukkit平台的 [AuthMe](https://github.com/AuthMe/AuthMeReloaded) 插件。

## 贡献

欢迎提交Issue和Pull Request！

## 支持

如遇到问题，请在GitHub仓库提交Issue。

