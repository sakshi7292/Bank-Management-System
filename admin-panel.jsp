<%@ page import="java.util.*" %>
<%
    List<Map<String, Object>> userList = (List<Map<String, Object>>) request.getAttribute("userList");
    List<Map<String, Object>> txnList = (List<Map<String, Object>>) request.getAttribute("txnList");
%>
<html>
<head><title>Admin Dashboard</title></head>
<body>
<h2>Admin Panel - Users</h2>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Email</th><th>Balance</th></tr>
    <%
        for (Map<String, Object> user : userList) {
    %>
        <tr>
            <td><%= user.get("id") %></td>
            <td><%= user.get("name") %></td>
            <td><%= user.get("email") %></td>
            <td>₹ <%= user.get("balance") %></td>
        </tr>
    <%
        }
    %>
</table>

<h2>Transaction Records</h2>
<table border="1">
    <tr><th>ID</th><th>User ID</th><th>Type</th><th>Amount</th><th>Date</th><th>Details</th></tr>
    <%
        for (Map<String, Object> txn : txnList) {
    %>
        <tr>
            <td><%= txn.get("id") %></td>
            <td><%= txn.get("user_id") %></td>
            <td><%= txn.get("type") %></td>
            <td>₹ <%= txn.get("amount") %></td>
            <td><%= txn.get("date") %></td>
            <td><%= txn.get("details") %></td>
        </tr>
    <%
        }
    %>
</table>
</body>
</html>
