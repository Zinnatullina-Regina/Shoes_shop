package com.example.shoes_shop.models;

import lombok.*;

import java.util.Map;

@Data
@Setter
@Getter
public class Clients {
    private int id;
    private String first_name;
    private String last_name;
    private String email;
    private String role;
    private String password;
    private Map<Integer, Integer> cart_client;

    public Clients() {}

    public Clients(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Clients(int id, String first_name, String last_name, String email, String role, String password) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.role = role;
        this.password = password;
    }

}
