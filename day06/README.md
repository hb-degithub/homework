# DAY06 作业说明

## 作业内容

1. 整理 cike 文件夹结构（frontend / backend / docs / design_source）
2. 用 IDEA / Spring Initializr 初始化 SpringBoot 后端代码放在 `cike/backend`
3. 用 AI 根据《数据库设计文档》生成 SQL 建表脚本，本地执行，脚本存入 day06

## 交付物

| 内容 | 位置 |
| --- | --- |
| 整理后的 cike 项目 | `day05/cike/`（frontend / backend / docs / design_source） |
| SpringBoot 后端 | `day05/cike/backend/`（Spring Boot 4.0.7 + Java 21） |
| SQL 建表脚本 | `day06/cike_schema.sql` |

## 数据库执行情况

- 本地 MySQL 8.0.30（`cike` 库，utf8mb4）
- 9 张表全部创建成功：`t_user`、`t_note`、`t_note_image`、`t_topic`、`t_note_topic`、`t_comment`、`t_user_like_note`、`t_user_collect_note`、`t_draft`

执行方式：

```bash
mysql -uroot -p < day06/cike_schema.sql
```

## 后端启动方式

```bash
cd day05/cike/backend
./mvnw spring-boot:run
# 浏览器访问 http://127.0.0.1:8080/getImage 验证
```

## 备注

- `backend` 首次启动需下载 Maven 依赖，请耐心等待或在 IDEA 中打开自动下载。
- MySQL 连接配置在 `backend/src/main/resources/application.properties`。
