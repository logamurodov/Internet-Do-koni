package uz.pdp.internetdokon.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor@Data@AllArgsConstructor
public class OrderItem {
    private Integer id;
    private Integer orderId;
    private Product product;
    private Integer amount;
}
