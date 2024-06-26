/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Order {

    int id;
    int account_id;
    long total_price;
    String delivery_address;
    String status;
    String note;
    String date_created;

    public Order() {
    }

    public Order(int id, int account_id, long total_price, String delivery_address, String status, String note, String date_created) {
        this.id = id;
        this.account_id = account_id;
        this.total_price = total_price;
        this.delivery_address = delivery_address;
        this.status = status;
        this.note = note;
        this.date_created = date_created;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public long getTotal_price() {
        return total_price;
    }

    public void setTotal_price(long total_price) {
        this.total_price = total_price;
    }

    public String getDelivery_address() {
        return delivery_address;
    }

    public void setDelivery_address(String delivery_address) {
        this.delivery_address = delivery_address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", account_id=" + account_id + ", total_price=" + total_price + ", delivery_address=" + delivery_address + ", status=" + status + ", note=" + note + ", date_created=" + date_created + '}';
    }

}
