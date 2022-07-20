package com.ncit.mybookstore.controller;

import com.ncit.mybookstore.model.Book;
import com.ncit.mybookstore.service.BookService;
import javafx.beans.DefaultProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BookController {
    public static final Integer PAGE_SIZE = 4;

    @Autowired
    BookService bookService;


    @RequestMapping("/book")
    public String getAllBook(Double maxPrice, Double minPrice, @RequestParam(defaultValue = "1") Integer page, Model model){

        List<Book> bookList = bookService.getAllBookByPrice(maxPrice,minPrice,page,PAGE_SIZE);

        Integer total = bookService.getTolalByPrice(maxPrice,minPrice);

        model.addAttribute("bookList",bookList);
        model.addAttribute("total",total);
        model.addAttribute("page",page);
        model.addAttribute("pagenum",total%PAGE_SIZE==0?total/PAGE_SIZE:total/PAGE_SIZE+1);
        model.addAttribute("maxPrice",maxPrice);
        model.addAttribute("minPrice",minPrice);
        return "index";
    }


}
