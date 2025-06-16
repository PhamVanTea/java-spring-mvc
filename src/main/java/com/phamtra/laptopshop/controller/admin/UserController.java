package com.phamtra.laptopshop.controller.admin;

import com.phamtra.laptopshop.domain.User;
import com.phamtra.laptopshop.service.UploadService;
import com.phamtra.laptopshop.service.UserService;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class UserController {

    // //DI: dependency injection
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UploadService uploadService, UserService userService,
                          PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
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
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/show/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // Hiển thị trang tạo mới người dùng.
    @GetMapping("/admin/user/create") // get
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // khi nhấn nút create thì sẽ save và chuyển hướng đến trang /admin/user
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
                                 @ModelAttribute("newUser") @Valid User phamtra,
                                 BindingResult newUserbindingResult,
                                 @RequestParam("phamtraFile") MultipartFile file // lấy file từ controller
    ) {
        List<FieldError> errors = newUserbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        //validate
        if (newUserbindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(phamtra.getPassword());

        phamtra.setAvatar(avatar);
        phamtra.setPassword(hashPassword);
        phamtra.setRole(this.userService.getRoleByName(phamtra.getRole().getName()));
        //save

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
