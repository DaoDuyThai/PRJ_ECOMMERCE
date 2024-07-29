/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author DUYTHAI
 */
@WebServlet(name = "SaveOrderController", urlPatterns = {"/saveorder"})
public class SaveOrderController extends HttpServlet {

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
            out.println("<title>Servlet SaveOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveOrderController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        Object account = session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        // Read cart items from cookies
        Cookie[] cookies = request.getCookies();
        List<OrderDetail> orderDetails = new ArrayList<>();
        long totalPrice = 0;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().startsWith("cart_")) {
                    String[] cartItem = cookie.getValue().split("_");
                    int productId = Integer.parseInt(cartItem[0]);
                    int quantity = Integer.parseInt(cartItem[1]);
                    long price = Long.parseLong(cartItem[2]);

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setProduct_id(productId);
                    orderDetail.setQuantity(quantity);
                    orderDetail.setPrice(price);

                    orderDetails.add(orderDetail);
                    totalPrice += quantity * price;
                }
            }
        }

        //Create and save the order
        Order order = new Order();
        order.setAccount_id(((Account) account).getId());
        order.setTotal_price(totalPrice);
        order.setDelivery_address(address);
        order.setReceiver_name(fullname);
        order.setReceiver_phone(tel);
        order.setNote(note);
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.saveOrder(order);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        for (OrderDetail detail : orderDetails) {
            detail.setOrder_id(orderId);
            orderDetailDAO.saveOrderDetail(detail);
        }

        // Clear cart cookies
        for (Cookie cookie : cookies) {
            if (cookie.getName().startsWith("cart_")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        response.sendRedirect("checkoutsuccessfully.jsp");

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
