package com.phamtra.laptopshop.service;

import com.phamtra.laptopshop.domain.User;
import com.phamtra.laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "hello from service";
    }
    public User handleSaveUser(User user) {
        User phamtra = this.userRepository.save(user);
        System.out.println(phamtra);
        return phamtra;
    }
}


