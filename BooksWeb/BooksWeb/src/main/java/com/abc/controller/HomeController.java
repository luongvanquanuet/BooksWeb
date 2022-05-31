package com.abc.controller;

import com.abc.dto.Register;
import com.abc.dto.Response;
import com.abc.dto.UserDto;
import com.abc.entities.User;
import com.abc.service.EmailService;
import com.abc.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

@Controller // Đánh dấu 1 class để giao tiếp với phương thức http
//Khác với @RestController=@Controller+@ResponseBody
//@RestController
//@ResponseBody //có thêm cụm từ này thì nó sẽ tương đương với @RestController

public class HomeController {
    // là đia chỉ đường link

    @RequestMapping("login")
    public String abc(Model model){
        // bước 1: Người dùng request đến địa chỉ home
        //Bước 2: Server nhận request từ controller
        //Bước 3: Server sẽ đi tìm file view chứa nội dung để cho người dùng
        //Bước 4: Load file và render nội dung trả về cho người dùng
       /* model.addAttribute("login",login);*/
        //model.addAttribute("name",name);

        return "login";
    }
    @Autowired
    UserServiceImpl userService;
    @Autowired
    EmailService emailService;
    @RequestMapping("/register")
    public String register(Model model){
        return "register";
    }
    @RequestMapping(value = "register", method = RequestMethod.POST,
            produces="application/json")
    @ResponseBody
    public Response registerUser(@RequestBody Register register){
        //lưu vào cơ sở dữ liệu
        if(!register.getEmail().contains("@")){
            return  new Response(2,"sai định dạng email");
        }
        if(!register.getPassword().equals(register.getRepassword()))
            return  new Response(2,"Mật khẩu không trùng khớp");// mã lỗi 2 : báo lỗi

        try{
            User u =  userService.createUser(register.getEmail(),register.getPassword());
            String body = "Click vào link bên dưới để kích khoạt tài khoản\n" +
                    "http://localhost:8080/active?path=" + u.getPath()+"\n" + "Mật khẩu là: " + register.getPassword();
            emailService.sentMail(register.getEmail(),"XÁC THỰC TÀI KHOẢN", body);
            return new Response(1,"Kiểm tra hòm thư "+ register.getEmail()+ "của bạn để kích hoạt");
        }
        catch (Exception e){
            if(e instanceof DataIntegrityViolationException){
                return new Response(1,"Kiểm tra lại email đã tồn tại");
            }
            e.printStackTrace();
        }
        return new Response(1,register);
    }
    @RequestMapping("/active")
    public String active(@RequestParam String path, Model model){
        User u = userService.activeUser(path);
        if(u!=null){
            model.addAttribute("message", "Kích hoạt thành công");
        }
        else {
            model.addAttribute("message", "Kích hoạt thất bại");
        }
        return "login";
    }
}