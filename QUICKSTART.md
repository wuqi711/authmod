# AuthMod 快速入门

这是一个5分钟快速入门指南，帮助您快速构建和使用AuthMod。

## 📦 构建Mod（2分钟）

### Windows
```bash
# 在项目目录中打开命令提示符，运行：
gradlew.bat build
```

### Linux/Mac
```bash
# 在项目目录中打开终端，运行：
chmod +x gradlew
./gradlew build
```

构建完成后，在 `build/libs/` 目录找到 `authmod-1.0.0.jar`

## 🚀 安装到服务器（1分钟）

1. 将 `authmod-1.0.0.jar` 复制到服务器的 `mods` 目录
2. 启动服务器（需要Forge 1.20.1）
3. 完成！

## 👤 玩家使用（2分钟）

### 新玩家注册
```
/register 我的密码 我的密码
```

### 老玩家登录
```
/login 我的密码
```

### 修改密码
```
/changepassword 旧密码 新密码
```

## 🛡️ 管理员命令

需要OP权限：

```bash
# 注销玩家
/authmod unregister <玩家名>

# 重置密码
/authmod resetpassword <玩家名> <新密码>

# 踢出未登录玩家
/authmod kickunlogged
```

## ⚙️ 配置文件

编辑 `config/authmod-server.toml`:

```toml
[AuthMod Configuration]
    loginTimeout = 60              # 登录超时（秒）
    minPasswordLength = 6          # 最小密码长度
    maxLoginAttempts = 3           # 最大登录尝试次数
```

## 📖 更多信息

- 详细安装指南：查看 `INSTALL.md`
- 完整说明：查看 `README.md`
- 更新记录：查看 `CHANGELOG.md`

## ❓ 常见问题

**Q: 忘记密码怎么办？**  
A: 联系管理员使用 `/authmod resetpassword` 重置

**Q: 登录超时被踢怎么办？**  
A: 重新加入服务器，更快地输入登录命令

**Q: 无法移动/交互？**  
A: 您需要先登录才能进行游戏操作

## 🎯 核心功能

✅ 注册/登录系统  
✅ 密码加密存储  
✅ 会话管理（自动登录）  
✅ 限制未登录玩家操作  
✅ 超时自动踢出  
✅ 中英文支持  

---

就这么简单！开始使用AuthMod保护您的服务器吧！🎉

