package com.back.ms.entity.ao;


import lombok.Data;

@Data
public class NewsSummaryAO {
    private Integer page = 1;

    private Integer limit = 10;






    /**
     * 是否发布 true是发布，false是草稿，
     */
    private Boolean announce;

    /**
     * false下架，true上架
     */
    private Boolean shelve;

    private Boolean recommendable;

    /**
     * 新闻类别id
     */
    private String typeId;

    private String title;
}
