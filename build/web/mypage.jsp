<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Response</title>
    <style>
        h1 {
            text-align: center;
            color: #333;
        }
        input[type="button"] {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    
    <h1>Welcome! you have successfully logged in. </h1>
    <input type="button" value="LogOut" onclick="window.location='index.html';"/>
</body>
</html>

