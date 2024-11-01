CREATE TABLE IF NOT EXISTS `ai_chat_conversation` (
                                                      `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID 编号，自增',
                                                      `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                                      `title` VARCHAR(255) NOT NULL DEFAULT '新对话' COMMENT '对话标题',
                                                      `pinned` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否置顶',
                                                      `pinned_time` DATETIME COMMENT '置顶时间',
                                                      `role_id` BIGINT COMMENT '角色编号',
                                                      `knowledge_id` BIGINT COMMENT '知识库编号',
                                                      `model_id` BIGINT COMMENT '模型编号',
                                                      `model` VARCHAR(255) COMMENT '模型标志',
                                                      `system_message` TEXT COMMENT '角色设定',
                                                      `temperature` DOUBLE COMMENT '温度参数',
                                                      `max_tokens` INT COMMENT '单条回复的最大 Token 数量',
                                                      `max_contexts` INT COMMENT '上下文的最大 Message 数量',
                                                      `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                      `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                      `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                      `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                      `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                      PRIMARY KEY (`id`)
) COMMENT 'AI Chat 对话';


CREATE TABLE IF NOT EXISTS `ai_chat_message` (
                                                 `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号，作为每条聊天记录的唯一标识符',
                                                 `conversation_id` BIGINT NOT NULL COMMENT '对话编号',
                                                 `reply_id` BIGINT COMMENT '回复消息编号',
                                                 `type` VARCHAR(50) NOT NULL COMMENT '消息类型',
                                                 `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                                 `role_id` BIGINT COMMENT '角色编号',
                                                 `segment_ids` TEXT COMMENT '段落编号数组',
                                                 `model` VARCHAR(255) COMMENT '模型标志',
                                                 `model_id` BIGINT COMMENT '模型编号',
                                                 `content` TEXT COMMENT '聊天内容',
                                                 `use_context` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否携带上下文',
                                                 `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                 `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                 `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                 `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                 PRIMARY KEY (`id`),
                                                 INDEX `idx_conversation_id` (`conversation_id`) COMMENT '对话编号索引',
                                                 INDEX `idx_reply_id` (`reply_id`) COMMENT '回复消息编号索引'
) COMMENT 'AI Chat 消息';

CREATE TABLE IF NOT EXISTS `ai_image` (
                                          `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                          `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                          `prompt` TEXT COMMENT '提示词',
                                          `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                          `model` VARCHAR(255) COMMENT '模型',
                                          `width` INT COMMENT '图片宽度',
                                          `height` INT COMMENT '图片高度',
                                          `status` INT NOT NULL COMMENT '生成状态',
                                          `finish_time` DATETIME COMMENT '完成时间',
                                          `error_message` TEXT COMMENT '绘画错误信息',
                                          `pic_url` VARCHAR(1024) COMMENT '图片地址',
                                          `public_status` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否公开',
                                          `options` TEXT COMMENT '绘制参数',
                                          `buttons` TEXT COMMENT 'mj buttons 按钮',
                                          `task_id` VARCHAR(255) COMMENT '任务编号',
                                          `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                          `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                          `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                          PRIMARY KEY (`id`)
) COMMENT 'AI 绘画';



CREATE TABLE IF NOT EXISTS `ai_knowledge` (
                                              `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                              `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                              `name` VARCHAR(255) NOT NULL COMMENT '知识库名称',
                                              `description` TEXT COMMENT '知识库描述',
                                              `visibility_permissions` TEXT COMMENT '可见权限',
                                              `model_id` BIGINT COMMENT '嵌入模型编号',
                                              `model` VARCHAR(255) COMMENT '模型标识',
                                              `top_k` INT COMMENT 'topK',
                                              `similarity_threshold` DOUBLE COMMENT '相似度阈值',
                                              `status` INT NOT NULL COMMENT '状态',
                                              `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                              `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                              `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                              PRIMARY KEY (`id`)
) COMMENT 'AI 知识库';

CREATE TABLE IF NOT EXISTS `ai_knowledge_document` (
                                                       `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                       `knowledge_id` BIGINT NOT NULL COMMENT '知识库编号',
                                                       `name` VARCHAR(255) NOT NULL COMMENT '文件名称',
                                                       `content` TEXT COMMENT '内容',
                                                       `url` VARCHAR(1024) COMMENT '文件 URL',
                                                       `tokens` INT COMMENT '文档 token 数量',
                                                       `word_count` INT COMMENT '文档字符数',
                                                       `default_segment_tokens` INT COMMENT '每个文本块的目标 token 数',
                                                       `min_segment_word_count` INT COMMENT '每个文本块的最小字符数',
                                                       `min_chunk_length_to_embed` INT COMMENT '低于此值的块会被丢弃',
                                                       `max_num_segments` INT COMMENT '最大块数',
                                                       `keep_separator` BIT(1) NOT NULL DEFAULT FALSE COMMENT '分块是否保留分隔符',
                                                       `slice_status` INT NOT NULL COMMENT '切片状态',
                                                       `status` INT NOT NULL COMMENT '状态',
                                                       `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                       `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                       `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                       `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                       `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                       PRIMARY KEY (`id`),
                                                       INDEX `idx_knowledge_id` (`knowledge_id`) COMMENT '知识库编号索引'
) COMMENT 'AI 知识库-文档';


CREATE TABLE IF NOT EXISTS `ai_knowledge_segment` (
                                                      `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                                      `vector_id` VARCHAR(255) COMMENT '向量库的编号',
                                                      `knowledge_id` BIGINT NOT NULL COMMENT '知识库编号',
                                                      `document_id` BIGINT NOT NULL COMMENT '文档编号',
                                                      `content` TEXT COMMENT '切片内容',
                                                      `word_count` INT COMMENT '字符数',
                                                      `tokens` INT COMMENT 'token 数量',
                                                      `status` INT NOT NULL COMMENT '状态',
                                                      `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                                      `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                      `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                                      `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                      `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                                      PRIMARY KEY (`id`),
                                                      INDEX `idx_knowledge_id` (`knowledge_id`) COMMENT '知识库编号索引',
                                                      INDEX `idx_document_id` (`document_id`) COMMENT '文档编号索引'
) COMMENT 'AI 知识库-文档分段';


CREATE TABLE IF NOT EXISTS `ai_mind_map` (
                                             `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                             `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                             `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                             `model` VARCHAR(255) COMMENT '模型',
                                             `prompt` TEXT COMMENT '生成内容提示',
                                             `generated_content` TEXT COMMENT '生成的内容',
                                             `error_message` TEXT COMMENT '错误信息',
                                             `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                             `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                             `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                             PRIMARY KEY (`id`)
) COMMENT 'AI 思维导图';


CREATE TABLE IF NOT EXISTS `ai_api_key` (
                                            `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                            `name` VARCHAR(255) NOT NULL COMMENT '名称',
                                            `api_key` VARCHAR(255) NOT NULL COMMENT '密钥',
                                            `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                            `url` VARCHAR(1024) COMMENT 'API 地址',
                                            `status` INT NOT NULL COMMENT '状态',
                                            `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                            `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                            `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                            PRIMARY KEY (`id`)
) COMMENT 'AI API 秘钥';



CREATE TABLE IF NOT EXISTS `ai_chat_model` (
                                               `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                               `key_id` BIGINT NOT NULL COMMENT 'API 秘钥编号',
                                               `name` VARCHAR(255) NOT NULL COMMENT '模型名称',
                                               `model` VARCHAR(255) NOT NULL COMMENT '模型标志',
                                               `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                               `sort` INT NOT NULL COMMENT '排序值',
                                               `status` INT NOT NULL COMMENT '状态',
                                               `temperature` DOUBLE COMMENT '温度参数',
                                               `max_tokens` INT COMMENT '单条回复的最大 Token 数量',
                                               `max_contexts` INT COMMENT '上下文的最大 Message 数量',
                                               `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                               `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                               `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                               PRIMARY KEY (`id`),
                                               INDEX `idx_key_id` (`key_id`) COMMENT 'API 秘钥编号索引'
) COMMENT 'AI 聊天模型';

CREATE TABLE IF NOT EXISTS `ai_chat_role` (
                                              `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                              `name` VARCHAR(255) NOT NULL COMMENT '角色名称',
                                              `avatar` VARCHAR(1024) COMMENT '角色头像',
                                              `category` VARCHAR(255) COMMENT '角色分类',
                                              `description` TEXT COMMENT '角色描述',
                                              `system_message` TEXT COMMENT '角色设定',
                                              `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                              `model_id` BIGINT COMMENT '模型编号',
                                              `public_status` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否公开',
                                              `sort` INT COMMENT '排序值',
                                              `status` INT NOT NULL COMMENT '状态',
                                              `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                              `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                              `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                              PRIMARY KEY (`id`),
                                              INDEX `idx_user_id` (`user_id`) COMMENT '用户编号索引',
                                              INDEX `idx_model_id` (`model_id`) COMMENT '模型编号索引'
) COMMENT 'AI 聊天角色';


CREATE TABLE IF NOT EXISTS `ai_music` (
                                          `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                          `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                          `title` VARCHAR(255) NOT NULL COMMENT '音乐名称',
                                          `lyric` TEXT COMMENT '歌词',
                                          `image_url` VARCHAR(1024) COMMENT '图片地址',
                                          `audio_url` VARCHAR(1024) COMMENT '音频地址',
                                          `video_url` VARCHAR(1024) COMMENT '视频地址',
                                          `status` INT NOT NULL COMMENT '音乐状态',
                                          `generate_mode` INT NOT NULL COMMENT '生成模式',
                                          `description` TEXT COMMENT '描述词',
                                          `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                          `model` VARCHAR(255) COMMENT '模型',
                                          `tags` TEXT COMMENT '音乐风格标签',
                                          `duration` DOUBLE COMMENT '音乐时长',
                                          `public_status` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否公开',
                                          `task_id` VARCHAR(255) COMMENT '任务编号',
                                          `error_message` TEXT COMMENT '错误信息',
                                          `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                          `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                          `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                          PRIMARY KEY (`id`),
                                          INDEX `idx_user_id` (`user_id`) COMMENT '用户编号索引'
) COMMENT 'AI 音乐';


CREATE TABLE IF NOT EXISTS `ai_write` (
                                          `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '编号',
                                          `user_id` BIGINT NOT NULL COMMENT '用户编号',
                                          `type` INT NOT NULL COMMENT '写作类型',
                                          `platform` VARCHAR(50) NOT NULL COMMENT '平台',
                                          `model` VARCHAR(255) COMMENT '模型',
                                          `prompt` TEXT COMMENT '生成内容提示',
                                          `generated_content` TEXT COMMENT '生成的内容',
                                          `original_content` TEXT COMMENT '原文',
                                          `length` INT COMMENT '长度提示词',
                                          `format` INT COMMENT '格式提示词',
                                          `tone` INT COMMENT '语气提示词',
                                          `language` INT COMMENT '语言提示词',
                                          `error_message` TEXT COMMENT '错误信息',
                                          `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                          `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                          `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          `deleted` BIT(1) NOT NULL DEFAULT FALSE COMMENT '是否删除',
                                          PRIMARY KEY (`id`),
                                          INDEX `idx_user_id` (`user_id`) COMMENT '用户编号索引'
) COMMENT 'AI 写作';