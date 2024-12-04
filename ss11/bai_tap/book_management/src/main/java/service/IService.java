package service;

import model.Book;

import java.util.List;

public interface IService<T> {
    List<T> getAll();

    void save(T book);

    void delete(int id);

    void update(int id, T book);

    List<T> findByName(String name);
}
