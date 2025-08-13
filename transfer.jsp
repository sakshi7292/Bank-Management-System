<%@ page session="true" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Transfer Money - SecureBank</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #43cea2, #185a9d);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .transfer-box {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        .transfer-box h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .transfer-box input[type="email"],
        .transfer-box input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .transfer-box input[type="submit"] {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .transfer-box input[type="submit"]:hover {
            background-color: #1e6aa9;
        }

        .back-link {
            margin-top: 15px;
            display: inline-block;
            font-size: 14px;
            color: #2980b9;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="transfer-box">
        <h2>💸 Transfer Money</h2>
        <form action="transfer" method="post">
            <input type="email" name="recipient" placeholder="Recipient's Email" required>
            <input type="number" name="amount" placeholder="Amount (₹)" step="0.01" required>
            <input type="submit" value="Transfer Now">
        </form>
        <a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
