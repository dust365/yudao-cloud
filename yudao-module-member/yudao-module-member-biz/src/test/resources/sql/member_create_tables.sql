CREATE TABLE IF NOT EXISTS `member_user` (
                                             `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                             `nickname` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '用户昵称',
                                             `name` VARCHAR(30) NULL COMMENT '真实名字',
                                             `sex` TINYINT NULL COMMENT '性别',
                                             `birthday` DATETIME NULL COMMENT '出生日期',
                                             `area_id` INT NULL COMMENT '所在地',
                                             `mark` VARCHAR(255) NULL COMMENT '用户备注',
                                             `point` INT NOT NULL DEFAULT 0 COMMENT '积分',
                                             `avatar` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '头像',
                                             `status` TINYINT NOT NULL COMMENT '状态',
                                             `mobile` VARCHAR(11) NOT NULL COMMENT '手机号',
                                             `password` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '密码',
                                             `register_ip` VARCHAR(32) NOT NULL COMMENT '注册 IP',
                                             `login_ip` VARCHAR(50) NULL DEFAULT '' COMMENT '最后登录IP',
                                             `login_date` DATETIME NULL DEFAULT NULL COMMENT '最后登录时间',
                                             `tag_ids` VARCHAR(255) NULL DEFAULT NULL COMMENT '用户标签编号列表,以逗号分隔',
                                             `level_id` BIGINT NULL DEFAULT NULL COMMENT '等级编号',
                                             `experience` BIGINT NULL DEFAULT NULL COMMENT '经验',
                                             `group_id` BIGINT NULL DEFAULT NULL COMMENT '用户分组编号',
                                             `creator` VARCHAR(64) NULL DEFAULT '' COMMENT '创建者',
                                             `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `updater` VARCHAR(64) NULL DEFAULT '' COMMENT '更新者',
                                             `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                             `tenant_id` BIGINT NOT NULL DEFAULT 0,
                                             `register_terminal` BIGINT NOT NULL DEFAULT 0,
                                             PRIMARY KEY (`id`)
) COMMENT '会员表';

CREATE TABLE IF NOT EXISTS `member_address` (
                                                `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                `user_id` BIGINT NOT NULL,
                                                `name` VARCHAR(10) NOT NULL,
                                                `mobile` VARCHAR(20) NOT NULL,
                                                `area_id` BIGINT NOT NULL,
                                                `detail_address` VARCHAR(250) NOT NULL,
                                                `default_status` BIT NOT NULL,
                                                `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                `creator` VARCHAR(64) DEFAULT '',
                                                `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                                `deleted` BIT NOT NULL DEFAULT FALSE,
                                                `updater` VARCHAR(64) DEFAULT '',
                                                PRIMARY KEY (`id`)
) COMMENT '用户收件地址';

CREATE TABLE IF NOT EXISTS `member_tag` (
                                            `id` BIGINT NOT NULL AUTO_INCREMENT,
                                            `name` VARCHAR(255) NOT NULL,
                                            `creator` VARCHAR(64) DEFAULT '',
                                            `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                            `updater` VARCHAR(64) DEFAULT '',
                                            `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                            `deleted` BIT NOT NULL DEFAULT FALSE,
                                            `tenant_id` BIGINT NOT NULL DEFAULT 0,
                                            PRIMARY KEY (`id`)
) COMMENT '会员标签';

CREATE TABLE IF NOT EXISTS `member_level` (
                                              `id` BIGINT NOT NULL AUTO_INCREMENT,
                                              `name` VARCHAR(255) NOT NULL,
                                              `experience` INT NOT NULL,
                                              `level` INT NOT NULL,
                                              `discount_percent` INT NOT NULL,
                                              `icon` VARCHAR(255) NOT NULL,
                                              `background_url` VARCHAR(255) NOT NULL,
                                              `creator` VARCHAR(64) DEFAULT '',
                                              `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                              `updater` VARCHAR(64) DEFAULT '',
                                              `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                              `deleted` BIT NOT NULL DEFAULT FALSE,
                                              `tenant_id` BIGINT NOT NULL DEFAULT 0,
                                              `status` TINYINT NOT NULL DEFAULT 0,
                                              PRIMARY KEY (`id`)
) COMMENT '会员等级';

CREATE TABLE IF NOT EXISTS `member_group` (
                                              `id` BIGINT NOT NULL AUTO_INCREMENT,
                                              `name` VARCHAR(255) NOT NULL,
                                              `remark` VARCHAR(255) NOT NULL,
                                              `status` TINYINT NOT NULL DEFAULT 0,
                                              `creator` VARCHAR(64) DEFAULT '',
                                              `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                              `updater` VARCHAR(64) DEFAULT '',
                                              `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                              `deleted` BIT NOT NULL DEFAULT FALSE,
                                              `tenant_id` BIGINT NOT NULL DEFAULT 0,
                                              PRIMARY KEY (`id`)
) COMMENT '用户分组';

CREATE TABLE IF NOT EXISTS `member_brokerage_record` (
                                                         `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                         `user_id` BIGINT NOT NULL,
                                                         `biz_id` VARCHAR(255) NOT NULL,
                                                         `biz_type` VARCHAR(255) NOT NULL,
                                                         `title` VARCHAR(255) NOT NULL,
                                                         `price` INT NOT NULL,
                                                         `total_price` INT NOT NULL,
                                                         `description` VARCHAR(255) NOT NULL,
                                                         `status` VARCHAR(255) NOT NULL,
                                                         `frozen_days` INT NOT NULL,
                                                         `unfreeze_time` VARCHAR(255),
                                                         `creator` VARCHAR(64) DEFAULT '',
                                                         `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                         `updater` VARCHAR(64) DEFAULT '',
                                                         `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                                         `deleted` BIT NOT NULL DEFAULT FALSE,
                                                         `tenant_id` BIGINT NOT NULL DEFAULT 0,
                                                         PRIMARY KEY (`id`)
) COMMENT '佣金记录';


CREATE TABLE IF NOT EXISTS `member_point_record` (
                                                     `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                                                     `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                                     `biz_id` VARCHAR(255) NOT NULL COMMENT '业务编码',
                                                     `biz_type` INT NOT NULL COMMENT '业务类型',
                                                     `title` VARCHAR(255) NOT NULL COMMENT '积分标题',
                                                     `description` VARCHAR(255) NOT NULL COMMENT '积分描述',
                                                     `point` INT NOT NULL COMMENT '变动积分',
                                                     `total_point` INT NOT NULL COMMENT '变动后的积分',
                                                     `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                     `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                     `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                     `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                     `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                     PRIMARY KEY (`id`)
) COMMENT '用户积分记录';

CREATE TABLE IF NOT EXISTS `member_sign_in_record` (
                                                       `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                       `user_id` BIGINT NOT NULL COMMENT '签到用户',
                                                       `day` INT NOT NULL COMMENT '第几天签到',
                                                       `point` INT NOT NULL COMMENT '签到的积分',
                                                       `experience` INT NOT NULL COMMENT '签到的经验',
                                                       `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                       `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                       `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                       `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                       `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                       PRIMARY KEY (`id`)
) COMMENT '签到记录';