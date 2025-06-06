package com.phamtra.laptopshop.controller;

import com.phamtra.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

// @Controller
// public class UserController {

//     @RequestMapping("/")
//     public String getHomePage() {
//         return "hello from controller";
//     }
//}

@RestController
public class UserController {


    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String getHomePage() {
        return this.userService.handleHello();
    }
}
