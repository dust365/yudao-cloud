package cn.iocoder.mall.product.biz.dto.category;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @Author: jiangweifan
 * @Date: 2020/5/6
 * @Description: 商品分类 - 创建商品分类DTO
 */
@Data
@Accessors(chain = true)
public class ProductCategoryAddDTO {

    /**
     * 管理员id
     */
    private Integer adminId;

    /**
     * 父分类编号
     */
    private Integer pid;
    /**
     * 名称
     */
    private String name;
    /**
     * 描述
     */
    private String description;
    /**
     * 分类图片
     */
    private String picUrl;
    /**
     * 排序值
     */
    private Integer sort;

}