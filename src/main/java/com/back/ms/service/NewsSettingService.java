package com.back.ms.service;

import com.back.ms.entity.ao.NewsSummaryAO;
import com.back.ms.entity.news.NewsSetting;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 
 *
 * @author Hanping QIAO
 * 2018-11-26 14:39:10
 */
public interface NewsSettingService extends IService<NewsSetting> {


     List<NewsSetting> findEPNewsBanners();
     List<NewsSetting> findEPNewsTypes();


     Page<NewsSetting> findNewsTypeByPage(NewsSummaryAO newsSummaryAO);

    Page<NewsSetting> findNewsImagesByPage(NewsSummaryAO newsSummaryAO);
}

