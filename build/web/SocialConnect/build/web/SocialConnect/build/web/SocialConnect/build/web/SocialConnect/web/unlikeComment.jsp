
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecQuery("delete from LikesComment where CommentID=" 
            + session.getAttribute("CommentID").toString() +" and CustomerID=" +  ID+")");%>"
            session.setAttribute("CommentID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
