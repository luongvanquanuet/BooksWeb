package com.abc.controller;


import com.google.gson.Gson;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {
    List<Student> students = new ArrayList<>();
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addStudent(@RequestBody Student student){
        students.add(student);
        return "sucess";
    }
    Gson gson = new Gson();
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String listStudents(){
        return gson.toJson(students);

    }

    //api lấy chi tiết sinh viên theo tên
    // tìm kiếm sinh viên theo tuổi
}