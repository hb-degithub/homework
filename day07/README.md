# DAY07 作业说明（学习项目）

## 完成内容

| 任务 | 文件/位置 | 状态 |
|------|----------|------|
| seed.sql 种子数据脚本 | `day07/seed.sql` | ✅ |
| API 接口文档 | `cike/docs/api.md` | ✅ |
| Redis 缓存配置 | `cike/backend/config/RedisConfig.java` | ✅ |
| 缓存服务类 | `cike/backend/service/CacheService.java` | ✅ |
| 后端依赖更新 | `cike/backend/pom.xml` | ✅ |

## 手动操作步骤

### 1. 启动 Redis

```bash
# 进入 Redis 目录
cd C:\Users\qlAD\Desktop\Redis-8.10.0-Windows-x64-cygwin-with-Service

# 启动 Redis 服务
redis-server.exe redis.windows.conf
```

### 2. 执行 seed.sql

```bash
# 进入 MySQL
mysql -uroot -p123456

# 执行脚本
source h:/开发/homework/day07/seed.sql

# 或使用命令行
mysql -uroot -p123456 cike < h:/开发/homework/day07/seed.sql
```

### 3. 验证数据

```sql
-- 查看用户表
SELECT * FROM t_user;

-- 查看笔记表
SELECT * FROM t_note;

-- 查看话题表
SELECT * FROM t_topic;

-- 查看评论表
SELECT * FROM t_comment;
```

### 4. 截图保存

将以下表的查询结果截图保存到 `day07` 文件夹：
- t_user（用户表）
- t_note（笔记表）
- t_topic（话题表）
- t_comment（评论表）

### 5. 启动后端服务

```bash
cd h:\开发\homework\day05\cike\backend
.\mvnw.cmd spring-boot:run
```

访问 http://localhost:8080/getImage 验证服务正常。

## 项目结构

```
day07/
├── seed.sql          # 种子数据脚本
└── README.md         # 本文件

cike/
├── docs/
│   ├── api.md        # API 接口文档
│   └── cike_schema.sql  # 数据库建表脚本
└── backend/
    ├── src/main/java/com/cike/backend/
    │   ├── config/
    │   │   └── RedisConfig.java    # Redis 配置
    │   └── service/
    │       └── CacheService.java   # 缓存服务
    └── pom.xml       # 已添加 Redis 依赖
```

## 注意事项

- 数据库密码已改为 `123456`
- Redis 默认端口 `6379`
- 后端服务端口 `8080`
