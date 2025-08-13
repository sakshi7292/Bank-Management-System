package com.bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int userId = (Integer) req.getSession().getAttribute("userId");
        double amount = Double.parseDouble(req.getParameter("amount"));

        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);

            PreparedStatement checkBalance = conn.prepareStatement("SELECT balance FROM users WHERE id = ?");
            checkBalance.setInt(1, userId);
            ResultSet rs = checkBalance.executeQuery();
            if (rs.next() && rs.getDouble("balance") >= amount) {
                PreparedStatement ps1 = conn.prepareStatement("UPDATE users SET balance = balance - ? WHERE id = ?");
                ps1.setDouble(1, amount);
                ps1.setInt(2, userId);
                ps1.executeUpdate();

                PreparedStatement ps2 = conn.prepareStatement("INSERT INTO transactions(user_id, type, amount, details) VALUES (?, 'Withdraw', ?, ?)");
                ps2.setInt(1, userId);
                ps2.setDouble(2, amount);
                ps2.setString(3, "Withdrawn from account");
                ps2.executeUpdate();

                conn.commit();
                res.sendRedirect("dashboard.jsp");
            } else {
                req.setAttribute("errorMessage", "Insufficient balance");
                req.getRequestDispatcher("error.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Withdraw failed: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}