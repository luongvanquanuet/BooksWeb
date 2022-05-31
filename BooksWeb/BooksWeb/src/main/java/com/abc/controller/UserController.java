package com.abc.controller;

import com.abc.dto.ChangePassword;
import com.abc.dto.Response;
import com.abc.dto.UserDto;
import com.abc.entities.User;
import com.abc.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "user")
@PreAuthorize("hasAnyRole('ADMIN','USER')")
public class UserController {
    @Autowired
    UserServiceImpl userService;


    @RequestMapping("create")
    public String createUser(){
        return "user/create";
    }
    @RequestMapping(value = "save", method = RequestMethod.POST,
            produces="application/json")
    @ResponseBody
    public Response saveUser(@RequestBody UserDto userDto){
        //lưu vào cơ sở dữ liệu
        userService.saveUser(userDto);
        return new Response(1,userDto);
    }
    @RequestMapping("/{id}")
    public String createUser(@PathVariable Long id, Model model){
        User user = userService.findById(id);// lấy từ cơ sở dữ liệu
        model.addAttribute("user",user);
        return "user/detail";
    }
    @RequestMapping("/change-pass")
    public String changepass(){
        return "user/change-pass";
    }
    @ResponseBody
    @RequestMapping("/change-password")
    public Response changepass(@RequestBody ChangePassword changePassword){
        //lưu vào cơ sở dữ liệu
        return userService.changePass(changePassword);
    }

}
