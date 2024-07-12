/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t189`;
CREATE DATABASE IF NOT EXISTS `t189` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t189`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'upload/picture1.jpg'),
	(2, 'picture2', 'upload/picture2.jpg'),
	(3, 'picture3', 'upload/picture3.jpg');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '测试模板名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '测试模板状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='测试模板表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `addtime`, `name`, `time`, `status`) VALUES
	(1, '2022-03-16 08:17:38', '十万个为什么', 60, 1);

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属测试模板id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '测试模板名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `addtime`, `paperid`, `papername`, `questionname`, `options`, `score`, `answer`, `analysis`, `type`, `sequence`) VALUES
	(1, '2022-03-16 08:17:38', 1, '十万个为什么', '下面动物不属于昆虫的是（）。', '[{"text":"A.苍蝇","code":"A"},{"text":"B.蜜蜂","code":"B"},{"text":"C.蜂鸟","code":"C"}]', 20, 'C', '蜂鸟', 0, 1),
	(2, '2022-03-16 08:17:38', 1, '十万个为什么', '油着火后可以用水扑灭。', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 20, 'B', '油着火后不可以用水扑灭', 2, 2),
	(3, '2022-03-16 08:17:38', 1, '十万个为什么', '地球是个球体，中间是（ ）。', '[]', 30, '赤道', '赤道', 3, 3),
	(4, '2022-03-16 08:17:38', 1, '十万个为什么', '下面动物中会流汗的有（ ）。', '[{"text":"A.马","code":"A"},{"text":"B.猫","code":"B"},{"text":"C.狗","code":"C"}]', 30, 'A,B', '狗不会流汗', 1, 4);

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '测试模板id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '测试模板名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1715675839970 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `addtime`, `userid`, `username`, `paperid`, `papername`, `questionid`, `questionname`, `options`, `score`, `answer`, `analysis`, `myscore`, `myanswer`) VALUES
	(1647419185652, '2022-03-16 08:26:25', 12, '用户姓名2', 1, '十万个为什么', 1, '下面动物不属于昆虫的是（）。', '[{"text":"A.苍蝇","code":"A"},{"text":"B.蜜蜂","code":"B"},{"text":"C.蜂鸟","code":"C"}]', 20, 'C', '蜂鸟', 20, 'C'),
	(1647419191702, '2022-03-16 08:26:31', 12, '用户姓名2', 1, '十万个为什么', 2, '油着火后可以用水扑灭。', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 20, 'B', '油着火后不可以用水扑灭', 20, 'B'),
	(1647419198284, '2022-03-16 08:26:38', 12, '用户姓名2', 1, '十万个为什么', 3, '地球是个球体，中间是（ ）。', '[]', 30, '赤道', '赤道', 30, '赤道'),
	(1647419203459, '2022-03-16 08:26:42', 12, '用户姓名2', 1, '十万个为什么', 4, '下面动物中会流汗的有（ ）。', '[{"text":"A.马","code":"A"},{"text":"B.猫","code":"B"},{"text":"C.狗","code":"C"}]', 30, 'A,B', '狗不会流汗', 30, 'A,B'),
	(1715675831981, '2024-05-14 08:37:11', 11, '用户姓名1', 1, '十万个为什么', 1, '下面动物不属于昆虫的是（）。', '[{"text":"A.苍蝇","code":"A"},{"text":"B.蜜蜂","code":"B"},{"text":"C.蜂鸟","code":"C"}]', 20, 'C', '蜂鸟', 0, 'A'),
	(1715675835040, '2024-05-14 08:37:14', 11, '用户姓名1', 1, '十万个为什么', 2, '油着火后可以用水扑灭。', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 20, 'B', '油着火后不可以用水扑灭', 0, 'A'),
	(1715675837729, '2024-05-14 08:37:17', 11, '用户姓名1', 1, '十万个为什么', 3, '地球是个球体，中间是（ ）。', '[]', 30, '赤道', '赤道', 0, '·'),
	(1715675839969, '2024-05-14 08:37:19', 11, '用户姓名1', 1, '十万个为什么', 4, '下面动物中会流汗的有（ ）。', '[{"text":"A.马","code":"A"},{"text":"B.猫","code":"B"},{"text":"C.狗","code":"C"}]', 30, 'A,B', '狗不会流汗', 0, 'A');

DROP TABLE IF EXISTS `gonggaoxinxi`;
CREATE TABLE IF NOT EXISTS `gonggaoxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `gonggaoneirong` longtext COMMENT '公告内容',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419535625 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `gonggaoxinxi`;
INSERT INTO `gonggaoxinxi` (`id`, `addtime`, `biaoti`, `fengmian`, `gonggaoneirong`, `fabushijian`) VALUES
	(31, '2022-03-16 08:17:38', '标题1', 'upload/gonggaoxinxi_fengmian1.jpg', '公告内容1', '2022-03-16'),
	(32, '2022-03-16 08:17:38', '标题2', 'upload/gonggaoxinxi_fengmian2.jpg', '公告内容2', '2022-03-16'),
	(33, '2022-03-16 08:17:38', '标题3', 'upload/gonggaoxinxi_fengmian3.jpg', '公告内容3', '2022-03-16'),
	(34, '2022-03-16 08:17:38', '标题4', 'upload/gonggaoxinxi_fengmian4.jpg', '公告内容4', '2022-03-16'),
	(35, '2022-03-16 08:17:38', '标题5', 'upload/gonggaoxinxi_fengmian5.jpg', '公告内容5', '2022-03-16'),
	(36, '2022-03-16 08:17:38', '标题6', 'upload/gonggaoxinxi_fengmian6.jpg', '公告内容6', '2022-03-16'),
	(1647419535624, '2022-03-16 08:32:15', '测试', 'upload/1647419528524.jpg', '<p>测试</p>', '2022-03-16');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 11, '用户账号1', 'yonghu', '用户', 'fz4tkvkoayv2keubampbsfivvbmpjt1e', '2022-03-16 08:18:54', '2024-05-14 09:36:48'),
	(2, 21, '医生账号1', 'yisheng', '医生', 'q1rkd4mvcmgghh4a3j1e2sj3c1f0fm6g', '2022-03-16 08:22:23', '2024-05-14 09:36:37'),
	(3, 1, 'abo', 'users', '管理员', 'i3g11p0egrvyengasdcr59xzrlm2ac9z', '2022-03-16 08:23:41', '2024-05-14 09:35:31'),
	(4, 12, '用户账号2', 'yonghu', '用户', '3m7idjt42qk5yhm5jzv4tdwgqy9dqxre', '2022-03-16 08:25:40', '2022-03-16 09:25:41'),
	(5, 22, '医生账号2', 'yisheng', '医生', 'x0ufp1qsezoci3822hn2ciyjr7ueeepx', '2022-03-16 08:28:33', '2022-03-16 09:28:34');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-03-16 08:17:38');

DROP TABLE IF EXISTS `yisheng`;
CREATE TABLE IF NOT EXISTS `yisheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) NOT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihao` varchar(200) DEFAULT NULL COMMENT '手机号',
  `yishengzhiwei` varchar(200) DEFAULT NULL COMMENT '医生职位',
  `yishengjianjie` longtext COMMENT '医生简介',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yishengzhanghao` (`yishengzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419492738 DEFAULT CHARSET=utf8mb3 COMMENT='医生';

DELETE FROM `yisheng`;
INSERT INTO `yisheng` (`id`, `addtime`, `yishengzhanghao`, `yishengxingming`, `mima`, `xingbie`, `shoujihao`, `yishengzhiwei`, `yishengjianjie`, `touxiang`, `sfsh`, `shhf`) VALUES
	(21, '2022-03-16 08:17:38', '医生1', '医生姓名1', '123456', '男', '13823888881', '医生职位1', '医生简介1', 'upload/yisheng_touxiang1.jpg', '是', ''),
	(22, '2022-03-16 08:17:38', '医生2', '医生姓名2', '123456', '男', '13823888882', '医生职位2', '医生简介2', 'upload/yisheng_touxiang2.jpg', '是', ''),
	(23, '2022-03-16 08:17:38', '医生3', '医生姓名3', '123456', '男', '13823888883', '医生职位3', '医生简介3', 'upload/yisheng_touxiang3.jpg', '是', ''),
	(24, '2022-03-16 08:17:38', '医生4', '医生姓名4', '123456', '男', '13823888884', '医生职位4', '医生简介4', 'upload/yisheng_touxiang4.jpg', '是', ''),
	(25, '2022-03-16 08:17:38', '医生5', '医生姓名5', '123456', '男', '13823888885', '医生职位5', '医生简介5', 'upload/yisheng_touxiang5.jpg', '是', ''),
	(26, '2022-03-16 08:17:38', '医生6', '医生姓名6', '123456', '男', '13823888886', '医生职位6', '医生简介6', 'upload/yisheng_touxiang6.jpg', '是', ''),
	(1647419492737, '2022-03-16 08:31:32', '1234', '王医生', '1111', '女', '12345678944', '医师', NULL, 'upload/1647419488230.jpg', '是', 'US大按实际');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihao` varchar(200) DEFAULT NULL COMMENT '手机号',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419439248 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghuxingming`, `mima`, `xingbie`, `shoujihao`, `touxiang`) VALUES
	(11, '2022-03-16 08:17:38', '用户1', '用户姓名1', '123456', '女', '13823888881', 'upload/yonghu_touxiang1.jpg'),
	(12, '2022-03-16 08:17:38', '用户2', '用户姓名2', '123456', '女', '13823888882', 'upload/yonghu_touxiang2.jpg'),
	(13, '2022-03-16 08:17:38', '用户3', '用户姓名3', '123456', '男', '13823888883', 'upload/yonghu_touxiang3.jpg'),
	(14, '2022-03-16 08:17:38', '用户4', '用户姓名4', '123456', '男', '13823888884', 'upload/yonghu_touxiang4.jpg'),
	(15, '2022-03-16 08:17:38', '用户5', '用户姓名5', '123456', '男', '13823888885', 'upload/yonghu_touxiang5.jpg'),
	(16, '2022-03-16 08:17:38', '用户6', '用户姓名6', '123456', '男', '13823888886', 'upload/yonghu_touxiang6.jpg'),
	(1647419439247, '2022-03-16 08:30:39', '001', '李胜', '1111', '男', '12345678901', 'upload/1647419438709.jpg');

DROP TABLE IF EXISTS `zhenduanjilu`;
CREATE TABLE IF NOT EXISTS `zhenduanjilu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `zhenduanneirong` varchar(200) DEFAULT NULL COMMENT '诊断内容',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `zhenduanshijian` datetime DEFAULT NULL COMMENT '诊断时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419380850 DEFAULT CHARSET=utf8mb3 COMMENT='诊断记录';

DELETE FROM `zhenduanjilu`;
INSERT INTO `zhenduanjilu` (`id`, `addtime`, `yonghuzhanghao`, `yonghuxingming`, `zhenduanneirong`, `yishengzhanghao`, `yishengxingming`, `zhenduanshijian`) VALUES
	(51, '2022-03-16 08:17:38', '用户账号1', '用户姓名1', '', '医生账号1', '医生姓名1', '2022-03-16 16:17:38'),
	(52, '2022-03-16 08:17:38', '用户账号2', '用户姓名2', '', '医生账号2', '医生姓名2', '2022-03-16 16:17:38'),
	(53, '2022-03-16 08:17:38', '用户账号3', '用户姓名3', '', '医生账号3', '医生姓名3', '2022-03-16 16:17:38'),
	(54, '2022-03-16 08:17:38', '用户账号4', '用户姓名4', '', '医生账号4', '医生姓名4', '2022-03-16 16:17:38'),
	(55, '2022-03-16 08:17:38', '用户账号5', '用户姓名5', '', '医生账号5', '医生姓名5', '2022-03-16 16:17:38'),
	(56, '2022-03-16 08:17:38', '用户账号6', '用户姓名6', '', '医生账号6', '医生姓名6', '2022-03-16 16:17:38'),
	(1647419380849, '2022-03-16 08:29:40', '用户账号2', '用户姓名2', 'upload/1647419379291.jpeg', '医生账号1', '医生姓名1', '2022-03-16 16:29:52');

DROP TABLE IF EXISTS `zixunxinxi`;
CREATE TABLE IF NOT EXISTS `zixunxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishengzhanghao` varchar(200) DEFAULT NULL COMMENT '医生账号',
  `yishengxingming` varchar(200) DEFAULT NULL COMMENT '医生姓名',
  `yishengzhiwei` varchar(200) DEFAULT NULL COMMENT '医生职位',
  `zixunneirong` longtext COMMENT '资询内容',
  `zixunshijian` datetime DEFAULT NULL COMMENT '咨询时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647419162610 DEFAULT CHARSET=utf8mb3 COMMENT='咨询信息';

DELETE FROM `zixunxinxi`;
INSERT INTO `zixunxinxi` (`id`, `addtime`, `yishengzhanghao`, `yishengxingming`, `yishengzhiwei`, `zixunneirong`, `zixunshijian`, `yonghuzhanghao`, `yonghuxingming`, `sfsh`, `shhf`) VALUES
	(41, '2022-03-16 08:17:38', '医生账号1', '医生姓名1', '医生职位1', '资询内容1', '2022-03-16 16:17:38', '用户账号1', '用户姓名1', '是', ''),
	(42, '2022-03-16 08:17:38', '医生账号2', '医生姓名2', '医生职位2', '资询内容2', '2022-03-16 16:17:38', '用户账号2', '用户姓名2', '是', ''),
	(43, '2022-03-16 08:17:38', '医生账号3', '医生姓名3', '医生职位3', '资询内容3', '2022-03-16 16:17:38', '用户账号3', '用户姓名3', '是', ''),
	(44, '2022-03-16 08:17:38', '医生账号4', '医生姓名4', '医生职位4', '资询内容4', '2022-03-16 16:17:38', '用户账号4', '用户姓名4', '是', ''),
	(45, '2022-03-16 08:17:38', '医生账号5', '医生姓名5', '医生职位5', '资询内容5', '2022-03-16 16:17:38', '用户账号5', '用户姓名5', '是', ''),
	(46, '2022-03-16 08:17:38', '医生账号6', '医生姓名6', '医生职位6', '资询内容6', '2022-03-16 16:17:38', '用户账号6', '用户姓名6', '是', ''),
	(1647418843083, '2022-03-16 08:20:42', '医生账号1', '医生姓名1', '医生职位1', '<p><img src="../../../upload/1647418839672.jpeg" /></p>', '2022-03-16 16:19:39', '用户账号1', '用户姓名1', '是', '京东方建设路口'),
	(1647419162609, '2022-03-16 08:26:02', '医生账号1', '医生姓名1', '医生职位1', '<p><img src="../../../upload/1647419160764.jpeg" /></p>', '2022-03-16 16:26:08', '用户账号2', '用户姓名2', '是', '卡死了看到');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
