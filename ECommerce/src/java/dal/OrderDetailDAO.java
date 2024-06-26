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
import model.OrderDetail;

/**
 *
 * @author DUYTHAI
 */
public class OrderDetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM ORDER_DETAILS";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getInt("order_id"),
                        rs.getInt("quantity"),
                        rs.getLong("price")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> list = dao.getAllOrderDetails();
        for (OrderDetail p : list) {
            System.out.println(p.toString());
        }
    }
}
