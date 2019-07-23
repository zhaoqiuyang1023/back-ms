package com.back.ms.service.impl;

import com.back.ms.mapper.news.NewsSettingMapper;
import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.NewsSetting;
import com.back.ms.service.NewsSettingService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("newsSettingService")
public class NewsSettingServiceImpl extends ServiceImpl<NewsSettingMapper, NewsSetting> implements NewsSettingService {

    @Autowired
    NewsSettingMapper newsSettingMapper;

    @Override
    public List<NewsSetting> findEPNewsBanners() {
        return newsSettingMapper.findEPNewsBanners();
    }

    @Override
    public List<NewsSetting> findEPNewsTypes() {
        return newsSettingMapper.findEPNewsTypes();
    }

    @Override
    public Page<NewsSetting> findNewsTypeByPage(NewsSummaryAO newsSummaryAO) {
        if (newsSummaryAO == null) {
            newsSummaryAO = new NewsSummaryAO();
        }
        Page<NewsSetting> page = new Page<>(newsSummaryAO.getPage(), newsSummaryAO.getLimit());
        List<NewsSetting> shipSummaryVOS = newsSettingMapper.findSummary(page, newsSummaryAO);

        return page.setRecords(shipSummaryVOS);
    }

    @Override
    public Page<NewsSetting> findNewsImagesByPage(NewsSummaryAO newsSummaryAO) {
        if (newsSummaryAO == null) {
            newsSummaryAO = new NewsSummaryAO();
        }
        Page<NewsSetting> page = new Page<>(newsSummaryAO.getPage(), newsSummaryAO.getLimit());
        List<NewsSetting> list = newsSettingMapper.findNewsImagesSummary(page, newsSummaryAO);
        for (NewsSetting newsSetting:list){
            JSONObject jsonObject= new JSONObject(newsSetting.getValue());
            JSONArray array=jsonObject.getJSONArray("img");
            if(array!=null&&array.length()>0){
                JSONObject jo=array.getJSONObject(0);
                newsSetting.setImageUrl(jo.optString("url"));
                newsSetting.setLink(jsonObject.optString("link"));
            }
            String title=jsonObject.getString("title");
            newsSetting.setImageBannerTitle(title);
        }
        return page.setRecords(list);
    }
}
