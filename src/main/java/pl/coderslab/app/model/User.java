package pl.coderslab.app.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.HashSet;


@Entity
public class User implements Serializable {

    public static final long serialVersionUID = -8720126006597212481L;

    @Id
    @GeneratedValue
    private int userId;

    @NotEmpty
    private String name;

    @NotEmpty
    @Email
    private String email;
    private String phone;

    @NotEmpty
    @Length(min = 5)
    private String password;

    private boolean active;

    @OneToOne
    @JoinColumn(name="addressId")
    private Address address;

    @OneToOne
    @JoinColumn(name = "cartId")
    @JsonIgnore
    private Cart cart;

    public void setRoles(HashSet<Role> roles) {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}