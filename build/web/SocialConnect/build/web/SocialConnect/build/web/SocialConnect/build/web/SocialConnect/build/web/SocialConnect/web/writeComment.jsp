
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  String ID = session.getAttribute("login").toString();
            java.sql.ResultSet js = DBConnection.ExecQuery("SELECT MAX(CommentID) FROM Comment");
            String z = "0";
            if(js.next())
                z=js.getString(1);
            int theCommentID = Integer.parseInt(z)+1;
            if(request.getParameter("MyComment") != null && session.getAttribute("PostID") != null )
            {    DBConnection.ExecUpdateQuery("INSERT INTO Comment VALUES ("+ theCommentID 
                +", '2015-05-07', '" + request.getParameter("MyComment") + "', " + ID
               + ", " + session.getAttribute("PostID").toString() + ")");
               DBConnection.ExecUpdateQuery("INSERT INTO Gets VALUES ("+theCommentID +", "
                       + session.getAttribute("PostID").toString() + ")");
               DBConnection.ExecUpdateQuery("INSERT INTO Makes VALUES ("+theCommentID +", " + ID + ")");
               session.setAttribute("PostID",null );
             response.sendRedirect("CustomerHomepage.jsp");
            } 
            else
            { out.print("Error field missing");
            
            }   
         %>
