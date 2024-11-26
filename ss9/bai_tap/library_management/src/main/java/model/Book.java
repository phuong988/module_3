package model;

import java.util.Date;

public class Book {
    private int id;
    private String title;
    private double price;
    private Date publicationDate;

    public Book() {
    }

    public Book(int id, String title, double price, Date publicationDate) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.publicationDate = publicationDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }
}
