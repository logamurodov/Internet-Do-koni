package uz.pdp.internetdokon.sevrlet;



import uz.pdp.internetdokon.entity.User;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(value = "/login")
public class Loginsevrlet extends HttpServlet {
    public static User currentUser=null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Optional<User> userOptional = DB.USERS.stream().filter(item -> item.getPhone().equals(phone) && item.getPassword().equals(password)).findFirst();


        if (userOptional.isPresent()) {
            req.getSession().invalidate();

            User user=userOptional.get();

            if (user.getRole().equals("admin")) {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("/admin/categoryadmin.jsp");
            }else  {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("/user/categoryuser.jsp");
            }

        }else {
            resp.sendRedirect("/login.jsp");
        }
    }
}
