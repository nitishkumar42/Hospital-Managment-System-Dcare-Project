<%-- 
    Document   : appoint
    Created on : Mar 13, 2020, 11:11:15 AM
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
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String selectoption=request.getParameter("selectopt");
            String phone=request.getParameter("phone");
            String date=request.getParameter("date");
            String time=request.getParameter("time");
            String message=request.getParameter("message");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
            String s="insert into apoint values(?,?,?,?,?,?,?)";
            PreparedStatement p=cn.prepareStatement(s);
            p.setString(1,fname);
            p.setString(2,lname);
            p.setString(3,selectoption);
            p.setString(4,phone);
            p.setString(5,date);
            p.setString(6,time);
            p.setString(7,message);
            
            int i=p.executeUpdate();
            if(i>0)
            {
                %>
                <jsp:forward page="Home.jsp"></jsp:forward>
                <%
            }
            else
            {
                %>
                <jsp:include page="appointment.html"></jsp:include>
                <%
            }
        %>
    </body>
</html>
