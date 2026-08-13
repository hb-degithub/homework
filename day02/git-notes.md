# Git 版本控制学习笔记

## 一、Git 简介

Git 是一个**分布式版本控制系统**，用于跟踪文件的变化，协助多人协作开发。

### 核心概念

- **仓库（Repository）**：存放代码的地方
- **工作区（Working Directory）**：本地编辑文件的目录
- **暂存区（Staging Area）**：临时存放改动的区域
- **提交（Commit）**：保存当前状态的快照

---

## 二、常用命令

### 2.1 初始化与配置

```bash
# 初始化仓库
git init

# 配置用户信息
git config --global user.name "你的名字"
git config --global user.email "your@email.com"
```

### 2.2 基本操作

```bash
# 查看状态
git status

# 添加文件到暂存区
git add filename.txt
git add .  # 添加所有文件

# 提交
git commit -m "提交说明"

# 查看提交历史
git log --oneline
```

### 2.3 远程仓库

```bash
# 关联远程仓库
git remote add origin https://github.com/username/repo.git

# 推送到远程
git push -u origin main

# 拉取远程更新
git pull
```

---

## 三、工作流程图

```
工作区 → git add → 暂存区 → git commit → 本地仓库 → git push → 远程仓库
```

![Git 工作流程](https://git-scm.com/images/about/index1@2x.png)

---

## 四、分支管理

| 命令 | 说明 |
|------|------|
| `git branch` | 查看分支 |
| `git branch 分支名` | 创建分支 |
| `git checkout 分支名` | 切换分支 |
| `git merge 分支名` | 合并分支 |

---

## 五、总结

> Git 是程序员必备技能，掌握基本命令可以大大提高开发效率。

**重点记忆：**
1. `git add` → 暂存
2. `git commit` → 提交
3. `git push` → 推送
