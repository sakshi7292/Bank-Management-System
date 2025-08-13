<%@ page session="true" %>
<%
    session.invalidate();
%>
<html>
<head>
    <title>Logging Out - SecureBank</title>
    <meta http-equiv="refresh" content="2;url=login.jsp">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .logout-box {
            text-align: center;
        }

        .logout-box h2 {
            margin-bottom: 15px;
        }

        .loader {
            border: 5px solid #f3f3f3;
            border-top: 5px solid #ffffff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .redirect-msg {
            font-size: 14px;
            margin-top: 10px;
            color: #eee;
        }
    </style>
</head>
<body>
    <div class="logout-box">
        <h2>Logging you out...</h2>
        <div class="loader"></div>
        <div class="redirect-msg">Redirecting to login page shortly.</div>
    </div>
</body>
</html>
