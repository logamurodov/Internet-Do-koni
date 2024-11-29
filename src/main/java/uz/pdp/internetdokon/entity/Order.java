package uz.pdp.internetdokon.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@NoArgsConstructor@Data@AllArgsConstructor
public class Order {
    private Integer id =(idGen++);
    private Integer userId;
    private LocalDate localDate;
    static private Integer idGen=10001;


}

