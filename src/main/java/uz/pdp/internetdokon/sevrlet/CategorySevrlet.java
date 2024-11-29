package uz.pdp.internetdokon.sevrlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/category")
public class CategorySevrlet extends HttpServlet {
    public static Integer categoryId=0;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("categoryid"));
        categoryId=id;

            resp.sendRedirect("user/categoryuser.jsp");

    }
}
