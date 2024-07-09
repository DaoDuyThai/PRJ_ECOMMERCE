/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        AccountDAO dao = new AccountDAO();
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("old-password");
        String newPassword = request.getParameter("new-password");
        String fullname = request.getParameter("fullname");
        String imageUrl = request.getParameter("image-url");

        String errorMessage = "";

        if (email.isBlank() || oldPassword.isBlank() || fullname.isBlank() || imageUrl.isBlank()) {
            errorMessage = "Invalid input. Please try again!";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

        Account account = dao.login(email, oldPassword);
        
        if (account == null) {
            errorMessage = "Wrong password. Please try again!";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            if (newPassword.isBlank()) {
                dao.updateProfile(email, oldPassword, fullname, imageUrl);
            } else if (!newPassword.isBlank()) {
                dao.updateProfile(email, newPassword, fullname, imageUrl);
            }
            String successMessage = "Profile updated successfully!";
            request.setAttribute("successMessage", successMessage);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

//        String errorMessage = dao.register(email, password, fullname, imageUrl);
//        if (errorMessage == null || errorMessage.isEmpty()) {
//            response.sendRedirect("login");
//        } else {
//            request.setAttribute("errorMessage", errorMessage);
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//        }
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
