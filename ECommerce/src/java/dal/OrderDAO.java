/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author DUYTHAI
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM ORDERS";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("account_id"),
                        rs.getLong("total_price"),
                        rs.getString("delivery_address"),
                        rs.getString("receiver_name"),
                        rs.getString("receiver_phone"),
                        rs.getString("status"),
                        rs.getString("note"),
                        rs.getString("date_created")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int saveOrder(Order order) {
        String sql = "INSERT INTO Orders (account_id, total_price, delivery_address, receiver_name, receiver_phone, [status], note)\n"
                + "VALUES (\n"
                + order.getAccount_id() + ", "
                + order.getTotal_price() + ", "
                + "'" + order.getDelivery_address() + "', "
                + "'" + order.getReceiver_name() + "', "
                + "'" + order.getReceiver_phone()+ "', "
                + "'Processing', \n"
                + "'" + order.getNote()+ "'"
                + ");";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return generated order ID
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        Order order = new Order(1, 10000000L,  "delivery_address", "receiver_name", "receiver_phone", "status", "note");
        System.out.println(""+ dao.saveOrder(order));
    }
}
