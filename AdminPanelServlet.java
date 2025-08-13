package com.bank;

import java.io.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin-panel")
public class AdminPanelServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            res.sendRedirect("admin-login.jsp");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            List<Map<String, Object>> users = new ArrayList<>();
            List<Map<String, Object>> transactions = new ArrayList<>();

            Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery("SELECT id, name, email, balance FROM users");
            while (rs1.next()) {
                Map<String, Object> user = new HashMap<>();
                user.put("id", rs1.getInt("id"));
                user.put("name", rs1.getString("name"));
                user.put("email", rs1.getString("email"));
                user.put("balance", rs1.getDouble("balance"));
                users.add(user);
            }

            Statement stmt2 = conn.createStatement();
            ResultSet rs2 = stmt2.executeQuery("SELECT * FROM transactions ORDER BY id DESC");
            while (rs2.next()) {
                Map<String, Object> txn = new HashMap<>();
                txn.put("id", rs2.getInt("id"));
                txn.put("user_id", rs2.getInt("user_id"));
                txn.put("type", rs2.getString("type"));
                txn.put("amount", rs2.getDouble("amount"));
                txn.put("date", rs2.getTimestamp("date"));
                txn.put("details", rs2.getString("details"));
                transactions.add(txn);
            }

            req.setAttribute("userList", users);
            req.setAttribute("txnList", transactions);
            req.getRequestDispatcher("admin-panel.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Failed to load admin panel: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}