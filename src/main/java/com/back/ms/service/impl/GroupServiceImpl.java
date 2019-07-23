package com.back.ms.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.back.ms.mapper.GroupDao;
import com.back.ms.entity.Group;
import com.back.ms.service.GroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wangl
 * @since 2017-10-31
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class GroupServiceImpl extends ServiceImpl<GroupDao, Group> implements GroupService {
	
}
