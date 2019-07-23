package com.back.ms.base;

import com.alibaba.fastjson.JSON;
import com.back.ms.shiro.ShiroUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;

@Slf4j
public class MySysUser {
    /**
     * 取出Shiro中的当前用户LoginName.
     */
    public static String icon() {
        return ShiroUser().getIcon();
    }

    public static Long id() {
        return ShiroUser().getId();
    }

    public static String loginName() {
        return ShiroUser().getLoginName();
    }

    public static String nickName() {
        return ShiroUser().getNickName();
    }

    public static ShiroUser ShiroUser() {
        try {
            ShiroUser user;
            Object principal = SecurityUtils.getSubject().getPrincipal();
            if (principal == null) return null;
            if (principal instanceof ShiroUser) {
                user = (ShiroUser) principal;
            } else {
                user = JSON.parseObject(JSON.toJSON(principal).toString(), ShiroUser.class);
            }
            return user;
        } catch (Exception e) {
            log.error("failed to get shiroUser info");
            e.printStackTrace();
        }

        return null;
    }

    public static String getSessionId() {
        String sessionId = SecurityUtils.getSubject().getSession().getId().toString();
        return sessionId;
    }
}
