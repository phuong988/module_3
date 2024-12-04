package DTO;

public class BookDTO {
    private int id;
    private String title;
    private int page_size;
    private String author_name;
    private String category_name;

    public BookDTO() {
    }

    public BookDTO(int id, String title, int page_size, String author_name, String category_name) {
        this.id = id;
        this.title = title;
        this.page_size = page_size;
        this.author_name = author_name;
        this.category_name = category_name;
    }

    public BookDTO(String title, int page_size, String author_name, String category_name) {
        this.title = title;
        this.page_size = page_size;
        this.author_name = author_name;
        this.category_name = category_name;
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

    public int getPage_size() {
        return page_size;
    }

    public void setPage_size(int page_size) {
        this.page_size = page_size;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
}
