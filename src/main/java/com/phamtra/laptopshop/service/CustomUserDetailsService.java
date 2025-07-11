package com.phamtra.laptopshop.service;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        com.phamtra.laptopshop.domain.User user = this.userService.getUserByEmail(username); //khai báo 2 User trùng nhau
        if (user == null) {
            throw new UsernameNotFoundException("user not found");
        }
        return new User(
          user.getEmail(),
          user.getPassword(),
          Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole().getName())));
    }

    
}
