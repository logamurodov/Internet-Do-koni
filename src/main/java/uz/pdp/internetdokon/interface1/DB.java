package uz.pdp.internetdokon.interface1;



import uz.pdp.internetdokon.entity.*;

import java.util.ArrayList;
import java.util.List;

public interface DB {
    List<User> USERS = new ArrayList<>(List.of(
            new User("Laziz","Ogamurodov","+998930007094","123","admin"),
            new User("Lazizbek","Ogamurodov","+998930007094","111","user")
    ));
    List<Category> CATEGORIES = new ArrayList<>(List.of(
            new Category("Yegulik"),
            new Category("Ichgulik"),
            new Category("Kiygulik")
    ));
    List<Product> PRODUCTS = new ArrayList<>(List.of(
            new Product("Olma",1,1000,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\c8553c3d-b78d-49b0-9a1d-4ad06e510572.jpg"),
            new Product("Nok",1,1200,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\b603b74f-9bd1-4372-af5c-03d93880b33e.jpg"),
            new Product("Uzum",1,1500,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\61f50277-6903-453f-844a-ac59eabdbf54.jpg"),
            new Product("Cola",2,1800,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\a5d57cc6-8995-43c4-8e12-d07bc181b315.jpg"),
            new Product("Fanta",2,1600,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\e88479f2-e231-4a4e-9e80-fdc0e872eaf7.jpg"),
            new Product("Shapka",3,2000,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\9b39d092-6d4f-4368-9dbf-e18f116b302a.jpg"),
            new Product("Kurtka",3, 2500,"C:\\Users\\ASUS\\IdeaProjects\\CaTegory\\files\\7fecbe23-15e0-4d5e-8a83-43c35a4b20ad.jpg")
    ));
    List<Order> ORDERS=new ArrayList<>();
    List<OrderItem> ORDERITEMS=new ArrayList<>();
}
