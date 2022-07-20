package com.ncit.mybookstore.service;

import com.ncit.mybookstore.mapper.UserMapper;
import com.ncit.mybookstore.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    public User doLogin(String username, String password) {

        User user = userMapper.loadUserByUsername(username);
        if (user == null || !user.getPassword().equals(password)){
            return null;
        }
        return user;
    }

    public Integer doRegister(User user) {

        User resultUser = userMapper.loadUserByUsername(user.getUsername());
        if (resultUser != null){
            return -1;
        }

        return userMapper.doRegister(user);
    }
}
