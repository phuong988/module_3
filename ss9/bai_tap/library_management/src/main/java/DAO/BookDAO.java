package DAO;

import model.Book;

import java.util.ArrayList;

public class BookDAO implements DAOInterface<Book> {
    public static BookDAO getInstance(){
        return new BookDAO();
    }

    @Override
    public int insert(Book book) {
        return 0;
    }

    @Override
    public int undate(Book book) {
        return 0;
    }

    @Override
    public int delete(Book book) {
        return 0;
    }

    @Override
    public ArrayList<Book> getAll() {
        return null;
    }

    @Override
    public Book searchById(Book book) {
        return null;
    }

    @Override
    public Book selectByConditon(String condition) {
        return null;
    }
}
