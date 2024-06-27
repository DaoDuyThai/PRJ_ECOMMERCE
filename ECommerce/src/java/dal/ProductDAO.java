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
import model.Product;

/**
 *
 * @author DUYTHAI
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCTS";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image_url"),
                        rs.getLong("price"),
                        rs.getInt("category_id"),
                        rs.getString("date_created")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Object[]> getTop6NewestProducts() {
        String query = "SELECT TOP 6 P.id, P.name, P.price, P.image_url, C.name as category FROM Products P JOIN Categories C ON P.category_id = c.id ORDER BY P.date_created DESC";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] productList = new Object[5];
                productList[0] = rs.getInt("id");
                productList[1] = rs.getString("name");
                productList[2] = rs.getLong("price");
                productList[3] = rs.getString("image_url");
                productList[4] = rs.getString("category");
                list.add(productList);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Object[]> list = dao.getTop6NewestProducts();
        for (Object[] product : list) {
            System.out.println("ID: " + product[0] + ", Name: " + product[1] + 
                               ", Price: " + product[2] + ", Image URL: " + product[3] + 
                               ", Category: " + product[4]);
        }
    }

    String a = "-- Get the top 6 most bought laptops\n"
            + "SELECT TOP 6 \n"
            + "    P.id,\n"
            + "    P.[name],\n"
            + "    P.[description],\n"
            + "    P.image_url,\n"
            + "    P.price,\n"
            + "    SUM(OD.quantity) AS total_bought\n"
            + "FROM \n"
            + "    Products P\n"
            + "JOIN \n"
            + "    Categories C ON P.category_id = C.id\n"
            + "JOIN \n"
            + "    Order_details OD ON P.id = OD.product_id\n"
            + "WHERE \n"
            + "    C.[name] = 'Laptop'\n"
            + "GROUP BY \n"
            + "    P.id, P.[name], P.[description], P.image_url, P.price\n"
            + "ORDER BY \n"
            + "    total_bought DESC;";
}
