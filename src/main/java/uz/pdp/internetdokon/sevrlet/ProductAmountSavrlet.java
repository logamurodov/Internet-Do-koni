package uz.pdp.internetdokon.sevrlet;

import uz.pdp.internetdokon.entity.Backet;
import uz.pdp.internetdokon.entity.Product;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/amount")
public class ProductAmountSavrlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("product"));
        String action = req.getParameter("minus");
        Backet backet = (Backet) req.getSession().getAttribute("backet");
        Product product1 = DB.PRODUCTS.stream().filter(product -> product.getId()==(productId)).findFirst().get();

            if (action.equals("pilus")){
                System.out.println("111");
                Integer i = backet.getBacket().get(product1);
                backet.getBacket().put(product1, i + 1);
            }else {
                Integer i = backet.getBacket().get(product1);
                if (i>1) {
                    backet.getBacket().put(product1, i - 1);
                }
            }

        req.getSession().setAttribute("backet", backet);
        resp.sendRedirect("savat.jsp");

    }
}
