package com.phamtra.laptopshop.repository;

import com.phamtra.laptopshop.domain.Cart;
import com.phamtra.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
