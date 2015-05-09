
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>


    <% String ID = session.getAttribute("login").toString();
        String query;
        int rs;
       String commentID = session.getAttribute("CommentID").toString(); 
    %>
    
            <%if(commentID != null) 
              {   query="UPDATE Comment SET Content="+request.getParameter("Editcomment")+" WHERE CommentID="+
                commentID;
                  DBConnection.ExecUpdateQuery(query);
                    session.setAttribute("CommentID", null); 
                    response.sendRedirect("CustomerHomepage.jsp");
              } 
            else 
            {  out.print("Error CommentID is null");
            }
           %>
   