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

    @GetMapping("/test2")
    public String test2() {
        return "chatgpt/test2";
    }

    @GetMapping("/test3")
    public String test3() {
        return "chatgpt/test3";
    }

    @GetMapping("/test4")
    public String test4() {
        return "chatgpt/test4";  
    }
} 