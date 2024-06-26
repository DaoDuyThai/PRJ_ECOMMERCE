/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Account {
    int id;
    String email;
    String password;
    String fullname;
    String avatar_url;
    String role;
    String date_created;

    public Account() {
    }

    public Account(int id, String email, String password, String fullname, String avatar_url, String role, String dateCreated) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.avatar_url = avatar_url;
        this.role = role;
        this.date_created = dateCreated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDateCreated() {
        return date_created;
    }

    public void setDateCreated(String dateCreated) {
        this.date_created = dateCreated;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", email=" + email + ", password=" + password + ", fullname=" + fullname + ", avatar_url=" + avatar_url + ", role=" + role + ", dateCreated=" + date_created + '}';
    }

}
