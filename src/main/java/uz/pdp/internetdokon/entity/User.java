package uz.pdp.category.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id=idGen++;
    private String firstname;
    private String lastname;
    private String phone;
    private String password;
    private String role="user";
    private static Integer idGen=1;

    public User(String firstname, String lastname, String phone, String password, String admin) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.password = password;
        this.role = admin;
    }
}
