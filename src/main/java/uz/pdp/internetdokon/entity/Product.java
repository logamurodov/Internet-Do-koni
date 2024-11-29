package uz.pdp.internetdokon.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@AllArgsConstructor@NoArgsConstructor
public class Product {
    private Integer id=idGen++;
    private String name;
    private Integer price;
    private Integer categoryId;
    private String productUrl;
    private static Integer idGen=1;
    public Product(String name, Integer categoryId, Integer price, String productUrl) {
        this.name = name;
        this.categoryId = categoryId;
        this.price = price;
        this.productUrl = productUrl;
    }
}
