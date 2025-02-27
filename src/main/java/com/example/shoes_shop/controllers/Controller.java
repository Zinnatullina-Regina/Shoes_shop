package com.example.shoes_shop.controllers;

import com.example.shoes_shop.models.Clients;
import com.example.shoes_shop.models.Shoes;
import com.example.shoes_shop.services.Service;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.concurrent.TimeUnit;

@org.springframework.stereotype.Controller
@RequiredArgsConstructor
public class Controller {
    private final Service service;
    boolean status = false;

    private static Cache<String, String> cache;
    static {
        cache = CacheBuilder.newBuilder()
                .maximumSize(100) // максимальное количество элементов в кэше
                .expireAfterWrite(10, TimeUnit.MINUTES) // время жизни элементов кэша
                .build();
    }

    @GetMapping("/")
    public String first_page(Model model) {
        model.addAttribute("status", true);
        return "first_page";
    }

    @GetMapping("/log")
    public String login(Model model) {
        return "login";
    }

    @GetMapping("/registr")
    public String registration(Model model) {
        return "registration";
    }

    @GetMapping("/adm")
    public String adm(Model model) {
        model.addAttribute("shoes", service.getListShoes());
        model.addAttribute("clients", service.getListClients());
        model.addAttribute("shoes_sizes", service.getListShoes_sizes());
        return "adm";
    }


    @GetMapping("/cart")
    public String cart(Model model, Clients client, HttpServletRequest request) {
        // Использование SESSION
        HttpSession session = request.getSession();
        boolean status_session = (boolean) session.getAttribute("status");

        model.addAttribute("status", status_session);
        model.addAttribute("client", client);
        model.addAttribute("shoes", service.getListShoes());
        model.addAttribute("cart_client", service.getCart_client());

        // Использование CACHE
        service.userRole = cache.getIfPresent("role");
        return "cart";
    }

    @PostMapping("/add_to_cart")
    public void addToMap(int id_shoes, int size) {
        Map<Integer, Integer> temp_map = service.getCart_client();
        temp_map.put(id_shoes, size);
        service.setCart_client(temp_map);
        service.updateCartClient(service.getClientId(), id_shoes, size);
    }


    @GetMapping("/catalog")
    public String catalog(Model model) {
        model.addAttribute("status", status);
        model.addAttribute("shoes", service.getListShoes());
        return "catalog";
    }

    @GetMapping("/{id}")
    public String shoe_sizes(@PathVariable int id, Model model, HttpServletRequest request) {
        model.addAttribute("shoes", service.getShoesById(id));

        // Использование COOKIE
        String role = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if(cookie.getName().equals("role_cookie")) {
                    role = cookie.getValue();
                    break;
                }
            }
        }

        model.addAttribute("shoe_sizes", service.getShoe_sizesById(id));
        model.addAttribute("status", status);
        model.addAttribute("userRole", role);
        return "shoe_sizes";
    }

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("shoes", service.getListShoes());
        return "index";
    }

    @PostMapping("/add_to_client")
    public String add_to_client(Model model, Clients client) {
        boolean isAlreadyExist = service.isClientEmailExist(client);
        if (!isAlreadyExist) {
            client.setRole("user");
            service.saveClient(client);
            model.addAttribute("client", client);
            service.userRole = client.getRole();
            service.clientId = client.getId();
            service.cart_client = client.getCart_client();

        }
        return adm(model);
    }

    @PostMapping("/add_shoes")
    public String add_shoes(Model model,Shoes shoe) {
            shoe.setId(service.getListShoes().size());
            service.addShoes(shoe);
            System.out.println(shoe.getName() + " " + shoe.getUrl());
         return adm(model);
    }

    @PostMapping("/del_shoes")
    public String delete_shoes(Model model, int id) {
        service.removeShoes(id);
        return adm(model);
    }

    @PostMapping("/add_clients")
    public String add_clients(Model model,Clients clients) {
        clients.setId(service.getListClients().size());
        service.addClient(clients);
        return adm(model);
    }

    @PostMapping("/del_clients")
    public String delete_clients(Model model, int id) {
        service.removeClient(id);
        return adm(model);
    }

    @PostMapping("/add_shoes_sizes")
    public String add_shoes_sizes(Model model, int id, int column_size, int add_sizes) {
        service.addShoesSizes(id, column_size, add_sizes);
        return adm(model);
    }

    @PostMapping("/del_shoes_sizes")
    public String del_shoes_sizes(Model model, int id, int column_size) {
        service.removeShoeSizes(id, column_size);
        return adm(model);
    }


    @PostMapping("/login")
    public String login(Model model, Clients client, HttpServletResponse response, HttpServletRequest request) {
        status = service.isUserValid(client);
        if (status) {
            client.setCart_client(service.getCartClientById(client.getId()));
            for (Map.Entry<Integer, Integer> entry : client.getCart_client().entrySet()) {
                int key = entry.getKey();
                Integer value = entry.getValue();
                System.out.println("Key: " + key + ", Value: " + value);
            }
            model.addAttribute("client", client);
            model.addAttribute("status", true);
            service.userRole = client.getRole();

            // Использование SESSION
            HttpSession session = request.getSession();
            session.setAttribute("status", status);

            // Использование CACHE
            cache.put("role", client.getRole());

            // Использование COOKIE
            Cookie clientCookie = new Cookie("role_cookie", client.getRole());
            response.addCookie(clientCookie);

            service.clientId = client.getId();
            service.cart_client = client.getCart_client();
            return catalog(model);
        } else
            return "login";
    }

    @PostMapping("/registration")
    public String registration(Model model, Clients client, HttpServletResponse response, HttpServletRequest request) {
        boolean isAlreadyExist = service.isClientEmailExist(client);
        if (isAlreadyExist) {
            model.addAttribute("isAlreadyExist", true);
            return "registration";
        } else {
            service.saveClient(client);
            client.setRole("user");
            model.addAttribute("client", client);
            model.addAttribute("shoes", service.getListShoes());
            model.addAttribute("status", true);



            // Использование CACHE
            cache.put("role", client.getRole());

            // Использование COOKIE
            Cookie clientCookie = new Cookie("role_cookie", client.getRole());
            response.addCookie(clientCookie);

            // Использование SESSION
            HttpSession session = request.getSession();
            session.setAttribute("status", status);

            service.userRole = client.getRole();
            service.clientId = client.getId();
            service.cart_client = client.getCart_client();
            return catalog(model);
        }
    }
}
