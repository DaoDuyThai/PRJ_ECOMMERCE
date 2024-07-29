/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Order;
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

    public String saveOrderDetail(OrderDetail orderDetail) {
        String sql = "INSERT INTO Order_details (product_id, order_id, quantity, price)\n"
                + "VALUES(\n"
                + orderDetail.getProduct_id() + ", \n"
                + orderDetail.getOrder_id() + ", \n"
                + orderDetail.getQuantity() + ", \n"
                + orderDetail.getPrice() + " \n"
                + ");";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            return "Database error!";
        }
        return "";
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        OrderDetail o = new OrderDetail();
        o.setOrder_id(25);
        o.setQuantity(2);
        o.setProduct_id(1);
        o.setPrice(60000000);
        System.out.println(dao.saveOrderDetail(o));
    }
}
