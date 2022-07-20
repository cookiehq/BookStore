package com.ncit.mybookstore.service;

import com.ncit.mybookstore.mapper.CartMapper;
import com.ncit.mybookstore.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    CartMapper cartMapper;

    public List<Cart> getAllCart(Integer userId) {
        return cartMapper.getAllCart(userId);
    }

    public Integer deleteCartById(Integer id) {
        return cartMapper.deleteCartById(id);
    }

    public Integer deleteCartByName(String name) {
        return cartMapper.deleteCartByName(name);
    }

    public Integer deleteCart() {
        return cartMapper.deleteCart();
    }


    public Integer addCart(Cart cart) {
        return cartMapper.addCart(cart);
    }

    public Integer getCartByBookId(Integer bookId,Integer userId) {
        return cartMapper.getCartByBookId(bookId,userId);
    }

    public Integer updateCartByBookId(Integer bookId,Integer userId) {
        return cartMapper.updateCartByBookId(bookId,userId);
    }
}
