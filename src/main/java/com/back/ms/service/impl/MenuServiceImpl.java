package com.back.ms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.back.ms.mapper.MenuDao;
import com.back.ms.entity.Menu;
import com.back.ms.entity.vo.ShowMenu;
import com.back.ms.entity.vo.ZtreeVO;
import com.back.ms.service.MenuService;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2017-10-31
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class MenuServiceImpl extends ServiceImpl<MenuDao, Menu> implements MenuService {

    //todo @Cacheable(value = "allMenus",key = "'allMenus_isShow_'+#map['isShow'].toString()",unless = "#result == null or #result.size() == 0")
    @Override
    public List<Menu> findAllMenus() {
        List<Menu> menus = baseMapper.findAllMenus();
        Map<Long, Menu> menuMap = new HashMap(menus.size());
        for (Menu menu : menus) {
            menuMap.put(menu.getId(), menu);
        }
        List<Menu> rootMenus = new ArrayList<>();
        for (Menu menu : menus) {
            Menu parent = menuMap.get(menu.getParentId());
            if (parent != null) {
                List<Menu> children = parent.getChildren();
                if (children == null) {
                    children = new ArrayList<>();
                    parent.setChildren(children);
                }
                children.add(menu);
            } else {
                rootMenus.add(menu);
            }
        }

        return rootMenus;
    }

    // todo   @Caching(evict = {
//            @CacheEvict(value = "allMenus",allEntries = true),
//            @CacheEvict(value = "user",allEntries = true)
//    })
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateMenu(Menu menu) {
        insertOrUpdate(menu);
    }

    @Override
    public int getCountByPermission(String permission) {
        EntityWrapper<Menu> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag", false);
        wrapper.eq("permission", permission);
        return baseMapper.selectCount(wrapper);
    }

    @Override
    public int getCountByName(String name) {
        EntityWrapper<Menu> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag", false);
        wrapper.eq("name", name);
        return baseMapper.selectCount(wrapper);
    }

    @Override
    public List<ZtreeVO> showTreeMenus() {
        EntityWrapper<Menu> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag", false);
        wrapper.eq("is_show", true);
        wrapper.orderBy("sort", false);
        List<Menu> totalMenus = baseMapper.selectList(wrapper);
        List<ZtreeVO> ztreeVOs = Lists.newArrayList();
        return getZTree(null, totalMenus, ztreeVOs);
    }

    //todo @Cacheable(value = "allMenus", key = "'user_menu_'+T(Long).valueOf(#userId)", unless = "#result == null or #result.size() == 0")
    @Override
    public List<ShowMenu> getShowMenuByUser(Long userId) {
        List<ShowMenu> showMenus = baseMapper.selectShowMenuByUser(userId);
        Map<Long, ShowMenu> showMenuMap = new HashMap(showMenus.size());
        for (ShowMenu menu : showMenus) {
            showMenuMap.put(menu.getId(), menu);
        }
        List<ShowMenu> rootMenus = new ArrayList<>();
        for (ShowMenu menu : showMenus) {
            ShowMenu parent = showMenuMap.get(menu.getPid());
            if (parent != null) {
                List<ShowMenu> children = parent.getChildren();
                if (children == null) {
                    children = new ArrayList<>();
                    parent.setChildren(children);
                }
                children.add(menu);
            } else {
                rootMenus.add(menu);
            }
        }
        return rootMenus;
    }

    /**
     * 递归拉取菜单树的数据
     */
    private List<ZtreeVO> getZTree(ZtreeVO tree, List<Menu> total, List<ZtreeVO> result) {
        Long pid = tree == null ? null : tree.getId();
        List<ZtreeVO> childList = Lists.newArrayList();
        for (Menu m : total) {
            if (pid == m.getParentId()) {
                ZtreeVO ztreeVO = new ZtreeVO();
                ztreeVO.setId(m.getId());
                ztreeVO.setName(m.getName());
                ztreeVO.setPid(pid);
                childList.add(ztreeVO);
                getZTree(ztreeVO, total, result);
            }
        }
        if (tree != null) {
            tree.setChildren(childList);
        } else {
            result = childList;
        }
        return result;
    }

}
