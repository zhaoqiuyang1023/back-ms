package com.back.ms.service;

import com.baomidou.mybatisplus.service.IService;
import com.back.ms.entity.Menu;
import com.back.ms.entity.vo.ShowMenu;
import com.back.ms.entity.vo.ZtreeVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wangl
 * @since 2017-10-31
 */
public interface MenuService extends IService<Menu> {

    List<Menu> findAllMenus();

    List<ZtreeVO> showTreeMenus();

    List<ShowMenu> getShowMenuByUser(Long userId);

    void saveOrUpdateMenu(Menu menu);

    int getCountByPermission(String permission);

    int getCountByName(String name);

}
