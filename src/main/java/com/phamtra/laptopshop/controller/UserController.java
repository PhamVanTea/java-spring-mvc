package com.phamtra.laptopshop.controller;

import com.phamtra.laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    // //DI: dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("phamtra", test);
        model.addAttribute("test", "from controller with model");
        return "hello";
    }
}

// @RestController
// public class UserController {
//
// //DI: dependency injection
// private UserService userService;
//
// public UserController(UserService userService) {
// this.userService = userService;
// }
//
// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }
