<%@ page contentType="text/html" %>
<html>
<head>
    <title>Bank Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .login-container input[type="email"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .login-container input[type="submit"] {
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

        .login-container input[type="submit"]:hover {
            background-color: #1e6aa9;
        }

        .login-container .link {
            margin-top: 15px;
            display: block;
            font-size: 13px;
            color: #2980b9;
            text-decoration: none;
        }

        .login-container .link:hover {
            text-decoration: underline;
        }

        .brand {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #2980b9;
        }

        .tagline {
            font-size: 13px;
            color: gray;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="brand">SecureBank</div>
        <div class="tagline">Your Trusted Digital Banking Partner</div>

        <h2>Account Login</h2>
        <form action="login" method="post">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>

        <a class="link" href="register.jsp">New user? Register your account</a>
    </div>
</body>
</html>
