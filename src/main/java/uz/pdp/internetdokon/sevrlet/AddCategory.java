package uz.pdp.internetdokon.sevrlet;


import uz.pdp.internetdokon.entity.Category;
import uz.pdp.internetdokon.entity.User;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addcategory")
public class AddCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("categoryName");
        DB.CATEGORIES.add(new Category(name));
        User user = (User)req.getSession().getAttribute("user");
        System.out.print(user.getRole());
        resp.sendRedirect("/admin/categoryadmin.jsp");
    }
}
