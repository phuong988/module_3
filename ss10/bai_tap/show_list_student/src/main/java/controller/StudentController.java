package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet(name = "studentServlet", urlPatterns = "/students")
public class StudentController extends HttpServlet {
    private IStudentService iStudentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                req.getRequestDispatcher("WEB-INF/view/student/add.jsp").forward(req, resp);
                break;
            default:
                List<Student> students = iStudentService.getAll();
                req.setAttribute("students", students);
                req.getRequestDispatcher("WEB-INF/view/student/list.jsp").forward(req, resp);
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
                String name = req.getParameter("name");
                String gender = req.getParameter("gender");
                Float score = Float.parseFloat(req.getParameter("score"));
                String image = req.getParameter("image");
                String dob = req.getParameter("dob");
                DateTimeFormatter f = new DateTimeFormatterBuilder().parseCaseInsensitive()
                        .append(DateTimeFormatter.ofPattern("yyyy-MM-dd")).toFormatter();
                LocalDate datetime = null;
                try {
                    datetime = LocalDate.parse("dob", f);
                    System.out.println(datetime);
                } catch (DateTimeParseException e) {
                    e.printStackTrace();
                }
                Student student = new Student(name, gender, score, image, datetime);
                iStudentService.save(student);
                resp.sendRedirect("/students");
                break;
        }
    }
}
