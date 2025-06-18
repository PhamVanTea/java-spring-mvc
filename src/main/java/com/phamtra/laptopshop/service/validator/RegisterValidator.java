package com.phamtra.laptopshop.service.validator;

import com.phamtra.laptopshop.domain.dto.RegisterDTO;
import com.phamtra.laptopshop.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import com.phamtra.laptopshop.domain.dto.RegisterDTO;
import org.springframework.stereotype.Service;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private  final UserService userService;
    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Password nhâp không chính xác !")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here
        //check email
        if (userService.checkEmailExits(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email đã tồn tại !")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }
}
