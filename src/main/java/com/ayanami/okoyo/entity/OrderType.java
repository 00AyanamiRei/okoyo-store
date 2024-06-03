package com.ayanami.okoyo.entity;

public enum OrderType {
    Paid("Оплачено"),
    Canceled("Скасовано"),
    Waiting("Очікування"),
    Processing("Обробка"),
    Completed("Виконано");

    private final String description;

    OrderType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}