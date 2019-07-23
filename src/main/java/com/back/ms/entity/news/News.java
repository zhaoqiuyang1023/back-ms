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


@Data
@EqualsAndHashCode(callSuper = true)
@TableName("news")
public class News extends Model<News> {
	private static final long serialVersionUID = 1L;

	/**
	 * 新闻主键
	 */
	@TableId(type=IdType.UUID)
	private String id;
	/**
	 * 更新日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date dateUpdate;
	/**
	 * 创建日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")

	private Date dateCreate;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 来源
	 */
	private String from;
	/**
	 * 类型ID
	 */
	private String type;
	/**
	 * 副标题
	 */
	private String summary;
	/**
	 * 新闻内容
	 */
	private String content;
	/**
	 * 版本号
	 */
	private String version;
	/**
	 * 是否发布
	 */
	@TableField(value = "is_published")
	private Boolean published;
	/**
	 * 删除日期
	 */

	private Date dateDelete;
	/**
	 * 编辑
	 */
	private String editor;
	/**
	 * 索引
	 */
	private String index;
	/**
	 * 是否删除1是已删除，0
	 */
	@TableLogic
	@TableField(value = "is_del")
	private Boolean del;
	/**
	 * 图片地址
	 */
	private String pic;
	/**
	 * 是否置顶
	 */
	@TableField(value = "is_on_top")
	private Boolean onTop;
	/**
	 * 是否推荐
	 */
	@TableField(value = "is_recommendable")
	private Boolean recommendable;

	/**
	 * 上架/下架
	 */
	@TableField(value = "shelve")
	private Boolean shelve;

	/**
	 * 关键词
	 */

	private String keyWords;

	@TableField(exist = false)
	private NewsSetting newsSetting;

	@TableField(exist=false)
	private String typeName;
  /**
   * primary key
   */
  @Override
  protected Serializable pkVal() {
    return this.id;
  }
}
