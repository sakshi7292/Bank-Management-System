package com.bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int senderId = (Integer) req.getSession().getAttribute("userId");
        String recipientEmail = req.getParameter("recipient");
        double amount = Double.parseDouble(req.getParameter("amount"));

        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);

            PreparedStatement findRecipient = conn.prepareStatement("SELECT id FROM users WHERE email = ?");
            findRecipient.setString(1, recipientEmail);
            ResultSet rs = findRecipient.executeQuery();
            if (!rs.next()) {
                req.setAttribute("errorMessage", "Recipient not found");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            int recipientId = rs.getInt("id");

            if (recipientId == senderId) {
                req.setAttribute("errorMessage", "Cannot transfer to self");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            PreparedStatement checkBalance = conn.prepareStatement("SELECT balance FROM users WHERE id = ?");
            checkBalance.setInt(1, senderId);
            ResultSet senderRs = checkBalance.executeQuery();
            if (senderRs.next() && senderRs.getDouble("balance") >= amount) {
                PreparedStatement deductSender = conn.prepareStatement("UPDATE users SET balance = balance - ? WHERE id = ?");
                deductSender.setDouble(1, amount);
                deductSender.setInt(2, senderId);
                deductSender.executeUpdate();

                PreparedStatement addRecipient = conn.prepareStatement("UPDATE users SET balance = balance + ? WHERE id = ?");
                addRecipient.setDouble(1, amount);
                addRecipient.setInt(2, recipientId);
                addRecipient.executeUpdate();

                PreparedStatement logSender = conn.prepareStatement("INSERT INTO transactions(user_id, type, amount, details) VALUES (?, 'Transfer', ?, ?)");
                logSender.setInt(1, senderId);
                logSender.setDouble(2, amount);
                logSender.setString(3, "Transferred to: " + recipientEmail);
                logSender.executeUpdate();

                PreparedStatement logRecipient = conn.prepareStatement("INSERT INTO transactions(user_id, type, amount, details) VALUES (?, 'Received', ?, ?)");
                logRecipient.setInt(1, recipientId);
                logRecipient.setDouble(2, amount);
                logRecipient.setString(3, "Received from: " + req.getSession().getAttribute("userName"));
                logRecipient.executeUpdate();

                conn.commit();
                res.sendRedirect("dashboard.jsp");
            } else {
                req.setAttribute("errorMessage", "Insufficient balance");
                req.getRequestDispatcher("error.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Transfer failed: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}