package uz.pdp.internetdokon.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Backet {
    Map<Product,Integer> Backet=new HashMap<>();
}
