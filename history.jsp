<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<String> transactions = (List<String>) request.getAttribute("transactions");
%>
<html>
<head>
    <title>Transaction History - SecureBank</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #2c3e50;
            color: white;
            padding: 15px 30px;
            font-size: 20px;
        }

        .container {
            background-color: white;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 10px;
            width: 80%;
            max-width: 700px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
        }

        .container h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        ul.txn-list {
            list-style: none;
            padding: 0;
        }

        ul.txn-list li {
            background-color: #f2f2f2;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 10px;
            font-size: 14px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .no-data {
            color: #888;
            font-style: italic;
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            background-color: #2980b9;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #1e6aa9;
        }
    </style>
</head>
<body>

    <div class="navbar">
        💳 SecureBank - Transaction History
    </div>

    <div class="container">
        <h2>Your Recent Transactions</h2>

        <ul class="txn-list">
        <%
            if (transactions != null && !transactions.isEmpty()) {
                for (String txn : transactions) {
        %>
                    <li><%= txn %></li>
        <%
                }
            } else {
        %>
            <li class="no-data">No transactions found.</li>
        <%
            }
        %>
        </ul>

        <a class="back-link" href="dashboard.jsp">⬅ Back to Dashboard</a>
    </div>

</body>
</html>
