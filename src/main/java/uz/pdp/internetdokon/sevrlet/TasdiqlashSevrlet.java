package uz.pdp.internetdokon.sevrlet;


import uz.pdp.internetdokon.entity.Backet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/tasdiqlash")
public class TasdiqlashSevrlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Backet backet = (Backet) req.getSession().getAttribute("backet");
        backet.getBacket().clear();
        req.setAttribute("backet", backet);
        resp.sendRedirect("/user/categoryuser.jsp");
    }
}
