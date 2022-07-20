package com.ncit.mybookstore.service;

import com.ncit.mybookstore.mapper.BookMapper;
import com.ncit.mybookstore.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    BookMapper bookMapper;

    public List<Book> getAllBookByPrice(Double maxPrice, Double minPrice, Integer page, Integer pageSize) {
        page = (page-1)*pageSize;
        return bookMapper.getAllBookByPrice(maxPrice,minPrice,page,pageSize);
    }

    public Integer getTolalByPrice(Double maxPrice, Double minPrice) {
        return bookMapper.getTolalByPrice(maxPrice,minPrice);
    }
}
