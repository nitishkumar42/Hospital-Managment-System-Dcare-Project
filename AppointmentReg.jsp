<%-- 
    Document   : AppointmentReg
    Created on : Mar 13, 2020, 12:33:10 PM
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
            String email=request.getParameter("email");
            String contact=request.getParameter("contact");
            String age=request.getParameter("contact");
            String day=request.getParameter("day");
            String specialty=request.getParameter("specialty");
            String description=request.getParameter("description");
            String docid=request.getParameter("docid");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
            String s="insert into appointment values(?,?,?,?,?,?,?,?)";
            PreparedStatement p=cn.prepareStatement(s);
            p.setString(1,name);
            p.setString(2,email);
            p.setString(3,contact);
            p.setString(4,age);
            p.setString(5,day);
            p.setString(6,specialty);
            p.setString(7,description);
            p.setString(8,docid);
            
            int i=p.executeUpdate();
            if(i>0)
            {
                %>
                <jsp:forward page="PatientViewAppointment.jsp"></jsp:forward>
                <%
            }
            else
            {
                %>
                <jsp:include page="PatientHome.jsp"></jsp:include>
                <%
            }
        %>
    </body>
</html>
