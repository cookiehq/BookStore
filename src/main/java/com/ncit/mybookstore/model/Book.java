package com.ncit.mybookstore.model;

public class Book {
    private Integer id;
    private String name;
    private String author;
    private double price;
    private Integer sales;
    private Integer inventory;
    private String img;

    public Book() {
    }

    public Book(Integer id) {
        this.id = id;
    }

    public Book(String name, String author, double price, Integer sales, Integer inventory, String img) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.sales = sales;
        this.inventory = inventory;
        this.img = img;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", sales=" + sales +
                ", inventory=" + inventory +
                ", img='" + img + '\'' +
                '}';
    }
}
