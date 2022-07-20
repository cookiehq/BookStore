package com.ncit.mybookstore.mapper;

import com.ncit.mybookstore.model.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {

    List<Cart> getAllCart(@Param("userId") Integer userId);

    Integer deleteCartById(@Param("id") Integer id);

    Integer deleteCartByName(@Param("name") String name);

    Integer deleteCart();

    Integer addCart(Cart cart);

    Integer getCartByBookId(@Param("bookId") Integer bookId,
                            @Param("userId") Integer userId);

    Integer updateCartByBookId(@Param("bookId") Integer bookId,
                               @Param("userId") Integer userId);
}
