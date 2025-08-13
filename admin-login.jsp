<%@ page contentType="text/html" %>
<html>
<head>
    <title>Admin Login - SecureBank</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #2c3e50, #4ca1af);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .admin-box {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        .admin-box h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .admin-box input[type="text"],
        .admin-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .admin-box input[type="submit"] {
            background-color: #2980b9;
            border: none;
            color: white;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .admin-box input[type="submit"]:hover {
            background-color: #1e6aa9;
        }

        .admin-brand {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #2980b9;
        }

        .admin-subtext {
            font-size: 13px;
            color: gray;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
    <div class="admin-box">
        <div class="admin-brand">SecureBank Admin</div>
        <div class="admin-subtext">Administrator Access Only</div>

        <h2>Admin Login</h2>
        <form action="admin-login" method="post">
            <input type="text" name="username" placeholder="Admin Username" required>
            <input type="password" name="password" placeholder="Admin Password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
