package com.ayanami.okoyo.service;

import com.ayanami.okoyo.exception.OrderNotFoundException;
import com.ayanami.okoyo.entity.Order;
import com.ayanami.okoyo.entity.OrderBasket;
import com.ayanami.okoyo.entity.User;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IOrdersService {
    public List<Order> getAllOrders();

    List<Order> getAllOrdersByUser(User user);

    public void saveOrder(Order orders);

    public Order getOrder(int id);

    public Order getOrderByUser(User user) throws OrderNotFoundException;

    float countSum(List<OrderBasket> orderBaskets);

    public void deleteOrder(int id) throws OrderNotFoundException;


    Page<Order> listByPage(int pageNum);
}
