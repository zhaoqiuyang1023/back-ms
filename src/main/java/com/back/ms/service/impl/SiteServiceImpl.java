package com.back.ms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.back.ms.mapper.SiteDao;
import com.back.ms.entity.Site;
import com.back.ms.service.SiteService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wangl
 * @since 2017-12-30
 */
@Service("siteService")
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class SiteServiceImpl extends ServiceImpl<SiteDao, Site> implements SiteService {

    @Cacheable(value = "currentSite",key = "'currentSite'")
    @Override
    public Site getCurrentSite() {
        EntityWrapper<Site> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        return selectOne(wrapper);
    }

    @CacheEvict(value = "currentSite",key = "'currentSite'")
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void updateSite(Site site) {
        baseMapper.updateById(site);
    }


}
