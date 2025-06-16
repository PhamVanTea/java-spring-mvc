package com.phamtra.laptopshop.controller.admin;

import com.phamtra.laptopshop.domain.Product;
import com.phamtra.laptopshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> prs = this.productService.fetchProducts();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") Product pr, BindingResult newProductBindingResult, @RequestParam("phamtraFile")MultipartFile file) {
        this.productService.handleSaveProduct(pr);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/detail")
    public String getDetailProductPage(Model model) {
        return "/admin/product/detail";
    }


//    @GetMapping("/admin/product/update")
//    public String getUpdateProductPage(Model model) {
//        model.addAttribute("newProduct", new Product());
//        return "admin/product/update";
//    }
}



