package com.phamtra.laptopshop.service;

import com.phamtra.laptopshop.domain.User;
import com.phamtra.laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }


    public User handleSaveUser(User user) {
        User phamtra = this.userRepository.save(user);
        return phamtra;
    }
}


