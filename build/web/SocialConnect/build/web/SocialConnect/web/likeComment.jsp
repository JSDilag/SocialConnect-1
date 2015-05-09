
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            String query = "INSERT INTO LikesComment VALUES (" 
            + request.getParameter("CommentID") +", " +  ID+")";
            DBConnection.ExecUpdateQuery(query);
            session.setAttribute("CommentID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
