
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecQuery("INSERT INTO LikesComment VALUES (" 
            + session.getAttribute("CommentID").toString() +" and CustomerID=" +  ID+")");
            session.setAttribute("CommentID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
