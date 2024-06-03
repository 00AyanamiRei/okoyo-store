package com.ayanami.okoyo.repository;

import com.ayanami.okoyo.entity.Order;
import com.ayanami.okoyo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    Order findByUser(User user);

    List<Order> findOrdersByUser(User user);

    public Long countById(Integer id);

}
