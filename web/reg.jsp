
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Result</title>
    <script>
        function RegFailed() {
            alert("Username already exists.");
            window.location = "register.html";
        }
        
        function RegPassed() {
            alert("You have succesfully registered.");
            window.location = "index.html";
        }
    </script>
</head>
<body>

<%
 
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String userName = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    try {
        
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3500/question04", "anup", "root");

        String checkUserQuery = "SELECT COUNT(*) AS userCount FROM Users WHERE username=?";
        PreparedStatement checkUserStmt = conn.prepareStatement(checkUserQuery);
        checkUserStmt.setString(1, userName);
        rs = checkUserStmt.executeQuery();
        rs.next();
        int userCount = rs.getInt("userCount");
        if (userCount > 0) {
            out.println("<script>RegFailed();</script>");// Redirect to the registration page
        } else {
            stmt = conn.createStatement();
            String sqlTable = "CREATE TABLE IF NOT EXISTS Users (" +
                              "id INTEGER NOT NULL AUTO_INCREMENT, " +
                              "firstname VARCHAR(255), " +
                              "lastname VARCHAR(255), " +
                              "username VARCHAR(255), " +
                              "password VARCHAR(255), " +
                              "PRIMARY KEY (id))";
            stmt.executeUpdate(sqlTable);

            String sqlInsert = "INSERT INTO Users (firstname, lastname, username, password) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, userName);
            pstmt.setString(4, password);

            int rowsAffected = pstmt.executeUpdate();
            if(rowsAffected > 0) {
                out.println("<script type='text/javascript'>RegPassed();</script>");
            } 
        }
        
        String updateQuery = "UPDATE Users SET lastname = 'Sharma' WHERE id = '7'";
        try (Statement updateStatement = conn.createStatement()) {
            updateStatement.executeUpdate(updateQuery);
        }
        
        String deleteQuery = "DELETE FROM Users WHERE id = '4'";
        try (Statement deleteStatement = conn.createStatement()) {
            deleteStatement.executeUpdate(deleteQuery);
        }
        
    }catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
    }

%>

</body>
</html>
