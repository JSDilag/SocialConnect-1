
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            java.sql.ResultSet js = DBConnection.ExecQuery("SELECT MAX(CommentID) FROM Comment");
            String z = "0";
            if(js.next())
                z=js.getString(1);
            int theCommentID = Integer.parseInt(z)+1;
            String myCommentContent = request.getParameter("MyComment");
            String thePostID = request.getParameter("PostID");
            
            
            if(myCommentContent != null && thePostID != null )
            {    DBConnection.ExecUpdateQuery("INSERT INTO Comment VALUES ("+ theCommentID 
                +", '2015-05-07', '" + myCommentContent + "', " + ID
               + ", " + thePostID);
               DBConnection.ExecUpdateQuery("INSERT INTO Gets VALUES ("+theCommentID +", "
                       + thePostID);
               DBConnection.ExecUpdateQuery("INSERT INTO Makes VALUES ("+theCommentID +", " + ID);
               session.setAttribute("PostID",null );
             response.sendRedirect("CustomerHomepage.jsp");
            } 
            else
            { out.print("Error field missing");
              %>  <a href="CustomerHomepage.jsp">Return</a>
         <%   }   
         %>
