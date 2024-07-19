<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Result</title>
     <script >
        function loginFailed() {
            alert("Username or Password is incorrect.");
            window.location = "index.html";
        }
    </script>
</head>
<body>

<%

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    boolean isValidUser = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3500/question04", "anup", "root");

        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        isValidUser = rs.next();

        if(isValidUser) {
            response.sendRedirect("mypage.jsp"); 
        } else {
            out.println("<script>loginFailed();</script>");
           
        }
    }catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
    } 
    
%>

</body>
</html>
