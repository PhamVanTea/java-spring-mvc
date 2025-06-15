package com.phamtra.laptopshop.controller.admin;

import com.phamtra.laptopshop.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
    @GetMapping("/admin/product")
    public String getProduct() {
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

//    @GetMapping("/admin/product/update")
//    public String getUpdateProductPage(Model model) {
//        model.addAttribute("newProduct", new Product());
//        return "admin/product/update";
//    }
}



