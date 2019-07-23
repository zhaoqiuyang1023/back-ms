package com.back.ms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.back.ms.mapper.UserDao;
import com.back.ms.entity.Role;
import com.back.ms.entity.User;
import com.back.ms.service.UserService;
import com.back.ms.util.ToolUtil;
import com.google.common.collect.Maps;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Set;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2017-10-31
 */
@Service("userService")
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {

    /* 这里caching不能添加put 因为添加了总会执行该方法
     * @see com.back.ms.service.UserService#findUserByLoginName(java.lang.String)
     */
    @Cacheable(value = "user", key = "'user_name_'+#name", unless = "#result == null")
    @Override
    public User findUserByLoginName(String name) {
        Map<String, Object> map = Maps.newHashMap();
        map.put("loginName", name);
        User u = baseMapper.selectUserByMap(map);
        return u;
    }

    @Cacheable(value = "user", key = "'user_id_'+T(String).valueOf(#id)", unless = "#result == null")
    @Override
    public User findUserById(Long id) {
        Map<String, Object> map = Maps.newHashMap();
        map.put("id", id);
        return baseMapper.selectUserByMap(map);
    }

    @Override
    @Caching(put = {
            @CachePut(value = "user", key = "'user_id_'+T(String).valueOf(#result.id)", condition = "#result.id != null and #result.id != 0"),
            @CachePut(value = "user", key = "'user_name_'+#user.loginName", condition = "#user.loginName !=null and #user.loginName != ''")
    })
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public User saveUser(User user) {
        ToolUtil.entryptPassword(user);
        user.setLocked(false);
        baseMapper.insert(user);
        //保存用户角色关系
        this.saveUserRoles(user.getId(), user.getRoleLists());
        return selectById(user.getId());
    }

    @Override
    @Caching(evict = {
            @CacheEvict(value = "user", key = "'user_id_'+T(String).valueOf(#user.id)", condition = "#user.id != null and #user.id != 0"),
            @CacheEvict(value = "user", key = "'user_name_'+#user.loginName", condition = "#user.loginName !=null and #user.loginName != ''")
    })
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public User updateUser(User user) {
        baseMapper.updateById(user);
        //先解除用户跟角色的关系
        this.dropUserRolesByUserId(user.getId());
        this.saveUserRoles(user.getId(), user.getRoleLists());
        return user;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void saveUserRoles(Long id, Set<Role> roleSet) {
        baseMapper.saveUserRoles(id, roleSet);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public void dropUserRolesByUserId(Long id) {
        baseMapper.dropUserRolesByUserId(id);
    }

    @Override
    public int userCount(String param) {
        EntityWrapper<User> wrapper = new EntityWrapper<>();
        wrapper.eq("login_name", param).or().eq("email", param).or().eq("tel", param);
        int count = baseMapper.selectCount(wrapper);
        return count;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    @Caching(evict = {
            @CacheEvict(value = "user", key = "'user_id_'+T(String).valueOf(#user.id)", condition = "#user.id != null and #user.id != 0"),
            @CacheEvict(value = "user", key = "'user_name_'+#user.loginName", condition = "#user.loginName !=null and #user.loginName != ''")
    })
    public void deleteUser(User user) {
        user.setDelFlag(true);
        user.updateById();
    }

}
