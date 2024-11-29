package uz.pdp.internetdokon.sevrlet;



import uz.pdp.internetdokon.entity.Product;
import uz.pdp.internetdokon.interface1.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@MultipartConfig
@WebServlet(value = "/file")
public class AddProductFileSevrlet extends HttpServlet {
    String absolutePath="C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int i = Integer.parseInt(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Part productImage = req.getPart("imageUrl");
        Path path = Files.write(Path.of(absolutePath + UUID.randomUUID() + ".jpg"), productImage.getInputStream().readAllBytes());
        String photoUrl = path.toString();
        DB.PRODUCTS.add(new Product(name,  categoryId,i, photoUrl));


        System.out.println(photoUrl);
        resp.sendRedirect("/admin/categoryadmin.jsp");

    }
}
