package cn.itcast.order.service;

import cn.itcast.order.clients.UserClient;
import cn.itcast.order.mapper.OrderMapper;
import cn.itcast.order.pojo.Order;
import cn.itcast.order.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    RestTemplate restTemplate;
//    public Order queryOrderById(Long orderId) {
//        // 1.查询订单
//        Order order = orderMapper.findById(orderId);
//        Long userId = order.getUserId();
//        String url = "http://userservice/user/" +userId;
//        User user = restTemplate.getForObject(url, User.class);
//        // 4.返回
//        order.setUser(user);
//        return order;
//    }
    // 使用feign 调用
    @Autowired
    UserClient userClient;
    public Order queryOrderById(Long orderId) {
        // 1.查询订单
        Order order = orderMapper.findById(orderId);
        Long userId = order.getUserId();
        User user = userClient.findUserbyId(userId);
        System.out.println(user.toString());
        // 4.返回
        order.setUser(user);
        return order;
    }

}
