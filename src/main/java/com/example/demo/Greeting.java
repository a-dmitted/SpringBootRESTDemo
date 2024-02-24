package com.example.demo;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Greeting {
    private final static String APPLICATION_PROPERTIES = "application.properties";
    private final static String VERSION_PROPERTY = "version";
    private static final String version = readVersion();
    private final String content;

    public Greeting(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getVersion() {
        return version;
    }

    private static String readVersion() {
        Properties prop = new Properties();
        String version = "unknown";

        try (InputStream input = Greeting.class.getClassLoader().getResourceAsStream(APPLICATION_PROPERTIES)) {
            if (input == null) {
                System.out.printf("Sorry, unable to find %d%n", APPLICATION_PROPERTIES);
                return version;
            }

            // Load the properties file
            prop.load(input);

            // Get the property value
            version = prop.getProperty(VERSION_PROPERTY);
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return version;
    }
}