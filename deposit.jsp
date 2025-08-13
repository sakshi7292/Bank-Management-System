<%@ page session="true" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Deposit Money - SecureBank</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #00b09b, #96c93d);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .deposit-box {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        .deposit-box h2 {
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .deposit-box input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .deposit-box input[type="submit"] {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .deposit-box input[type="submit"]:hover {
            background-color: #219150;
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

    <div class="deposit-box">
        <h2>💰 Deposit Money</h2>
        <form action="deposit" method="post">
            <input type="number" name="amount" placeholder="Enter amount (₹)" step="0.01" required>
            <input type="submit" value="Deposit Now">
        </form>
        <a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>
    </div>

</body>
</html>
