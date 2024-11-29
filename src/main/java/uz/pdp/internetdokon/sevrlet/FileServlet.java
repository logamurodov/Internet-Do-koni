package uz.pdp.internetdokon.sevrlet;



import uz.pdp.internetdokon.entity.Product;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet("/fiile/*")
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        System.out.println(pathInfo);
        Integer productId = Integer.parseInt(pathInfo.split("/")[1]);
        Product product = DB.PRODUCTS.stream().filter(item -> item.getId().equals(productId)).findFirst().get();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(product.getProductUrl())));
    }
}
