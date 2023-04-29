<%-- 
    Document   : PatientReg
    Created on : Mar 13, 2020, 12:01:31 PM
    Author     : shahnawaz khan
--%>

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
            String name=request.getParameter("name");
            String dob=request.getParameter("dob");
            String address=request.getParameter("address");
            String  gender=request.getParameter("gender");
            String contact=request.getParameter("contact");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
            String s="insert into patients values(?,?,?,?,?,?,?)";
            PreparedStatement p=cn.prepareStatement(s);
            p.setString(1,name);
            p.setString(2,dob);
            p.setString(3,address);
            p.setString(4,gender);
            p.setString(5,contact);
            p.setString(6,email);
            p.setString(7,password);
            
            int i=p.executeUpdate();
            if(i>0)
            {
               %>
               <jsp:forward page="PatientLogin.jsp"></jsp:forward>
               <%
            }
            else
            {
                %>
                <jsp:include page="PatientRegister.jsp"></jsp:include>
                <%
            }
        %>
    </body>
</html>
