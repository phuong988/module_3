package DAO;

import java.util.ArrayList;

public interface DAOInterface<T> {
    public int insert(T t);

    public int undate(T t);

    public int delete(T t);

     ArrayList<T> getAll();

    T  searchById(T t);

    T selectByConditon(String condition);
}
