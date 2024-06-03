package com.ayanami.okoyo.repository;

import com.ayanami.okoyo.entity.Delivery;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryRepository extends JpaRepository<Delivery, Integer> {
}