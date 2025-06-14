package com.phamtra.laptopshop.repository;

import com.phamtra.laptopshop.domain.Role;
import com.phamtra.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

//crud: create, read, update, delete
@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);

}
