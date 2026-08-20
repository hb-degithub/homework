# DAY06 - 数据库设计与后端初始化（学习项目）

## 作业内容

1. 整理 cike 文件夹里面的内容（frontend、backend）
2. 用 IDEA 初始化 SpringBoot 后端代码放在 cike/backend
3. 用 AI 根据数据库设计文档生成 SQL 建表脚本并在本地执行

## 完成内容

| 任务 | 文件/位置 | 状态 |
|------|----------|------|
| SQL 建表脚本 | `day06/cike_schema.sql` | ✅ |
| 后端项目 | `day05/cike/backend/` | ✅ |
| 数据库执行 | MySQL 本地 | ✅ |

## 数据库表结构

| 表名 | 说明 |
|------|------|
| t_user | 用户表 |
| t_note | 笔记表 |
| t_note_image | 笔记图片表 |
| t_topic | 话题表 |
| t_note_topic | 笔记话题关联表 |
| t_comment | 评论表 |
| t_user_like_note | 点赞表 |
| t_user_collect_note | 收藏表 |
| t_draft | 草稿表 |

## 项目结构

```
day06/
├── cike_schema.sql     # 数据库建表脚本
└── README.md           # 本文件
```

## 相关链接

- cike 仓库：https://github.com/hb-degithub/cike
