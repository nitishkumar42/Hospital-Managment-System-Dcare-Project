<%-- 
    Document   : PatientLogDb
    Created on : Jun 19, 2021, 4:37:35 PM
    Author     : SMART
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email =request.getParameter("email");
            String password=request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
            PreparedStatement p=cn.prepareStatement("select * from patients where email=? and password=?");
            p.setString(1,email);
            p.setString(2,password);
            ResultSet r=p.executeQuery();
            if(r.next())
            {
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
