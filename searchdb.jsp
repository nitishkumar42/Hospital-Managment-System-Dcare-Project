<%-- 
    Document   : searchdb
    Created on : Jun 19, 2021, 4:53:46 PM
    Author     : SMART
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="orange">
        <table border="1">
            <tr>
                <td style="color:blue">FIRST NAME</td>
                <td style="color:blue">LAST NAME</td>
                <td style="color:blue">DEPARTMENT</td>
                <td style="color:blue">PHONE</td>
                <td style="color:blue">TIME</td>
                <td style="color:blue">DATE</td>
            </tr>
            <%
                String mobile=request.getParameter("mobile");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dcare","root","root");
                String s="select * from apoint where phone="+mobile;
                PreparedStatement p=cn.prepareStatement(s);
                ResultSet r=p.executeQuery();
                if(r.next())
                {
                    %>
                    <tr>
                        <td style="color:red;"><b><%=r.getString("fname") %></b></td>
                        <td style="color:red;"><%=r.getString("lname") %></td>
                        <td style="color:red;"><%=r.getString("selectoption") %></td>
                        <td style="color:red;"><%=r.getString("phone") %></td>
                        <td style="color:red;"><%=r.getString("date") %></td>
                        <td style="color:red;"><%=r.getString("time") %></td>
                    </tr>
                    <%
                }
            %>
            
        </table>
            <br><br><button onclick="window.print()">PRINT</button><br><br>
            <a href="index.html">Home Page</a>
    </body>
</html>
