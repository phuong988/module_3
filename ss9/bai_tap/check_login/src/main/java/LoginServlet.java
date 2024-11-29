import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Kiểm tra thông tin đăng nhập
        if ("admin".equals(username) && "123abc".equals(password)) {
            // Lấy thời gian hiện tại
            String currentTime = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy").format(new Date());

            // Đặt thuộc tính message và chuyển hướng đến success.jsp
            req.setAttribute("message", "Admin đăng nhập thành công vào lúc " + currentTime);
            RequestDispatcher dispatcher = req.getRequestDispatcher("success.jsp");
            dispatcher.forward(req, resp);
        } else {
            // Đặt thông báo lỗi và quay lại trang login.jsp
            req.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu không đúng!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Chuyển hướng đến trang login.jsp khi truy cập trực tiếp
        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
        dispatcher.forward(req, resp);
    }
}
