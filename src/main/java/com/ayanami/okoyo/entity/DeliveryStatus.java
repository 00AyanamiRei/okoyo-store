package com.ayanami.okoyo.entity;

public enum DeliveryStatus {
    Processing("В процесі обробки"),
    Sent("Відправлено"),
    Canceled("Скасовано"),
    Delivered("Доставлено");

    private final String description;

    DeliveryStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
