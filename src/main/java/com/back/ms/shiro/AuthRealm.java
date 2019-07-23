package com.back.ms.shiro;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.back.ms.base.MySysUser;
import com.back.ms.entity.User;
import com.back.ms.service.UserService;
import com.back.ms.util.AESUtil;
import com.back.ms.util.Constants;
import com.back.ms.util.Encodes;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.LinkedHashSet;
import java.util.Set;

@Component(value = "authRealm")
public class AuthRealm extends AuthorizingRealm {
    @Autowired
    @Lazy
    private UserService userService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String key = "user_session::" + MySysUser.getSessionId();
        ValueOperations<String, String> valueOperations = this.redisTemplate.opsForValue();
        String text = valueOperations.get(key);
        JSONObject jsonObject = JSON.parseObject(text);
        JSONArray permissionArray = jsonObject.getJSONArray("permissions");

        JSONArray roleArray = jsonObject.getJSONArray("roles");
        Set<String> roles = new LinkedHashSet<>(roleArray.toJavaList(String.class));

        Set<String> permissions;
        Boolean permissionsEncryted = jsonObject.getBoolean("permissionsEncryted");
        if (permissionsEncryted != null && permissionsEncryted) {
            ShiroUser shiroUser = MySysUser.ShiroUser();
            permissions = new LinkedHashSet<>(permissionArray.size());
            for (Object p : permissionArray) {
                permissions.add(AESUtil.decrypt((String) p, shiroUser.getSalt()));
            }
        } else {
            permissions = new LinkedHashSet<>(permissionArray.toJavaList(String.class));
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        info.setStringPermissions(permissions);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        String username = (String) token.getPrincipal();
        User user = userService.findUserByLoginName(username);
        if (user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        if (Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }
        byte[] salt = Encodes.decodeHex(user.getSalt());
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                new ShiroUser(user.getId(), user.getLoginName(), user.getNickName(), user.getIcon(), user.getSalt()),
                user.getPassword(), //密码
                ByteSource.Util.bytes(salt),
                getName()  //realm name
        );
        return authenticationInfo;
    }

    public void removeUserAuthorizationInfoCache(String username) {
        SimplePrincipalCollection pc = new SimplePrincipalCollection();
        pc.add(username, super.getName());
        super.clearCachedAuthorizationInfo(pc);
    }

    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(Constants.HASH_ALGORITHM);
        matcher.setHashIterations(Constants.HASH_INTERATIONS);
        setCredentialsMatcher(matcher);
    }

}
