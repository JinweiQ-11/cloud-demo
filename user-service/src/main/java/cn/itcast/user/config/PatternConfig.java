package cn.itcast.user.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySources;
import org.springframework.stereotype.Component;

/**
 * @author ：qinjinwei
 * @date ：Created in 2022/5/8 23:15
 * @description：
 * @modified By：
 * @version: $
 */
@Data
@Component
@ConfigurationProperties(prefix = "pattern")
public class PatternConfig {
    private String dateformat;
}
