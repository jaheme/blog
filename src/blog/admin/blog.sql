CREATE DATABASE IF NOT EXISTS blog DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int AUTO_INCREMENT NOT NULL,
  `uname` varchar(32) NOT NULL,
  `passw` varchar(32) NOT NULL,
  `rname` varchar(32) DEFAULT '',
  `uemail` varchar(32) DEFAULT '',
  `create_time` datetime NOT NULL,
  `login_time` datetime NOT NULL,
  `is_admin` bool NOT NULL DEFAULT '0', 
  `is_lock` bool NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `article` (
  `id` int AUTO_INCREMENT NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(128) NOT NULL,
  `tags` varchar(64) NOT NULL,
  `url` varchar(64) NOT NULL DEFAULT '',
  `category` smallint(4) NOT NULL DEFAULT '0',
  `status` smallint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `commends` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `article_text` (
  `article_id` int(10) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `article_commend` (
  `id` bigint AUTO_INCREMENT NOT NULL,
  `article_id` int NOT NULL,
  `user_id` int(10),
  `content` text NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO user SET uname='jaheme', rname='', uemail='yinghelai@gmail.com', passw='jaheme', create_time=now(), login_time=now(), is_admin=1;

CREATE TABLE IF NOT EXISTS `message` (
  `id` int AUTO_INCREMENT NOT NULL,
  `uname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(32) DEFAULT '',
  `message` varchar(512) DEFAULT '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;