package com.bank;

import java.io.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/transactions")
public class TransactionHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int userId = (Integer) req.getSession().getAttribute("userId");

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM transactions WHERE user_id = ? ORDER BY id DESC");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            List<String> transactions = new ArrayList<>();
            while (rs.next()) {
                String txn = rs.getString("type") + " - Rs. " + rs.getDouble("amount") + " - " + rs.getString("details");
                transactions.add(txn);
            }

            req.setAttribute("transactions", transactions);
            req.getRequestDispatcher("history.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not fetch transaction history: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}