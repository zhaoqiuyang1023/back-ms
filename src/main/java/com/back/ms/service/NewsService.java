package com.back.ms.service;

import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.News;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 
 *
 * @author Hanping QIAO
 * 2018-11-26 10:19:02
 */
public interface NewsService extends IService<News> {




    List<News> findNewsBySubjectId(String id);


    Page<News> findNewsByPage(NewsSummaryAO newsSummaryAO);

    boolean deleteNewsById(String downId);
}

