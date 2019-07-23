package com.back.ms.mapper.news;

import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.NewsSetting;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;


@Mapper
public interface NewsSettingMapper extends BaseMapper<NewsSetting> {

    @Select("select * from `news_setting` where `name`= 'newsBanners' ")
    List<NewsSetting> findEPNewsBanners();

    @Select("select * from `news_setting` where `name`= 'newsTypes' ")
    List<NewsSetting> findEPNewsTypes();

    List<NewsSetting> findSummary(Page<NewsSetting> page, NewsSummaryAO newsSummaryAO);

    List<NewsSetting> findNewsImagesSummary(Page<NewsSetting> page, NewsSummaryAO newsSummaryAO);
}
