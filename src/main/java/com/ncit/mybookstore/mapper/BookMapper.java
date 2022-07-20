package com.ncit.mybookstore.mapper;

import com.ncit.mybookstore.model.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    Book getBookById();

    List<Book> getAllBookByPrice(@Param("maxPrice") Double maxPrice,
                                 @Param("minPrice") Double minPrice,
                                 @Param("page") Integer page,
                                 @Param("pageSize") Integer pageSize);

    Integer getTolalByPrice(@Param("maxPrice") Double maxPrice,
                            @Param("minPrice") Double minPrice);
}
