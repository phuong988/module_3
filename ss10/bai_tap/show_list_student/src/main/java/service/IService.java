package service;

import model.Student;

import java.util.List;

public interface IService<T> {
    public List<T> getAll();

    public void save(Student s);

    void update(int id, T s);

    void remove(int id);

    T findById(int id);

    List<T> findByName(String name);
}
