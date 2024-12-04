package repository;

import model.Book;
import service.IBookService;
import service.impl.BookService;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository {

    public List<Book> findAll() {
        List<Book> books = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.getConnecttion().prepareStatement("select b.id , b.title, b.page_size, a.name as author_name, c.name as category_name\n" +
                    "from books b\n" +
                    "left join authors a on a.id = b.author_id\n" +
                    "left join category c on c.id = b.category_id;");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                String author = resultSet.getString("author_name");
                String category = resultSet.getString("category_name");
                books.add(new Book(id, title, pageSize, author, category));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public void save(Book b) {
        try {
            PreparedStatement statement = BaseRepository.getConnecttion().prepareStatement("INSERT INTO books (title, page_size, author, category) VALUES (?,?,?,?)");
            statement.setString(1, b.getTitle());
            statement.setInt(2, b.getPageSize());
            statement.setString(3, b.getAuthor());
            statement.setString(4, b.getCategory());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int id) {
        try {
            PreparedStatement statement = BaseRepository.getConnecttion().prepareStatement("DELETE FROM books WHERE id =?");
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Book> findByName(String name) {
        List<Book> books = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.getConnecttion().prepareStatement("SELECT * FROM books WHERE title LIKE?");
            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                books.add(new Book(id, title, pageSize, author, category));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public void update(int id, Book b) {
        try {
            PreparedStatement statement = BaseRepository.getConnecttion().prepareStatement("UPDATE books SET title=?, page_size=?, author_id=?, category_id=? WHERE id=?");
            statement.setString(1, b.getTitle());
            statement.setInt(2, b.getPageSize());
            statement.setString(3, b.getAuthor());
            statement.setString(4, b.getCategory());
            statement.setInt(5, b.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
