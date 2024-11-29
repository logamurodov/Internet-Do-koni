package uz.pdp.internetdokon.sevrlet;


import uz.pdp.internetdokon.entity.Backet;
import uz.pdp.internetdokon.entity.User;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/adduser")
public class Adduser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        User user = new User(name, lastName, phone, password, "User");
        DB.USERS.add(user);

        HttpSession session = req.getSession();
        Backet backet = Objects.requireNonNullElse((Backet) session.getAttribute("backet"),new Backet());


        if (backet.getBacket().isEmpty()) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/user/categoryuser.jsp");
        }else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("/savat.jsp");
        }



    }
}
