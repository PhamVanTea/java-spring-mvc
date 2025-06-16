package com.phamtra.laptopshop.repository;

import com.phamtra.laptopshop.domain.Product;
import com.phamtra.laptopshop.domain.Role;
import com.phamtra.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {


}
