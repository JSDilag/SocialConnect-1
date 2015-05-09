
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            String query = "INSERT INTO LikesPost VALUES (" 
            + request.getParameter("PostID") +", " +  ID+")";
            
            DBConnection.ExecUpdateQuery(query);
            session.setAttribute("PostID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
