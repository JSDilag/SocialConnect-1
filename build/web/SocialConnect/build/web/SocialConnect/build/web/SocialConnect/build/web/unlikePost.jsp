
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecUpdateQuery("delete from LikesPost where PostID="
              + request.getParameter("PostID")+" and CustomerID=" + ID);
            session.setAttribute("PostID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
