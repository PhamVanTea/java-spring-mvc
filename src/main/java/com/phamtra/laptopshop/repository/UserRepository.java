package com.phamtra.laptopshop.repository;

import com.phamtra.laptopshop.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//crud: create, read, update, delete
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User save(User phamtra);
}
