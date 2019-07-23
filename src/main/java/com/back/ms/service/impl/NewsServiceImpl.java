package com.back.ms.service.impl;

import com.back.ms.mapper.news.NewsMapper;
import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.News;
import com.back.ms.service.NewsService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("newsService")
public class NewsServiceImpl extends ServiceImpl<NewsMapper, News> implements NewsService {

    @Autowired
    NewsMapper newsMapper;

//    @Autowired
//    SubjectNewsService subjectNewsService;


    @Override
    public List<News> findNewsBySubjectId(String id) {
        return newsMapper.findNewsBySubjectId(id);
    }

    @Override
    public Page<News> findNewsByPage(NewsSummaryAO newsSummaryAO) {
        Page<News> page = new Page<>(newsSummaryAO.getPage(), newsSummaryAO.getLimit());
        List<News> newsList = newsMapper.findNewsByPage(page, newsSummaryAO);
        page.setRecords(newsList);
        return page;
    }

    @Transactional
    @Override
    public boolean deleteNewsById(String downId) {
      //  subjectNewsService.delete(new EntityWrapper<SubjectNews>().eq("news_id", downId));
        newsMapper.deleteNewsById(downId);
        return Boolean.TRUE;
    }
}
