package model;

import java.time.LocalDate;

public class Student {
    private Integer id;
    private String name;
    private String gender;
    private Float score;
    private String image;
    private LocalDate dob;
    private String classification;
    public Student() {
    }

    public Student(Integer id, String name, String gender, Float score, String image, LocalDate dob) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.score = score;
        this.image = image;
        this.dob = dob;
    }

    public Student(String name, String gender, Float score, String image, LocalDate dob) {
        this.name = name;
        this.gender = gender;
        this.score = score;
        this.image = image;
        this.dob = dob;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }


    public void setClassification(String classification) {
        this.classification = classification;
    }

    // Phương thức xác định xếp loại
//    private String classify(Float score) {
//        if (score >= 90) return "Giỏi";
//        else if (score >= 80) return "Khá";
//        else if (score >= 60) return "Trung Bình";
//        else return "Yếu";
//    }
}
