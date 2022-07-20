package com.ncit.mybookstore.controller;

import com.ncit.mybookstore.model.Book;
import com.ncit.mybookstore.model.User;
import com.ncit.mybookstore.service.BookService;
import com.ncit.mybookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserController {

    public static final Integer PAGE_SIZE = 4;
    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @GetMapping("/user")
    public void getUserById(Integer id){
        User user = userService.getUserById(id);
        System.out.println(user);
    }
}
