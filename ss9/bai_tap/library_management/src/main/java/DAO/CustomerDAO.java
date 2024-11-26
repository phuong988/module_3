package DAO;

import model.Customer;

import java.util.ArrayList;

public class CustomerDAO implements DAOInterface<Customer>  {

    public CustomerDAO getInstance() {
        return new CustomerDAO();
    }
    @Override
    public int insert(Customer customer) {
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
