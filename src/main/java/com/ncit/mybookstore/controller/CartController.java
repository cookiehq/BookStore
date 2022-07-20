package com.ncit.mybookstore.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.ncit.mybookstore.model.Book;
import com.ncit.mybookstore.model.Cart;
import com.ncit.mybookstore.model.ResultObj;
import com.ncit.mybookstore.model.User;
import com.ncit.mybookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping("/cart")
    public String cart(Model model,HttpSession session){

        User user = (User)session.getAttribute("currentuser");//获取用户
        Integer userId = user.getId();

        if (userId == null){//如果用户没有登录
            model.addAttribute("msg", "请登录！");
            return "forward:/book";
        }

        List<Cart> cartList = cartService.getAllCart(userId);
        model.addAttribute("cartList", cartList);
        return "cart";
    }

    @ResponseBody
    @RequestMapping("/deleteCartById")
    public ResultObj deleteCartById(Integer id){
        Integer resultInt = cartService.deleteCartById(id);
        if(resultInt >0){
            return new ResultObj(true,"删除成功！");
        }

        return new ResultObj(false,"删除失败！");
    }

    @ResponseBody
    @RequestMapping("/deleteCartByName")
    public ResultObj deleteCartByName(String name,Model model){
        Integer resultInt = cartService.deleteCartByName(name);
        if(resultInt >0){
            return new ResultObj(true,"删除成功！");
        }

        return new ResultObj(false,"删除失败！");
    }

    @ResponseBody
    @RequestMapping("/deleteCart")
    public ResultObj deleteCart(){
        Integer resultInt = cartService.deleteCart();
        if(resultInt >0){
            return new ResultObj(true,"清除购物车成功！");
        }

        return new ResultObj(false,"清除购物车成功！");

    }

    @ResponseBody
    @RequestMapping("/addCart")
    public ResultObj addCart(Integer bookId, HttpSession session){

        User user = (User)session.getAttribute("currentuser");//获取用户
        Integer userId = user.getId();

        if (userId == null){//如果用户没有登录
            return new ResultObj(false,"请登录！");
        }


        Integer getCart = cartService.getCartByBookId(bookId,userId);//根据图书编号查找购物车

        if (getCart > 0){//如果购物车中有这本书
            Integer update = cartService.updateCartByBookId(bookId,userId);//将数量加1

            if (update > 0){
                return new ResultObj(true,"添加购物车成功！");
            }else {
                return new ResultObj(false,"添加购物车失败！");
            }
        }else {//如果购物车中没有这本书

            Cart cart = new Cart(1,new Book(bookId),userId);

            Integer result = cartService.addCart(cart);//在购物车中添加这本书

            if (result == 1){
                return new ResultObj(true,"添加购物车成功！");
            }else {
                return new ResultObj(false,"添加购物车失败！");
            }
        }
    }
}
