package com.back.ms.entity.news;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Hanping QIAO
 * @date 2018-11-26 14:39:10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("news_setting")
public class NewsSetting extends Model<NewsSetting> {
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(type = IdType.UUID)
    private String id;
    /**
     * newsTypes
     * newsBanners
     * homepageBanners
     * letterVerifyEmail
     * toolsStatistics
     * agentEmail
     * contactEmail
     * adminExamineEmail
     * homepagePartners
     * partershipVisibility
     * defaultConsignee
     * shipVerifyEmail
     */
    private String name;
    /**
     * 新闻类别名称
     */
    private String value;
    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(value = "date_update")
    private Date dateUpdate;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(value = "date_create")
    private Date dateCreate;
    /**
     * 删除时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @TableField(value = "date_delete")
    private Date dateDelete;
    /**
     * 版本号
     */
    private String version;

    /**
     * 是否删除1是已删除，0
     */
    @TableLogic
    @TableField(value = "is_del")
    private String del;

    /**
     *
     */
    @TableField(exist = false)
    private Integer newsNumber;

    @TableField(exist = false)
    private String imageUrl;

    @TableField(exist = false)
    private String link;

    @TableField(exist = false)
    private String imageBannerTitle;

    @TableField(exist = false)
    private String originName;

    @TableField(exist = false)
    private String imageid;

    /**
     * primary key
     */
    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
