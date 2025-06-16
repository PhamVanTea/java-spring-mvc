package com.phamtra.laptopshop.controller.admin;

import com.phamtra.laptopshop.domain.Product;
import com.phamtra.laptopshop.service.ProductService;
import com.phamtra.laptopshop.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public ProductController(ProductService productService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
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
    public String handleCreateProduct(@ModelAttribute("newProduct") @Valid Product pr,
                                      BindingResult newProductBindingResult,
                                      @RequestParam("phamtraFile")MultipartFile file) {

        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        //upload image
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        pr.setImage(image);
        this.productService.handleSaveProduct(pr);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "/admin/product/detail";
    }


    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete") // get
    public String postDeleteProductPage(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct.get());
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product pr,
                                      BindingResult newProductBindingResult,
                                      @RequestParam("phamtraFile") MultipartFile file) {
        // validate dữ liệu
        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/update";
        }

        Optional<Product> optionalProduct = this.productService.fetchProductById(pr.getId());
        if (optionalProduct.isEmpty()) {
            // Có thể redirect về trang báo lỗi hoặc hiển thị lỗi cụ thể
            return "redirect:/admin/product?error=notfound";
        }

        Product currentProduct = optionalProduct.get();

        // update image nếu có upload mới
        if (!file.isEmpty()) {
            String img = this.uploadService.handleSaveUploadFile(file, "product");
            currentProduct.setImage(img);
        }

        // update các thuộc tính còn lại
        currentProduct.setName(pr.getName());
        currentProduct.setPrice(pr.getPrice());
        currentProduct.setQuantity(pr.getQuantity());
        currentProduct.setDetailDesc(pr.getDetailDesc());
        currentProduct.setShortDesc(pr.getShortDesc());
        currentProduct.setFactory(pr.getFactory());
        currentProduct.setTarget(pr.getTarget());

        this.productService.createProduct(currentProduct);

        return "redirect:/admin/product";
    }

}



