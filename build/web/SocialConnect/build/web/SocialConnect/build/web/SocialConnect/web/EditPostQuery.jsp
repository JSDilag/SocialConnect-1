
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

    <% String ID = session.getAttribute("login").toString();
        String query;
        int rs;
       String postID = session.getAttribute("PostID").toString(); 
    %>
        <% if(postID != null) 
            {   query="UPDATE Post SET Content= '"+request.getParameter("Editpost")+"' WHERE PostID="+
                postID;
                DBConnection.ExecUpdateQuery(query);
                session.setAttribute("PostID", null);
                response.sendRedirect("CustomerHomepage.jsp");
            } 
           else 
           {  out.print("Error with PostID"); 
           }
          %> 