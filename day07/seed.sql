-- =====================================================================
-- 「此刻」图文分享社区 种子数据脚本
-- 用于初始化测试数据
-- 执行方式：mysql -uroot -p cike < day07/seed.sql
-- =====================================================================

USE `cike`;

-- 清空现有数据（可选，谨慎使用）
-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE `t_draft`;
-- TRUNCATE TABLE `t_user_collect_note`;
-- TRUNCATE TABLE `t_user_like_note`;
-- TRUNCATE TABLE `t_comment`;
-- TRUNCATE TABLE `t_note_topic`;
-- TRUNCATE TABLE `t_topic`;
-- TRUNCATE TABLE `t_note_image`;
-- TRUNCATE TABLE `t_note`;
-- TRUNCATE TABLE `t_user`;
-- SET FOREIGN_KEY_CHECKS = 1;

-- ---------------------------------------------------------------------
-- 1. 用户数据
-- ---------------------------------------------------------------------
INSERT INTO `t_user` (`id`, `phone`, `password`, `nickname`, `avatar`, `bio`, `note_count`, `like_total`) VALUES
(1, '13800138001', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', '小明同学', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1', '热爱生活，喜欢分享日常', 5, 128),
(2, '13800138002', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', '美食达人', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2', '专注美食探店，带你吃遍全城', 12, 456),
(3, '13800138003', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', '旅行家', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3', '世界那么大，我想去看看', 8, 234),
(4, '13800138004', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', '摄影师', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4', '用镜头记录美好瞬间', 15, 789),
(5, '13800138005', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', '程序员', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5', '代码改变世界', 3, 56);

-- ---------------------------------------------------------------------
-- 2. 话题数据
-- ---------------------------------------------------------------------
INSERT INTO `t_topic` (`id`, `topic_name`, `note_count`) VALUES
(1, '#美食探店', 15),
(2, '#旅行日记', 12),
(3, '#摄影技巧', 8),
(4, '#生活记录', 20),
(5, '#好物分享', 6),
(6, '#健身打卡', 4),
(7, '#读书笔记', 3),
(8, '#编程学习', 5);

-- ---------------------------------------------------------------------
-- 3. 笔记数据
-- ---------------------------------------------------------------------
INSERT INTO `t_note` (`id`, `user_id`, `title`, `content`, `cover_url`, `view_count`, `like_count`, `collect_count`, `comment_count`, `visible`, `status`) VALUES
(1, 1, '周末的早餐时光', '今天早上做了一份简单的早餐，煎蛋、吐司和一杯热牛奶。简单但很幸福！', 'https://picsum.photos/800/600?random=1', 156, 23, 5, 3, 1, 1),
(2, 2, '这家火锅真的绝了', '今天探店了一家新开的火锅店，锅底浓郁，食材新鲜，强烈推荐给大家！', 'https://picsum.photos/800/600?random=2', 892, 156, 45, 28, 1, 1),
(3, 3, '云南旅行第一天', '终于来到了心心念念的云南，大理古城的风景真的太美了，分享给大家。', 'https://picsum.photos/800/600?random=3', 445, 89, 23, 12, 1, 1),
(4, 4, '城市夜景拍摄技巧', '分享一些城市夜景拍摄的小技巧：使用三脚架、低ISO、长曝光...', 'https://picsum.photos/800/600?random=4', 678, 234, 67, 15, 1, 1),
(5, 1, '阳台上的小花园', '在阳台上种了一些花花草草，每天早上看到它们心情都会变好。', 'https://picsum.photos/800/600?random=5', 234, 45, 12, 6, 1, 1),
(6, 2, '自制甜品教程', '今天教大家做一款简单的芒果布丁，材料简单，口感细腻。', 'https://picsum.photos/800/600?random=6', 567, 123, 34, 18, 1, 1),
(7, 3, '海边日落', '在海边看日落真的是一种享受，金色的阳光洒在海面上，美得让人窒息。', 'https://picsum.photos/800/600?random=7', 789, 167, 45, 21, 1, 1),
(8, 5, 'Vue3 学习笔记', '最近在学习 Vue3，记录一些学习心得和踩过的坑，希望对大家有帮助。', 'https://picsum.photos/800/600?random=8', 345, 67, 23, 9, 1, 1);

-- ---------------------------------------------------------------------
-- 4. 笔记图片数据
-- ---------------------------------------------------------------------
INSERT INTO `t_note_image` (`note_id`, `image_url`, `sort`) VALUES
(1, 'https://picsum.photos/800/600?random=11', 0),
(1, 'https://picsum.photos/800/600?random=12', 1),
(2, 'https://picsum.photos/800/600?random=21', 0),
(2, 'https://picsum.photos/800/600?random=22', 1),
(2, 'https://picsum.photos/800/600?random=23', 2),
(3, 'https://picsum.photos/800/600?random=31', 0),
(3, 'https://picsum.photos/800/600?random=32', 1),
(4, 'https://picsum.photos/800/600?random=41', 0),
(4, 'https://picsum.photos/800/600?random=42', 1),
(5, 'https://picsum.photos/800/600?random=51', 0),
(6, 'https://picsum.photos/800/600?random=61', 0),
(7, 'https://picsum.photos/800/600?random=71', 0),
(8, 'https://picsum.photos/800/600?random=81', 0);

-- ---------------------------------------------------------------------
-- 5. 笔记-话题关联数据
-- ---------------------------------------------------------------------
INSERT INTO `t_note_topic` (`note_id`, `topic_id`) VALUES
(1, 4), (1, 5),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 1), (6, 5),
(7, 2),
(8, 8);

-- ---------------------------------------------------------------------
-- 6. 评论数据
-- ---------------------------------------------------------------------
INSERT INTO `t_comment` (`note_id`, `user_id`, `parent_id`, `reply_user_id`, `content`) VALUES
(1, 2, 0, 0, '看起来好好吃！'),
(1, 3, 0, 0, '简单的生活最幸福'),
(1, 1, 1, 2, '是的，味道很不错'),
(2, 1, 0, 0, '在哪里？求地址！'),
(2, 4, 0, 0, '我也去过，确实不错'),
(2, 2, 4, 1, '在市中心广场二楼'),
(3, 1, 0, 0, '风景太美了！'),
(3, 5, 0, 0, '求攻略！'),
(4, 2, 0, 0, '学习了，谢谢分享'),
(4, 3, 0, 0, '拍得真好看'),
(5, 4, 0, 0, '好治愈的感觉'),
(6, 1, 0, 0, '马住，周末试试'),
(7, 2, 0, 0, '太美了，想去'),
(8, 1, 0, 0, '感谢分享！');

-- ---------------------------------------------------------------------
-- 7. 点赞数据
-- ---------------------------------------------------------------------
INSERT INTO `t_user_like_note` (`user_id`, `note_id`) VALUES
(1, 2), (1, 3), (1, 4),
(2, 1), (2, 3), (2, 5),
(3, 1), (3, 2), (3, 4),
(4, 2), (4, 3), (4, 7),
(5, 4), (5, 7);

-- ---------------------------------------------------------------------
-- 8. 收藏数据
-- ---------------------------------------------------------------------
INSERT INTO `t_user_collect_note` (`user_id`, `note_id`) VALUES
(1, 2), (1, 4),
(2, 1), (2, 6),
(3, 4), (3, 7),
(4, 3), (4, 7),
(5, 4);

-- ---------------------------------------------------------------------
-- 9. 草稿数据
-- ---------------------------------------------------------------------
INSERT INTO `t_draft` (`user_id`, `title`, `content`, `image_json`, `topic_ids`, `visible`) VALUES
(1, '未完成的笔记', '这是一篇还没写完的笔记...', '["https://picsum.photos/800/600?random=91"]', '4,5', 1),
(3, '旅行计划', '下次旅行的计划清单...', '[]', '2', 1);
