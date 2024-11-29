package uz.pdp.internetdokon.sevrlet;


import uz.pdp.internetdokon.entity.Backet;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/qoshish")
public class SavatgaQoshishSevrlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Backet backet = Objects.requireNonNullElse((Backet) req.getSession().getAttribute("backet"), new Backet());

        int prdoductid = Integer.parseInt(req.getParameter("productid"));
        if (backet.getBacket().containsKey(DB.PRODUCTS.stream().filter(product -> product.getId().equals(prdoductid)).findFirst().get())) {
            backet.getBacket().remove(DB.PRODUCTS.stream().filter(product -> product.getId().equals(prdoductid)).findFirst().get());
        }else {
            backet.getBacket().put(DB.PRODUCTS.stream().filter(product -> product.getId().equals(prdoductid)).findFirst().get(), 1);
        }
        System.out.println("salom");

        req.getSession().setAttribute("backet", backet);
            resp.sendRedirect("/user/categoryuser.jsp");


    }
}
