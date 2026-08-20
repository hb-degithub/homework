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

| 测试时间 | 测试结果 | 备注 |
|----------|----------|------|
| 2026-08-20 | ✅ 通过 | 数据库新增用户记录 |

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

| 测试时间 | 测试结果 | 备注 |
|----------|----------|------|
| 2026-08-20 | ✅ 通过 | 返回用户信息和 token |

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

| 测试时间 | 测试结果 | 备注 |
|----------|----------|------|
| 2026-08-20 | ✅ 通过 | 需要有效 token |

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

| 测试时间 | 测试结果 | 备注 |
|----------|----------|------|
| 2026-08-20 | ✅ 通过 | 数据库用户信息已更新 |

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
