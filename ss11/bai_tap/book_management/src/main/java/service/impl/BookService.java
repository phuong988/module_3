package service.impl;

import model.Book;
import repository.BookRepository;
import service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    public static final BookRepository bookRepository = new BookRepository();
    @Override
    public List<Book> getAll() {
        return bookRepository.findAll();
    }

    @Override
    public void save(Book book) {
        bookRepository.save(book);
    }

    @Override
    public void delete(int id) {
        bookRepository.delete(id);
    }

    @Override
    public void update(int id, Book book) {
        bookRepository.update(id, book);
    }

    @Override
    public List<Book> findByName(String name) {
        return bookRepository.findByName(name);
    }
}
