package com.example.shoes_shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
//		System.out.println(Hashing.sha256()
//				.hashString("password5", StandardCharsets.UTF_8)
//				.toString());
		SpringApplication.run(Application.class, args);
	}

}
