package com.example.shoes_shop.models;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;


@Data
@AllArgsConstructor
public class Shoes {
    private int id;
    private String name;
    private BigDecimal price;
    private String type;
    private String forWho;
    private String url;
    private String info;

    public Shoes(int id, String name, BigDecimal price, String type, String forWho, String url, String info) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.type = type;
        this.forWho = forWho;
        this.url = url;
        this.info = info;
    }
}
