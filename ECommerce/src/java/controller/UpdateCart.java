/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 *
 * @author DUYTHAI
 */
@WebServlet(name = "UpdateCart", urlPatterns = {"/updatecart"})
public class UpdateCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String action = request.getParameter("action");
        if (productId == null || productId.isEmpty() || action == null || action.isEmpty()) {
            response.sendRedirect("index"); // Redirect to an error page if parameters are missing
            return;
        }

        int id;
        try {
            id = Integer.parseInt(productId);
        } catch (NumberFormatException e) {
            response.sendRedirect("index"); // Redirect to an error page if productId is invalid
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        Object[] product = productDAO.getProductById(id);

        if (product == null || product[0] == null) {
            response.sendRedirect("index"); // Redirect to an error page if product does not exist
            return;
        }

        Cookie[] cookies = request.getCookies();
        String cart = "";

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    cart = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    break;
                }
            }
        }

        String[] items = cart.split(",");
        StringBuilder newCart = new StringBuilder();
        boolean itemFound = false;

        for (String item : items) {
            if (item.isEmpty()) {
                continue;
            }

            String[] parts = item.split(":");
            String idStr = parts[0];
            int qty = Integer.parseInt(parts[1]);

            if (idStr.equals(productId)) {
                itemFound = true;
                switch (action) {
                    case "increase":
                        qty++;
                        break;
                    case "decrease":
                        qty--;
                        if (qty <= 0) {
                            continue; // Skip adding this item if the quantity is zero or less
                        }
                        break;
                    case "delete":
                        continue; // Skip adding this item to the new cart
                }
            }

            if (newCart.length() > 0) {
                newCart.append(",");
            }
            newCart.append(idStr).append(":").append(qty);
        }

        // If the item was not found in the cart and the action is to increase, add it with qty 1
        if (!itemFound && action.equals("increase")) {
            if (newCart.length() > 0) {
                newCart.append(",");
            }
            newCart.append(productId).append(":1");
        }

        Cookie cartCookie = new Cookie("cart", URLEncoder.encode(newCart.toString(), "UTF-8"));
        cartCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week
        response.addCookie(cartCookie);

        // Redirect back to the referring page
        String referrer = request.getHeader("referer");
        if (referrer != null && !referrer.isEmpty()) {
            response.sendRedirect(referrer);
        } else {
            response.sendRedirect("index"); // Fallback to a default page if the referrer is not available
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
