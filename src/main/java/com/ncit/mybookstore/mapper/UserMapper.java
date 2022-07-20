package com.ncit.mybookstore.mapper;

import com.ncit.mybookstore.model.User;

public interface UserMapper {
    User getUserById(Integer id);

    User loadUserByUsername(String username);

    Integer doRegister(User user);
}
