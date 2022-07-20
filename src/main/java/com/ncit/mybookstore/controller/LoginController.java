package com.ncit.mybookstore.controller;

import com.ncit.mybookstore.model.User;
import com.ncit.mybookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String index(){
        return "forward:/book";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("currentuser");
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(String username, String password, Model model, HttpSession httpSession){
        User user = userService.doLogin(username,password);
        if (user == null){
            model.addAttribute("error","用户名或密码输入错误，登录失败！");
            return "forward:/";
        }else {
            httpSession.setAttribute("currentuser",user);
            return "redirect:/book";
        }
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/doRegister")
    public String doRegister(User user, Model model){
        Integer result = userService.doRegister(user);
        if (result == 1){
            model.addAttribute("error","注册成功！");
            return "redirect:/";
        }else {
            model.addAttribute("user",user);
            model.addAttribute("error","用户名已经存在，注册失败！");
            return "forward:/register";
        }
    }






















}
