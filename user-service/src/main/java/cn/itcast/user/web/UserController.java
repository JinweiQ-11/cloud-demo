package cn.itcast.user.web;

import cn.itcast.user.config.PatternConfig;
import cn.itcast.user.pojo.User;
import cn.itcast.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Slf4j
@RestController
@RefreshScope
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

//    @Value("${pattern.dateformat}")
//    private String dateformat;
    @Autowired
    private PatternConfig patternConfig;

    /**
     * 路径： /user/110
     *
     * @param id 用户id
     * @return 用户
     */
    @GetMapping("/{id}")
    public User queryById(@PathVariable("id") Long id, @RequestHeader(value = "Truth",required = true) String auth) {
//        String data = LocalDate.now().format(
//                DateTimeFormatter.ofPattern(patternConfig.getDateformat(), Locale.CHINA));
        System.out.println(auth);
        return userService.queryById(id);
    }
}
