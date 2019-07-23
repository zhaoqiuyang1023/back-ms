package com.back.ms.mapper.news;

import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.News;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NewsMapper extends BaseMapper<News> {


    @Select(value = "select a.* from news a, subject_news b where a.id=b.news_id and b.subject_id =#{id}  ")
    List<News> findNewsBySubjectId(String id);



    List<News> findNewsByPage(Page<News> page, @Param("ao") NewsSummaryAO newsSummaryAO);

    @Delete(value = "delete from news where id=#{downId} ")
    boolean deleteNewsById(String downId);
}
