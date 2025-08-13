<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Banking Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f9;
        }

        /* Top navbar */
        .navbar {
            background-color: #2c3e50;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .navbar form {
            margin: 0;
        }

        .navbar input[type="submit"] {
            background-color: #e74c3c;
            border: none;
            padding: 8px 16px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .container {
            padding: 40px 60px;
        }

        .welcome {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            padding: 25px 20px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.15);
        }

        .card form {
            margin: 0;
        }

        .card input[type="submit"] {
            background-color: #2980b9;
            border: none;
            padding: 10px 20px;
            color: white;
            font-size: 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .card input[type="submit"]:hover {
            background-color: #3498db;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h1>Banking Dashboard</h1>
        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>

    <div class="container">
        <div class="welcome">
            👋 Welcome, <strong><%= session.getAttribute("userName") %></strong>!
        </div>

        <div class="services">
            <div class="card">
                <form action="deposit.jsp" method="get">
                    <input type="submit" value="💰 Deposit Money">
                </form>
            </div>

            <div class="card">
                <form action="withdraw.jsp" method="get">
                    <input type="submit" value="🏧 Withdraw Money">
                </form>
            </div>

            <div class="card">
                <form action="transfer.jsp" method="get">
                    <input type="submit" value="💳 Transfer Money">
                </form>
            </div>

            <div class="card">
                <form action="transactions" method="get">
                    <input type="submit" value="📄 Transaction History">
                </form>
            </div>
        </div>
    </div>

</body>
</html>
