package com.phamtra.laptopshop.repository;

import com.phamtra.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

//crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User phamtra);

    List<User> findByEmail(String email);
}
