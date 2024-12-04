package controller;

import model.Book;
import service.IBookService;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "bookController", urlPatterns = {"/books"})
public class BookController extends HttpServlet {
    private static IBookService iBookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                req.getRequestDispatcher("WEB-INF/view/book/add.jsp").forward(req, resp);
                break;
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                iBookService.delete(id);
                resp.sendRedirect("/books");
                break;
            default:
                List<Book> books = iBookService.getAll();
                req.setAttribute("books", books);
                req.getRequestDispatcher("WEB-INF/view/book/list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                String title = req.getParameter("title");
                int pageSize = Integer.parseInt(req.getParameter("pageSize"));
                String author = req.getParameter("author");
                String category = req.getParameter("category");
                Book book = new Book(title, pageSize, author, category);
                iBookService.save(book);
                resp.sendRedirect("/books");
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                String titleUpdate = req.getParameter("title");
                int pageSizeUpdate = Integer.parseInt(req.getParameter("pageSize"));
                String authorUpdate = req.getParameter("author_id");
                String categoryUpdate = req.getParameter("category_id");
                Book bookUpdate = new Book(idUpdate, titleUpdate, pageSizeUpdate, authorUpdate, categoryUpdate);
                iBookService.update(idUpdate, bookUpdate);
                resp.sendRedirect("/books");
                break;
            case "search":
                String name = req.getParameter("name");
                List<Book> bookList = iBookService.findByName(name);
                req.setAttribute("book", bookList);
                req.getRequestDispatcher("WEB-INF/view/book/search.jsp").forward(req, resp);
                break;
        }
    }
}
