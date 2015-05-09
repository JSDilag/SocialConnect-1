
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            DBConnection.ExecQuery("delete from LikesPost where PostID="
              + session.getAttribute("PostID").toString()+" and CustomerID=" + ID +")");
            session.setAttribute("PostID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
