package model;


import java.sql.Date;

public class Customer {
    private int id;
    private String name;
    private Date dayOfBirth;
    private String address;

    public Customer() {
    }

    public Customer(String name, Date dayOfBirth, String address) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
    }

    public Customer(int id, String name, Date dayOfBirth, String address) {
        this.id = id;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(Date dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
