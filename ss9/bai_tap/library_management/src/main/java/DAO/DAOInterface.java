package DAO;

import java.util.ArrayList;

public interface DAOInterface<T> {
    public static CustomerDAO getInstance() {}
    public int insert(T t);

    int undate(T t);

    int delete(T t);

     ArrayList<T> getAll();

    T  searchById(T t);

    T selectByConditon(String condition);
}
