package com.example.demo;

public class Greeting {

    private final String content;

    public Greeting(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getVersion() {
        return "3.24.1";
    }
}