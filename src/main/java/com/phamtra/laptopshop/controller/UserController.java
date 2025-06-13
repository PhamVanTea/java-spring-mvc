package com.phamtra.laptopshop.controller;

import com.phamtra.laptopshop.domain.User;
import com.phamtra.laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    // //DI: dependency injection
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // Hiển thị trang chủ với dữ liệu được truyền từ controller.
    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("buithicamnang.tvi5113@gmail.com");
        model.addAttribute("phamtra", "test");
        model.addAttribute("test", "from controller with model");
        return "hello";
    }

    // Hiển thị trang quản lý danh sách người dùng.
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users1", users);
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/show/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) { // @PathVariable long phamtra: lấy tham số
                                                                          // {phamtra}
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/show";
    }

    // Hiển thị trang tạo mới người dùng.
    @RequestMapping("/admin/user/create") // get
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // khi nhấn nút create thì sẽ save và chuyển hướng đến trang /admin/user
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User phamtra) {
        this.userService.handleSaveUser(phamtra);
        return "redirect:/admin/user";
    }

    // Hiển thị trang update người dùng.
    @RequestMapping("/admin/user/update/{id}") // get
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // khi dùng postmapping thì đường dẫn url ứng với method: post
    @PostMapping("/admin/user/update")
    public String postUpdateUserPage(Model model, @ModelAttribute("newUser") User phamtra) {
        User currentUser = this.userService.getUserById(phamtra.getId());
        if (currentUser != null) {
            currentUser.setAddress(phamtra.getAddress());
            currentUser.setFullName(phamtra.getFullName());
            currentUser.setPhone(phamtra.getPhone());
            // lưu xuống database
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user"; // khi nhấn nút update thì sẽ save và chuyển hướng đến trang /admin/user
    }

    // Hiển thị trang delete người dùng.
    @GetMapping("/admin/user/delete/{id}") // get
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete") // get
    public String postDeleteUserPage(Model model, @ModelAttribute("newUser") User phamtra) {
        this.userService.deleteAUser(phamtra.getId());
        return "redirect:/admin/user";
    }
}
