package com.back.ms;

import com.back.ms.entity.User;
import com.back.ms.service.ReportService;
import com.back.ms.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.http.HttpServletRequest;

/*
 *
 * */

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdMsApplicationTests {


    @Autowired
    private ReportService reportService;


    @Autowired
    private UserService userService;


    @Autowired
    StringRedisTemplate redisTemplate;

    @Autowired
    private HttpServletRequest request;

    @Test
    public void user() {
       User user= userService.findUserById(new Long(1));
    }


    @Test
    public void as() {
        String jsessionid = request.getSession().getId();
        System.out.println(jsessionid);
        String json = redisTemplate.opsForValue().get("user_session::" + jsessionid);
        System.out.println(json);
    }

}

