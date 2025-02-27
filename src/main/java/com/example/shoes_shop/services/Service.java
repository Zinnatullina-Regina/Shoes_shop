package com.example.shoes_shop.services;

import com.example.shoes_shop.models.Clients;
import com.example.shoes_shop.models.Shoe_sizes;
import com.example.shoes_shop.models.Shoes;
import com.google.common.hash.Hashing;
import lombok.Getter;
import lombok.Setter;

import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.*;

@org.springframework.stereotype.Service
public class Service {
    //Конекшены к бдшкам

    Connection connToShoes;
    Connection connToClients;
    Connection connToShoe_sizes;
    String url = "jdbc:postgresql://[::1]:5432/NewBalance";
    String username = "postgres";
    String password = "123";

    @Getter
    public String userRole = null;

    @Getter
    public int clientId = 0;

    @Getter
    @Setter
    public Map<Integer, Integer> cart_client = null;

    //Строки для SQL-запросов
    String sqlInsert = "INSERT INTO clients(first_name, last_name, email, role, password) VALUES(?,?,?,?,?)";
    String sqlCreate;
    List<Shoes> Shoes = new ArrayList<>() {{
        try {
            connToShoes = DriverManager.getConnection(url, username, password);
            Statement stmtDirection = connToShoes.createStatement();
            ResultSet rsDirection = stmtDirection.executeQuery("SELECT * FROM shoe_models;");

            while (rsDirection.next()) {
                Shoes new_shoes = new Shoes(rsDirection.getInt("id"), rsDirection.getString("name"),
                        rsDirection.getBigDecimal("price"), rsDirection.getString("type"),
                        rsDirection.getString("forWho"), rsDirection.getString("url"),
                        rsDirection.getString("info"));
                add(new_shoes);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }};


    List<Clients> Clients = new ArrayList<>() {{
        try {

            connToClients = DriverManager.getConnection(url, username, password);
            Statement stmtDirection = connToShoes.createStatement();
            ResultSet rsDirection = stmtDirection.executeQuery("SELECT * FROM clients;");

            while (rsDirection.next()) {
                Clients new_client = new Clients(rsDirection.getInt("id"), rsDirection.getString("first_name"),
                        rsDirection.getString("last_name"), rsDirection.getString("email"),
                        rsDirection.getString("role"), rsDirection.getString("password"));

                add(new_client);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }};


    List<Shoe_sizes> Shoe_sizes = new ArrayList<>() {{
        try {

            connToShoe_sizes = DriverManager.getConnection(url, username, password);
            Statement stmtDirection = connToShoe_sizes.createStatement();
            ResultSet rsDirection = stmtDirection.executeQuery("SELECT * FROM shoe_sizes;");

            while (rsDirection.next()) {
                Shoe_sizes Shoe_size = new Shoe_sizes(rsDirection.getInt("model_id"), rsDirection.getInt("size_5"),
                        rsDirection.getInt("size_6"), rsDirection.getInt("size_7"),
                        rsDirection.getInt("size_8"), rsDirection.getInt("size_9"),
                        rsDirection.getInt("size_10"), rsDirection.getInt("size_11"),
                        rsDirection.getInt("size_12"), rsDirection.getInt("size_13"),
                        rsDirection.getInt("size_14"), rsDirection.getInt("size_15"));

                add(Shoe_size);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }};

    public List<Shoes> getListShoes() {
        return Shoes;
    }

    public List<Shoe_sizes> getListShoes_sizes() {
        return Shoe_sizes;
    }

    public Shoe_sizes getShoe_sizesById(int id) {
        return Shoe_sizes.get(id);
    }

    public Shoes getShoesById(int id) {
        return Shoes.get(id);
    }


    public List<Clients> getListClients() {
        return Clients;
    }

    public void saveClient(Clients client) {

        try {
            client.setCart_client(new HashMap<>());
            client.setRole("user");
            Clients.add(client);
            System.out.println("name = " + client.getFirst_name() + " " + client.getLast_name());
            System.out.println("email = " + client.getEmail());
            System.out.println("role = " + client.getRole());
            System.out.println("password = " + client.getPassword());
            PreparedStatement pstmt = connToClients.prepareStatement(sqlInsert);
            pstmt.setString(1, client.getFirst_name());
            pstmt.setString(2, client.getLast_name());
            pstmt.setString(3, client.getEmail());
            pstmt.setString(4, client.getRole());
            pstmt.setString(5, Hashing.sha256()
                    .hashString(client.getPassword(), StandardCharsets.UTF_8)
                    .toString());

            pstmt.executeUpdate();
            pstmt.close();

            sqlCreate = "CREATE TABLE IF NOT EXISTS cart_client" + client.getId() + " (ID_Shoes int, Count int);";

            Statement stmt = connToClients.createStatement();
            stmt.execute(sqlCreate);
            stmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isUserValid(Clients user) {
        boolean status = false;

        // SHA-256 encryption
        user.setPassword(Hashing.sha256()
                .hashString(user.getPassword(), StandardCharsets.UTF_8)
                .toString());

        try {
            connToClients = DriverManager.getConnection(url, username, password);
            Statement stmtUsers = connToClients.createStatement();
            ResultSet rsUsers = stmtUsers.executeQuery("SELECT * FROM Clients");
            while (rsUsers.next()) {
                if (rsUsers.getString("email").equals(user.getEmail()) &&
                        rsUsers.getString("password").equals(user.getPassword())) {
                    user.setRole(rsUsers.getString("role"));
                    // Успешный вход = true
                    status = true;
                    break;
                }
            }

            stmtUsers.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return status;
    }

    public void updateCartClient(int id, int id_shoes, int size) {
        try {
            PreparedStatement pstmt = connToClients.prepareStatement("INSERT INTO cart_client" + id + "(ID_Shoes, Count) VALUES(?,?)");
            pstmt.setInt(1, id_shoes);
            pstmt.setInt(2, size);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeShoes(int shoes_id) {
        Shoes.removeIf(shoes -> shoes.getId() == shoes_id);

        try {
            PreparedStatement pstmt = connToShoes.prepareStatement("DELETE FROM shoe_models WHERE id = ?");
            pstmt.setInt(1, shoes_id);
            pstmt.executeUpdate();

            pstmt = connToClients.prepareStatement("DELETE FROM shoe_sizes WHERE id = ?");
            pstmt.setInt(1, shoes_id);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addShoes(Shoes shoes) {
        Shoes.add(shoes);
        try {
            PreparedStatement pstmt = connToShoes.prepareStatement("INSERT INTO shoe_models (name, price, type, forwho, url, info) VALUES(?,?,?,?,?,?)");
            pstmt.setString(1, shoes.getName());
            pstmt.setBigDecimal(2, shoes.getPrice());
            pstmt.setString(3, shoes.getType());
            pstmt.setString(4, shoes.getForWho());
            pstmt.setString(5, shoes.getUrl());
            pstmt.setString(6, shoes.getInfo());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeClient(int id) {
        Clients.removeIf(client -> client.getId() == id);

        try {
            PreparedStatement pstmt = connToClients.prepareStatement("DELETE FROM Clients WHERE id = ?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            pstmt.close();

            pstmt = connToClients.prepareStatement("DROP TABLE client_cart" + id);
            pstmt.executeUpdate();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addClient(Clients client) {
        Clients.add(client);
        try {
            PreparedStatement pstmt = connToClients.prepareStatement("INSERT INTO Clients (first_name, last_name, email, role, password) VALUES(?,?,?,?,?)");
            pstmt.setString(1, client.getFirst_name());
            pstmt.setString(2, client.getLast_name());
            pstmt.setString(3, client.getEmail());
            pstmt.setString(4, client.getRole());
            pstmt.setString(5, Hashing.sha256()
                    .hashString(client.getPassword(), StandardCharsets.UTF_8)
                    .toString());
            pstmt.executeUpdate();

            sqlCreate = "CREATE TABLE IF NOT EXISTS cart_client" + client.getId() + " (ID_Shoes int, Count int);";

            Statement stmt = connToClients.createStatement();
            stmt.execute(sqlCreate);
            stmt.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addShoesSizes(int id, int column_size, int add_sizes) {
        Shoe_sizes new_shoe = null;
        int id_in_list = -1;
        for (Shoe_sizes shoesSize : Shoe_sizes) {
            if (shoesSize.getId() == id) {
                new_shoe = shoesSize; // Найден объект с нужным id, сохраняем его в переменной new_shoes
                id_in_list = Shoe_sizes.indexOf(new_shoe);
                break; // Прерываем цикл, так как объект уже найден
            }
        }

        if (new_shoe != null) {
            switch (column_size) {
                case 5:
                    new_shoe.setSize_5(new_shoe.getSize_5() + add_sizes);
                    break;
                case 6:
                    new_shoe.setSize_6(new_shoe.getSize_6() + add_sizes);
                    break;
                case 7:
                    new_shoe.setSize_7(new_shoe.getSize_7() + add_sizes);
                    break;
                case 8:
                    new_shoe.setSize_8(new_shoe.getSize_8() + add_sizes);
                    break;
                case 9:
                    new_shoe.setSize_9(new_shoe.getSize_9() + add_sizes);
                    break;
                case 10:
                    new_shoe.setSize_10(new_shoe.getSize_10() + add_sizes);
                    break;
                case 11:
                    new_shoe.setSize_11(new_shoe.getSize_11() + add_sizes);
                    break;
                case 12:
                    new_shoe.setSize_12(new_shoe.getSize_12() + add_sizes);
                    break;
                case 13:
                    new_shoe.setSize_13(new_shoe.getSize_13() + add_sizes);
                    break;
                case 14:
                    new_shoe.setSize_14(new_shoe.getSize_14() + add_sizes);
                    break;
                case 15:
                    new_shoe.setSize_15(new_shoe.getSize_15() + add_sizes);
                    break;
                default:
                    System.out.println("Size-switch error");
            }
        }

        Shoe_sizes.set(id_in_list, new_shoe);

        updateSizes(new_shoe, id);
    }

    public void removeShoeSizes(int id, int column_size) {
        Shoe_sizes new_shoe = null;
        int id_in_list = -1;
        for (Shoe_sizes shoesSize : Shoe_sizes) {
            if (shoesSize.getId() == id) {
                new_shoe = shoesSize; // Найден объект с нужным id, сохраняем его в переменной new_shoes
                id_in_list = Shoe_sizes.indexOf(new_shoe);
                break; // Прерываем цикл, так как объект уже найден
            }
        }

        if (new_shoe != null) {
            switch (column_size) {
                case 5:
                    new_shoe.setSize_5(0);
                    break;
                case 6:
                    new_shoe.setSize_6(0);
                    break;
                case 7:
                    new_shoe.setSize_7(0);
                    break;
                case 8:
                    new_shoe.setSize_8(0);
                    break;
                case 9:
                    new_shoe.setSize_9(0);
                    break;
                case 10:
                    new_shoe.setSize_10(0);
                    break;
                case 11:
                    new_shoe.setSize_11(0);
                    break;
                case 12:
                    new_shoe.setSize_12(0);
                    break;
                case 13:
                    new_shoe.setSize_13(0);
                    break;
                case 14:
                    new_shoe.setSize_14(0);
                    break;
                case 15:
                    new_shoe.setSize_15(0);
                    break;
                default:
                    System.out.println("Size-switch error");
            }
        }

        // Теперь можно обновить элемент списка Shoe_sizes
        Shoe_sizes.set(id_in_list, new_shoe);

        updateSizes(new_shoe, id);
    }

    public void updateSizes(Shoe_sizes new_shoe, int id) {
        try {
            // Подготовка запроса на обновление данных обуви в базе данных
            PreparedStatement pstmt = connToShoe_sizes.prepareStatement(
                    "UPDATE shoe_sizes SET size_5 = ?, size_6 = ?, size_7 = ?, size_8 = ?, size_9 = ?, " +
                            "size_10 = ?, size_11 = ?, size_12 = ?, size_13 = ?, size_14 = ?, size_15 = ? WHERE id = ?"
            );

            // Установка параметров для обновления
            pstmt.setInt(1, new_shoe.getSize_5());
            pstmt.setInt(2, new_shoe.getSize_6());
            pstmt.setInt(3, new_shoe.getSize_7());
            pstmt.setInt(4, new_shoe.getSize_8());
            pstmt.setInt(5, new_shoe.getSize_9());
            pstmt.setInt(6, new_shoe.getSize_10());
            pstmt.setInt(7, new_shoe.getSize_11());
            pstmt.setInt(8, new_shoe.getSize_12());
            pstmt.setInt(9, new_shoe.getSize_13());
            pstmt.setInt(10, new_shoe.getSize_14());
            pstmt.setInt(11, new_shoe.getSize_15());
            pstmt.setInt(12, id); // Указываем id объекта, который нужно обновить

            // Выполнение запроса на обновление
            pstmt.executeUpdate();

            // Закрытие ресурсов
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isClientEmailExist(Clients user) {
        boolean status = false;

        try {
            connToClients = DriverManager.getConnection(url, username, password);
            Statement stmtUsers = connToClients.createStatement();
            ResultSet rsUsers = stmtUsers.executeQuery("SELECT * FROM Clients");
            while (rsUsers.next()) {
                if (rsUsers.getString("email").equals(user.getEmail())) {
                    user.setRole(rsUsers.getString("role"));
                    status = true;
                    break;
                }
            }

            stmtUsers.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return status;
    }

    public Map<Integer, Integer> getCartClientById(int id) {
        Map<Integer, Integer> cartClients = new HashMap<>();
        try {
            connToClients = DriverManager.getConnection(url, username, password);
            Statement stmtUsers = connToClients.createStatement();
            ResultSet rsUsers = stmtUsers.executeQuery("SELECT * FROM cart_client" + id);
            while (rsUsers.next()) {
                cartClients.put(rsUsers.getInt("ID_Shoes"), rsUsers.getInt("Count"));
            }

            return cartClients;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
