/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> list = dao.getAllOrders();
        for (Order p : list) {
            System.out.println(p.toString());
        }
    }
}
