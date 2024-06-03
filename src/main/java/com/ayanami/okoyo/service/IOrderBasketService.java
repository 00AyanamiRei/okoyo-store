package com.ayanami.okoyo.service;

import com.ayanami.okoyo.entity.OrderBasket;
import com.ayanami.okoyo.entity.User;

import java.util.List;

public interface IOrderBasketService {
    List<OrderBasket> getAllOrderBaskets();

    public List<OrderBasket> listOrderBasket(User user);

    public Integer addProduct(Integer productId, Integer quantity, User user);

    public float updateQuantity(Integer productId, Integer quantity, User user);

    public void removeProduct(Integer productId, User user);
}
