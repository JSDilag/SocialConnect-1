
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecUpdateQuery("delete from LikesComment where CommentID="+ request.getParameter("CommentID") +" and CustomerID=" +  ID);
            session.setAttribute("CommentID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
