
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecQuery("INSERT INTO LikesPost VALUES(" 
            + session.getAttribute("PostID").toString() +", " + ID+")");
            session.setAttribute("PostID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
