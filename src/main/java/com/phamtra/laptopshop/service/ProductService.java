package com.phamtra.laptopshop.service;

import com.phamtra.laptopshop.domain.Product;
import com.phamtra.laptopshop.domain.Role;
import com.phamtra.laptopshop.domain.User;
import com.phamtra.laptopshop.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        Product phamtra = this.productRepository.save(product);
        return phamtra;
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }
}
