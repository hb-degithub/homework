# DAY08 - API 接口测试文档（学习项目）

## 项目信息

- **项目名称**：此刻图文分享社区
- **基础地址**：http://localhost:8080
- **测试工具**：Apifox / Postman / curl

---

## 1. 用户模块

### 1.1 用户注册

**接口信息**
- 请求方式：POST
- 请求路径：/api/user/register
- 请求头：Content-Type: application/json

**请求参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| phone | string | 是 | 手机号 |
| password | string | 是 | 密码（至少6位） |
| nickname | string | 是 | 昵称 |

**请求示例**

```json
{
  "phone": "13800138006",
  "password": "123456",
  "nickname": "测试用户"
}
```

**响应示例**

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "id": 6,
    "phone": "13800138006",
    "nickname": "测试用户",
    "avatar": "",
    "token": "token_13800138006_123456"
  }
}
```

**测试记录**

| 测试时间 | 测试结果 | 数据库验证 | 备注 |
|----------|----------|-----------|------|
| 2026-08-20 | ✅ 通过 | ✅ t_user 表新增记录 | 用户 ID: 6 |

**数据库验证查询**

```sql
-- 验证用户是否插入成功
SELECT * FROM t_user WHERE phone = '13800138006';

-- 验证用户总数
SELECT COUNT(*) FROM t_user;
```

---

### 1.2 用户登录

**接口信息**
- 请求方式：POST
- 请求路径：/api/user/login
- 请求头：Content-Type: application/json

**请求参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| phone | string | 是 | 手机号 |
| password | string | 是 | 密码 |

**请求示例**

```json
{
  "phone": "13800138001",
  "password": "123456"
}
```

**响应示例**

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "id": 1,
    "phone": "13800138001",
    "nickname": "小明同学",
    "avatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=1",
    "token": "token_13800138001_123456"
  }
}
```

**测试记录**

| 测试时间 | 测试结果 | 数据库验证 | 备注 |
|----------|----------|-----------|------|
| 2026-08-20 | ✅ 通过 | - | 返回 token: token_13800138001_123456 |

**数据库验证查询**

```sql
-- 验证用户存在
SELECT id, phone, nickname FROM t_user WHERE phone = '13800138001';
```

---

### 1.3 获取用户信息

**接口信息**
- 请求方式：GET
- 请求路径：/api/user/info
- 请求头：Authorization: Bearer {token}

**请求示例**

```
GET /api/user/info
Authorization: Bearer token_13800138001_123456
```

**响应示例**

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "id": 1,
    "phone": "13800138001",
    "nickname": "小明同学",
    "avatar": "https://api.dicebear.com/7.x/avataaars/svg?seed=1",
    "bio": "热爱生活，喜欢分享日常",
    "noteCount": 5,
    "likeTotal": 128
  }
}
```

**测试记录**

| 测试时间 | 测试结果 | 数据库验证 | 备注 |
|----------|----------|-----------|------|
| 2026-08-20 | ✅ 通过 | - | 需要有效 token |

**数据库验证查询**

```sql
-- 验证用户信息
SELECT id, phone, nickname, avatar, bio, note_count, like_total FROM t_user WHERE id = 1;
```

---

### 1.4 更新用户信息

**接口信息**
- 请求方式：PUT
- 请求路径：/api/user/profile
- 请求头：Authorization: Bearer {token}
- 请求头：Content-Type: application/json

**请求参数**

| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| nickname | string | 否 | 昵称 |
| avatar | string | 否 | 头像URL |
| bio | string | 否 | 个人简介 |

**请求示例**

```json
{
  "nickname": "新昵称",
  "bio": "新的个人简介"
}
```

**响应示例**

```json
{
  "code": 200,
  "message": "success",
  "data": null
}
```

**测试记录**

| 测试时间 | 测试结果 | 数据库验证 | 备注 |
|----------|----------|-----------|------|
| 2026-08-20 | ✅ 通过 | ✅ t_user 表已更新 | 昵称已修改 |

**数据库验证查询**

```sql
-- 验证用户信息已更新
SELECT id, nickname, bio, update_time FROM t_user WHERE id = 1;

-- 对比更新前后
SELECT nickname, bio FROM t_user WHERE id = 1;
```

---

## 2. 测试总结

### 测试结果统计

| 接口 | 状态 | 数据库验证 |
|------|------|-----------|
| 用户注册 | ✅ 通过 | ✅ 数据已插入 |
| 用户登录 | ✅ 通过 | - |
| 获取用户信息 | ✅ 通过 | - |
| 更新用户信息 | ✅ 通过 | ✅ 数据已更新 |

### 全链路验证

- [x] 前端 → 后端 → 数据库 完整链路
- [x] 注册 → 登录 → 获取信息 → 更新信息 完整流程
- [x] 数据库数据正确性验证

### 前端联调测试

| 功能 | 操作 | 预期结果 | 实际结果 | 状态 |
|------|------|----------|----------|------|
| 用户注册 | 填写表单点击注册 | 提示成功，跳转登录 | 待测试 | ⏳ |
| 用户登录 | 填写表单点击登录 | 提示成功，跳转首页 | 待测试 | ⏳ |
| 个人信息 | 查看个人中心 | 显示用户信息 | 待测试 | ⏳ |
| 修改资料 | 编辑并保存 | 提示成功，数据更新 | 待测试 | ⏳ |

### 数据库操作验证清单

| 操作 | SQL 验证 | 状态 |
|------|----------|------|
| 用户注册 | `SELECT * FROM t_user WHERE phone = 'xxx'` | ✅ |
| 用户登录 | `SELECT * FROM t_user WHERE phone = 'xxx' AND password = 'xxx'` | ✅ |
| 更新资料 | `SELECT nickname, bio FROM t_user WHERE id = 1` | ✅ |

---

## 3. 在线靶场用户模块

### 靶场信息

- **平台**：Apifox 在线靶场
- **项目**：用户管理模块

### 接口列表

| 接口 | 路径 | 方法 |
|------|------|------|
| 用户注册 | /api/user/register | POST |
| 用户登录 | /api/user/login | POST |
| 获取用户列表 | /api/user/list | GET |
| 获取用户详情 | /api/user/{id} | GET |
| 更新用户 | /api/user/{id} | PUT |
| 删除用户 | /api/user/{id} | DELETE |

### 导出文件

在线靶场用户模块 markdown 文档已导出并保存。

---

## 4. 启动说明

### 启动后端服务

```bash
cd h:\开发\homework\day05\cike\backend
.\mvnw.cmd spring-boot:run
```

### 启动 Redis

```bash
cd h:\开发\homework\redis
.\redis-server.exe
```

### 验证服务

```bash
# 测试图片接口
curl http://localhost:8080/getImage

# 测试用户注册
curl -X POST http://localhost:8080/api/user/register \
  -H "Content-Type: application/json" \
  -d '{"phone":"13800138006","password":"123456","nickname":"测试用户"}'
```
