package com.ncit.mybookstore.model;

public class Cart {
    private Integer id;
    private Integer num;
    private Book book;
    private Integer userId;

    public Cart() {
    }

    public Cart(Integer num, Book book, Integer userId) {
        this.num = num;
        this.book = book;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Double getTotal() {
        this.getBook().getName();
        this.getBook().getPrice();
        return this.getNum()*book.getPrice();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", num=" + num +
                ", book=" + book +
                ", userId=" + userId +
                '}';
    }
}
