package com.back.ms.controller;

import com.back.ms.annotation.SysLog;
import com.back.ms.base.MySysUser;
import com.back.ms.entity.Menu;
import com.back.ms.entity.Role;
import com.back.ms.entity.User;
import com.back.ms.service.*;
import com.back.ms.shiro.ShiroUser;
import com.back.ms.util.AESUtil;
import com.back.ms.util.Constants;
import com.back.ms.util.RestResponse;
import com.back.ms.util.VerifyCodeUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.PushBuilder;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

@Controller
@Slf4j
public class LoginController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    public static final int SESSION_EXPIRE_HOURS = 4;


    @Value("${ignore-login-code}")
    private boolean ignoreLoginCode = false;
    @Value("${permissions-encryted}")
    private boolean permissionsEncryted = false;

    @Autowired
    protected UserService userService;

    @Autowired
    protected MenuService menuService;

    @Autowired
    protected RoleService roleService;


    @Autowired
    protected RescourceService rescourceService;

    @Autowired
    protected TableService tableService;

    @Autowired
    protected SiteService siteService;

    @Autowired
    protected LogService logService;

    @Autowired
    protected UploadInfoService uploadInfoService;


    @GetMapping("login")
    public String login(HttpServletRequest request) {

        LOGGER.info("跳到这边的路径为:" + request.getRequestURI());
        Subject s = SecurityUtils.getSubject();
        LOGGER.info("是否记住登录--->" + s.isRemembered() + "<-----是否有权限登录----->" + s.isAuthenticated() + "<----");
        if (s.isAuthenticated()) {
            return "redirect:index";
        } else {
            return "login";
        }
    }

    @PostMapping("login/main")
    @ResponseBody
    @SysLog("用户登录")
    public RestResponse loginMain(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        String code = request.getParameter("code");
        System.out.println(code);
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return RestResponse.failure("用户名或者密码不能为空");
        }
        if (StringUtils.isBlank(rememberMe)) {
            return RestResponse.failure("记住我不能为空");
        }
        if (!ignoreLoginCode && StringUtils.isBlank(code)) {
            return RestResponse.failure("验证码不能为空");
        }
        Map<String, Object> map = Maps.newHashMap();
        String error = null;
        HttpSession session = request.getSession();
        if (session == null) {
            return RestResponse.failure("session超时");
        }
        String trueCode = (String) session.getAttribute(Constants.VALIDATE_CODE);
        LOGGER.info(trueCode);
        if (StringUtils.isBlank(trueCode)) {
            return RestResponse.failure("验证码超时");
        }

        if (!ignoreLoginCode && !trueCode.toLowerCase().equals(code.toLowerCase())) {
            error = "验证码错误";
        } else {
            /*就是代表当前的用户。*/
            Subject user = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password, Boolean.valueOf(rememberMe));
            try {
                user.login(token);
                if (user.isAuthenticated()) {
                    map.put("url", "index");
                }
            } catch (IncorrectCredentialsException e) {
                error = "登录密码错误.";
            } catch (ExcessiveAttemptsException e) {
                error = "登录失败次数过多";
            } catch (LockedAccountException e) {
                error = "帐号已被锁定.";
            } catch (DisabledAccountException e) {
                error = "帐号已被禁用.";
            } catch (ExpiredCredentialsException e) {
                error = "帐号已过期.";
            } catch (UnknownAccountException e) {
                error = "帐号不存在";
            } catch (UnauthorizedException e) {
                error = "您没有得到相应的授权！";
            }
        }
        if (StringUtils.isBlank(error)) {
            //登录成功，缓存权限数据
            String sessionId = SecurityUtils.getSubject().getSession().getId().toString();
            cacheRolePermission(username, sessionId);
            return RestResponse.success("登录成功").setData(map);
        } else {
            return RestResponse.failure(error);
        }
    }

    /**
     * 登录成功后缓存用户的角色权限到redis，shiro只从缓存读取角色权限
     *
     * @param loginName
     */
    public void cacheRolePermission(String loginName, String sessionId) {
        User user = userService.findUserByLoginName(loginName);

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
    }

    @GetMapping("index")
    public String showView(Model model,HttpServletRequest request) {
        String sessionId=request.getSession().getId();
        ShiroUser currentUser = MySysUser.ShiroUser();
        log.info("123123",currentUser);
        System.out.println(currentUser.icon);
        model.addAttribute("currentUser",currentUser);
        return "index";
    }


    /**
     * 获取验证码图片和文本(验证码文本会保存在HttpSession中)
     */
    @GetMapping("/genCaptcha")
    public void genCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_ALL_MIXED, 4, null);
        //将验证码放到HttpSession里面
        request.getSession().setAttribute(Constants.VALIDATE_CODE, verifyCode);
        LOGGER.info("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
        //设置输出的内容的类型为JPEG图像
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 116, 36, 5, true, new Color(249, 205, 173), null, null);
        //写给浏览器
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @GetMapping("main")
    public String main(Model model) {
        User user = userService.findUserById(MySysUser.id());
        Set<Menu> menus = user.getMenus();
        java.util.List<Menu> showMenus = Lists.newArrayList();
        if (menus != null && menus.size() > 0) {
            for (Menu menu : menus) {
                if (StringUtils.isNotBlank(menu.getHref()) && menu.getIsShow()
                        && StringUtils.isNotBlank(menu.getIcon())) {
                    showMenus.add(menu);
                }
            }
        }
        showMenus.sort(new Comparator<Menu>() {
            @Override
            public int compare(Menu o1, Menu o2) {
                if (o1.getSort() < o2.getSort()) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });


        model.addAttribute("userMenu", showMenus);
        return "main";
    }

    /**
     * 空地址请求
     *
     * @return
     */
    @GetMapping(value = "")
    public String index() {
        LOGGER.info("这事空地址在请求路径");
        Subject s = SecurityUtils.getSubject();
        return s.isAuthenticated() ? "redirect:index" : "login";
    }

    @GetMapping("systemLogout")
    @SysLog("退出系统")
    public String logOut() {
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }

    @GetMapping("push")
    @ResponseBody
    public String logOut(HttpServletRequest request) {
        PushBuilder pushBuilder = request.newPushBuilder();
        System.out.println(pushBuilder);
        if (pushBuilder != null) {
            pushBuilder.path("resources/static/images/bg1.jpg").push();
            pushBuilder.path("resources/static/images/bg2.png").push();
            System.out.println("123");
        }
        return "123";
    }
}


