package com.phamtra.laptopshop.controller.admin;

import com.phamtra.laptopshop.domain.Product;
import com.phamtra.laptopshop.service.ProductService;
import com.phamtra.laptopshop.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/product")
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // Hiển thị danh sách sản phẩm
    @GetMapping
    public String listProducts(Model model) {
        model.addAttribute("products", productService.fetchProducts());
        return "admin/product/show"; // Trang hiển thị danh sách sản phẩm
    }

    // Hiển thị form tạo sản phẩm
    @GetMapping("/create")
    public String createProductForm(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create"; // Trang tạo sản phẩm
    }

    // Xử lý tạo sản phẩm
    @PostMapping("/create")
    public String createProduct(@ModelAttribute("newProduct") @Valid Product product,
                                BindingResult bindingResult,
                                @RequestParam("phamtraFile") MultipartFile file) {

        // Kiểm tra lỗi validation
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // Xử lý upload ảnh
        if (!file.isEmpty()) {
            String image = uploadService.handleSaveUploadFile(file, "product");
            product.setImage(image);
        }

        // Lưu sản phẩm vào database
        productService.handleSaveProduct(product);
        return "redirect:/admin/product"; // Chuyển hướng về danh sách sản phẩm
    }

    // Hiển thị chi tiết sản phẩm
    @GetMapping("/{id}")
    public String viewProductDetails(@PathVariable long id, Model model) {
        Optional<Product> product = productService.fetchProductById(id);
        if (product.isEmpty()) {
            model.addAttribute("error", "Product not found!");
            return "error/404"; // Trang báo lỗi nếu sản phẩm không tồn tại
        }
        model.addAttribute("product", product.get());
        return "admin/product/detail"; // Trang chi tiết sản phẩm
    }

    // Hiển thị form cập nhật sản phẩm
    @GetMapping("/update/{id}")
    public String updateProductForm(@PathVariable long id, Model model) {
        Optional<Product> product = productService.fetchProductById(id);
        if (product.isEmpty()) {
            model.addAttribute("error", "Product not found!");
            return "error/404"; // Trang báo lỗi nếu sản phẩm không tồn tại
        }
        model.addAttribute("newProduct", product.get());
        return "admin/product/update"; // Trang cập nhật sản phẩm
    }

    // Xử lý cập nhật sản phẩm
    @PostMapping("/update")
    public String updateProduct(@ModelAttribute("newProduct") @Valid Product product,
                                BindingResult bindingResult,
                                @RequestParam("phamtraFile") MultipartFile file) {

        // Kiểm tra lỗi validation
        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }

        // Lấy sản phẩm hiện tại từ database
        Optional<Product> optionalProduct = productService.fetchProductById(product.getId());
        if (optionalProduct.isEmpty()) {
            return "redirect:/admin/product?error=notfound";
        }

        Product currentProduct = optionalProduct.get();

        // Cập nhật ảnh nếu có upload mới
        if (!file.isEmpty()) {
            String image = uploadService.handleSaveUploadFile(file, "product");
            currentProduct.setImage(image);
        }

        // Cập nhật các thuộc tính còn lại
        currentProduct.setName(product.getName());
        currentProduct.setPrice(product.getPrice());
        currentProduct.setQuantity(product.getQuantity());
        currentProduct.setShortDesc(product.getShortDesc());
        currentProduct.setDetailDesc(product.getDetailDesc());
        currentProduct.setFactory(product.getFactory());
        currentProduct.setTarget(product.getTarget());

        // Lưu thay đổi vào database
        productService.createProduct(currentProduct);
        return "redirect:/admin/product"; // Chuyển hướng về danh sách sản phẩm
    }

    @GetMapping("/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/delete")
    public String deleteProduct(@ModelAttribute("newProduct") Product product) {
        // Lấy ID từ đối tượng product
        long id = product.getId();

        // Gọi service để xóa sản phẩm
        productService.deleteProduct(id);

        // Chuyển hướng về trang danh sách sản phẩm
        return "redirect:/admin/product";
    }

//    @GetMapping("/delete/{id}")
//    public String deleteProduct(@PathVariable("id") long id) {
//        productService.deleteProduct(id); // Gọi service để xóa sản phẩm
//        return "admin/product/delete"; // Chuyển hướng về trang danh sách sản phẩm
//    }

//    @GetMapping
//    public String getAllProducts(Model model) {
//        // Lấy danh sách sản phẩm từ service
//        List<Product> products = productService.getAllProducts();
//        model.addAttribute("products", products);
//
//        // Trả về tên view (JSP, Thymeleaf, v.v.)
//        return "product-list";
//    }

}
