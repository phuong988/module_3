package DAO;

import model.Customer;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

public class CustomerDAO implements DAOInterface<Customer>  {

    public static CustomerDAO getInstance() {
        return new CustomerDAO();
    }
    @Override
    public int insert(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        Statement statement = connection.createStatement();
        return 0;
    }

    @Override
    public int undate(Customer customer) {
        return 0;
    }

    @Override
    public int delete(Customer customer) {
        return 0;
    }

    @Override
    public ArrayList<Customer> getAll() {
        return null;
    }

    @Override
    public Customer searchById(Customer customer) {
        return null;
    }

    @Override
    public Customer selectByConditon(String condition) {
        return null;
    }
}
