package uz.pdp.internetdokon.sevrlet;

import uz.pdp.internetdokon.entity.User;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delate")
public class DaleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user1 = (User) req.getSession().getAttribute("user");

        DB.USERS.removeIf(user -> user.getId() == user1.getId());
        req.getSession().invalidate();
        resp.sendRedirect("/user/categoryuser.jsp");
    }
}
