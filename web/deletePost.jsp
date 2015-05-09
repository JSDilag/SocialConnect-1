
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            String query = "delete from Post where PostID=" 
                    + request.getParameter("PostID")+" and AuthorID=" + ID;
            DBConnection.ExecUpdateQuery(query);
            session.setAttribute("PostID",null);
         response.sendRedirect("CustomerHomepage.jsp");
         %>
