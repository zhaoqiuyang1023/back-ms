package com.back.ms.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.back.ms.entity.Menu;
import com.back.ms.entity.vo.ShowMenu;

import java.util.List;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2017-10-31
 */

public interface MenuDao extends BaseMapper<Menu> {

    List<Menu> findAllMenus();

    List<ShowMenu> selectShowMenuByUser(Long userId);
}