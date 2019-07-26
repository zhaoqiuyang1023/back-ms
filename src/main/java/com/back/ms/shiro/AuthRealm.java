package com.back.ms.shiro;

import com.back.ms.entity.Menu;
import com.back.ms.entity.Role;
import com.back.ms.entity.User;
import com.back.ms.service.UserService;
import com.back.ms.util.AESUtil;
import com.back.ms.util.Constants;
import com.back.ms.util.Encodes;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.LinkedHashSet;
import java.util.Set;

@Component(value = "authRealm")
public class AuthRealm extends AuthorizingRealm {
    @Autowired
    @Lazy
    private UserService userService;

    @Value("${permissions-encryted}")
    private boolean permissionsEncryted = false;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        String key = "user_session::" + MySysUser.getSessionId();
//        ValueOperations<String, String> valueOperations = this.redisTemplate.opsForValue();
//        String text = valueOperations.get(key);
//        JSONObject jsonObject = JSON.parseObject(text);
//        JSONArray permissionArray = jsonObject.getJSONArray("permissions");
//
//        JSONArray roleArray = jsonObject.getJSONArray("roles");
//        Set<String> roles = new LinkedHashSet<>(roleArray.toJavaList(String.class));
//
//        Set<String> permissions;
//        Boolean permissionsEncryted = jsonObject.getBoolean("permissionsEncryted");
//        if (permissionsEncryted != null && permissionsEncryted) {
//            ShiroUser shiroUser = MySysUser.ShiroUser();
//            permissions = new LinkedHashSet<>(permissionArray.size());
//            for (Object p : permissionArray) {
//                permissions.add(AESUtil.decrypt((String) p, shiroUser.getSalt()));
//            }
//        } else {
//            permissions = new LinkedHashSet<>(permissionArray.toJavaList(String.class));
//        }

        SimpleAuthenticationInfo simpleAuthenticationInfo=  (SimpleAuthenticationInfo) principalCollection.getPrimaryPrincipal();
        ShiroUser shiroUser= (ShiroUser) simpleAuthenticationInfo.getPrincipals().getPrimaryPrincipal();
        User user = userService.findUserByLoginName(shiroUser.getLoginName());

        Set<Role> roles = user.getRoleLists();
        Set roleSet = new LinkedHashSet();
        for (Role role : roles) {
            if (StringUtils.isNotBlank(role.getName())) {
                roleSet.add(role.getName());
            }
        }
        Set<Menu> menus = user.getMenus();
        Set menuSet = new LinkedHashSet();
        for (Menu menu : menus) {
            if (StringUtils.isNotBlank(menu.getPermission())) {
                String aesPermission = AESUtil.encrypt(menu.getPermission(), user.getSalt());
                if (permissionsEncryted) {
                    menuSet.add(aesPermission);
                } else {
                    menuSet.add(menu.getPermission());
                }
            }
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roleSet);
        info.setStringPermissions(menuSet);
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
