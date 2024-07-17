package com.example.calculator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Service; 

@SpringBootApplication
public class CalculatorApplication {
    private static final String constant = "constant"; //*****NEW*****
    public static void main(String[] args) {
        SpringApplication.run(CalculatorApplication.class, args); 
    }


}
