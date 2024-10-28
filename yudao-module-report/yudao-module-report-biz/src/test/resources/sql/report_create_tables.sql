CREATE TABLE IF NOT EXISTS `report_go_view_project` (
                                                        `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                        `name` VARCHAR(255) NOT NULL COMMENT '名称',
                                                        `pic_url` VARCHAR(255) COMMENT '图片 URL',
                                                        `content` TEXT COMMENT '内容',
                                                        `status` VARCHAR(50) NOT NULL COMMENT '状态',
                                                        `remark` VARCHAR(255) COMMENT '备注',
                                                        `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                        `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                        `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                        `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                        `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                        PRIMARY KEY (`id`)
) COMMENT 'GoView 项目表';
# 猜他的表，太累了，不猜了
DROP TABLE IF EXISTS `jimu_report_category`;
CREATE TABLE IF NOT EXISTS `jimu_report_category` (
                                                        `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                        `name` VARCHAR(255) NOT NULL COMMENT '名称',
#                                                         `pic_url` VARCHAR(255) COMMENT '图片 URL',
#                                                         `content` TEXT COMMENT '内容',
                                                        `parent_id` Int NOT NULL COMMENT 'parent_id',
                                                        `source_type` Int NOT NULL COMMENT 'source_type',
                                                        `del_flag` Int NOT NULL COMMENT 'del_flag',
#                                                         `remark` VARCHAR(255) COMMENT '备注',
                                                        `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                        `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                        `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                        `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                        `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                        PRIMARY KEY (`id`)
) COMMENT 'jimu_report_category 积木报表分类';