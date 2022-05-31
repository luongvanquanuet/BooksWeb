package com.abc.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class HomeRestController {
    //mặc định là phương thức get
    //param name(@RequestParam) : ? name=Quan
    //đường dẫn(@PathVariable) : rest/home/ten_t3h
    //param và pathvariable có ở tất cả các phương thức
    @RequestMapping("rest/home/{ten}")
    public String restHome(@RequestParam String name, @PathVariable String ten){
        return name+"_"+ ten;
    }
    //@RequestBody nó chỉ trong các phương thức # GET
    //@RequestBody sẽ được dấu không hiển thị trên dường dẫn-> tính bảo mật cao hơn
    @RequestMapping(value = "rest/post",method = RequestMethod.POST)
    public String restPost(@RequestBody String name){
        return name;
    }
    @RequestMapping(value = "rest/put",method = RequestMethod.POST)
    public String restPut(){
        return "testPut";
    }
}
