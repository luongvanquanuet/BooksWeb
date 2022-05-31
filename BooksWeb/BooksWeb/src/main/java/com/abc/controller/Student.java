package com.abc.controller;
//import lombok.Data;
//@Data genner ra getter, setter
//@AllArgsContructor     hàm khởi tạo tất cả các tham số
public class Student {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
