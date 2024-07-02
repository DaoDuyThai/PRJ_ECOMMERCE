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
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public List<Object[]> getTopMostBoughtProductByCategory(int number, String categoryName) {
        String query = "SELECT TOP " + number + " \n"
                + "    P.id,\n"
                + "    P.[name],\n"
                + "    P.price,\n"
                + "    P.image_url,\n"
                + "    C.name as category,\n"
                + "    SUM(OD.quantity) as total_sold\n"
                + "FROM \n"
                + "    Products P\n"
                + "JOIN \n"
                + "    Categories C ON P.category_id = C.id\n"
                + "JOIN \n"
                + "    Order_details OD ON P.id = OD.product_id\n"
                + "WHERE \n"
                + "    C.[name] = '" + categoryName + "'\n"
                + "GROUP BY \n"
                + "    P.id, P.[name], P.price, P.image_url, C.name\n"
                + "ORDER BY \n"
                + "    total_sold DESC;";
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

    public List<Object[]> getTopMostBoughtProducts(int number) {
        String query = "SELECT TOP " + number + " \n"
                + "    P.id,\n"
                + "    P.[name],\n"
                + "    P.price,\n"
                + "    P.image_url,\n"
                + "    C.name as category,\n"
                + "    SUM(OD.quantity) as total_sold\n"
                + "FROM \n"
                + "    Products P\n"
                + "JOIN \n"
                + "    Categories C ON P.category_id = C.id\n"
                + "JOIN \n"
                + "    Order_details OD ON P.id = OD.product_id\n"
                + "GROUP BY \n"
                + "    P.id, P.[name], P.price, P.image_url, C.name\n"
                + "ORDER BY \n"
                + "    total_sold DESC;";
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

    public List<Object[]> getFilteredAndSortedProducts(int pageNumber, int pageSize, String category, String brand, int priceMin, int priceMax, String search, String sort) {
        String query = "SELECT P.id, P.[name], P.price, P.image_url, C.name as category "
                + "FROM Products P JOIN Categories C ON P.category_id = C.id WHERE 1=1";

        List<Object> parameters = new ArrayList<>();

        if (category != null && !category.isEmpty()) {
            query += " AND C.name LIKE ?";
            parameters.add("%" + category + "%");
        }

        query += " AND P.price >= ?";
        parameters.add(priceMin);

        query += " AND P.price <= ?";
        parameters.add(priceMax);

        if (search != null && !search.isEmpty()) {
            query += " AND P.description LIKE ?";
            parameters.add("%" + search + "%");
        }
        if (brand != null && !brand.isEmpty()) {
            query += " AND P.name LIKE ?";
            parameters.add("%" + brand + "%");
        }

        if (sort != null) {
            if (sort.equals("price_asc")) {
                query += " ORDER BY P.price ASC";
            } else if (sort.equals("price_desc")) {
                query += " ORDER BY P.price DESC";
            } else if (sort.equals("default")) {
                query += " ORDER BY P.id";

            }
        }

        query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        parameters.add((pageNumber - 1) * pageSize);
        parameters.add(pageSize);

        List<Object[]> list = new ArrayList<>();
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            for (int i = 0; i < parameters.size(); i++) {
                ps.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Object[] productList = new Object[5];
                    productList[0] = rs.getInt("id");
                    productList[1] = rs.getString("name");
                    productList[2] = rs.getLong("price");
                    productList[3] = rs.getString("image_url");
                    productList[4] = rs.getString("category");
                    list.add(productList);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalProducts(String category, String brand, int priceMin, int priceMax, String search) {
        String query = "SELECT COUNT(*) FROM Products P JOIN Categories C ON P.category_id = C.id WHERE 1=1";

        List<Object> parameters = new ArrayList<>();

        if (category != null && !category.isEmpty()) {
            query += " AND C.name LIKE ?";
            parameters.add("%" + category + "%");
        }

        query += " AND P.price >= ?";
        parameters.add(priceMin);

        query += " AND P.price <= ?";
        parameters.add(priceMax);

        if (search != null && !search.isEmpty()) {
            query += " AND P.description LIKE ?";
            parameters.add("%" + search + "%");
        }
        if (brand != null && !brand.isEmpty()) {
            query += " AND P.name LIKE ?";
            parameters.add("%" + brand + "%");
        }

        int total = 0;
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            for (int i = 0; i < parameters.size(); i++) {
                ps.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
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

    public Object[] getProductById(int id) {
        String query = "SELECT P.id, P.name, P.description, P.image_url, P.price, C.name AS category\n"
                + "FROM Products P JOIN Categories C ON P.category_id = C.id\n"
                + "WHERE P.id = ?";

        Object[] product = new Object[6];
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                product[0] = rs.getInt("id");
                product[1] = rs.getString("name");
                product[2] = rs.getString("description");
                product[3] = rs.getString("image_url");
                product[4] = rs.getLong("price");
                product[5] = rs.getString("category");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return product;
    }

    public List<Object[]> getProductByCategory(int number, String categoryName) {
        String query = "SELECT TOP " + number + " \n"
                + "P.id, P.name, P.description, P.image_url, P.price, C.name AS category\n"
                + "FROM Products P JOIN Categories C ON P.category_id = C.id\n"
                + "WHERE C.name = '" + categoryName + "' ";
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
        Object[] product = dao.getProductById(3);
        System.out.println("" + product[0] + product[1]);

//        List<Object[]> list = dao.getTopMostBoughtProducts(6);
//        for (Object[] product : list) {
//            int productId = (int) product[0];         // Assuming id is an int
//            String productName = (String) product[1]; // Assuming name is a String
//            long price = (long) product[2];           // Assuming price is a long
//            String imageUrl = (String) product[3];    // Assuming image_url is a String
//            String category = (String) product[4];    // Assuming category is a String
//
//            // Print each product's details
//            System.out.println("Product ID: " + productId);
//            System.out.println("Name: " + productName);
//            System.out.println("Price: " + price);
//            System.out.println("Image URL: " + imageUrl);
//            System.out.println("Category: " + category);
//            System.out.println("------------------------");
//        }
    }
}
