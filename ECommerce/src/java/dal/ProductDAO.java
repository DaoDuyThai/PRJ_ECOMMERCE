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

    public List<Object[]> getNewestProducts() {
        String query = "WITH RankedProducts AS (\n"
                + "    SELECT \n"
                + "        P.id, \n"
                + "        P.name, \n"
                + "        P.price, \n"
                + "        P.image_url, \n"
                + "        C.name as category,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY P.category_id ORDER BY P.date_created DESC) as rn\n"
                + "    FROM \n"
                + "        Products P \n"
                + "    JOIN \n"
                + "        Categories C ON P.category_id = C.id\n"
                + ")\n"
                + "SELECT \n"
                + "    id, \n"
                + "    name, \n"
                + "    price, \n"
                + "    image_url, \n"
                + "    category \n"
                + "FROM \n"
                + "    RankedProducts \n"
                + "WHERE \n"
                + "    rn <= 2;";
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

    public List<Object[]> getTop6MostBoughtProducts(String categoryName) {
        String query = "SELECT TOP 6 \n"
                + "    P.id,\n"
                + "    P.[name],\n"
                + "    P.price,\n"
                + "	P.image_url,\n"
                + "	C.name as category\n"
                + "FROM \n"
                + "    Products P\n"
                + "JOIN \n"
                + "    Categories C ON P.category_id = C.id\n"
                + "JOIN \n"
                + "    Order_details OD ON P.id = OD.product_id\n"
                + "WHERE \n"
                + "    C.[name] = '" + categoryName + "'\n"
                + "GROUP BY \n"
                + "    P.id, P.[name], P.[description], P.image_url, P.price, C.name;";
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

    public int getTotalProducts() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM Products";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Product> getAllProducts(int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (pageNumber - 1) * pageSize);
            ps.setInt(2, pageSize);
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

    public List<Object[]> getCategoryProductCount() {
        String query = "SELECT \n"
                + "	C.name AS category_name,\n"
                + "	COUNT(P.id) AS number_of_products\n"
                + "FROM\n"
                + "	Categories C JOIN Products P ON C.id = P.category_id\n"
                + "GROUP BY C.name\n"
                + "ORDER BY number_of_products DESC";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] productList = new Object[2];
                productList[0] = rs.getString("category_name");
                productList[1] = rs.getString("number_of_products");
                list.add(productList);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        int pageNumber = 1; // for example, fetch the first page
        int pageSize = 5; // for example, fetch 5 products per page
        List<Product> products = dao.getAllProducts(pageNumber, pageSize);
        for (Product product : products) {
            System.out.println(product);
        }
    }
}
