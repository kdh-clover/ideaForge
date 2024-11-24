package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatGPTController {
    
    @GetMapping("/chatgpt")
    public String chatgptIntro() {
        return "chatgpt/intro";
    }


    @GetMapping("/test")
    public String test() {
        return "chatgpt/test";
    } 
} 