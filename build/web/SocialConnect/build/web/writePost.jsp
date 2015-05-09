
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
   
        <%  
            if(request.getParameter("MyPost") != null) 
            {        String ID = session.getAttribute("login").toString();
                    java.sql.ResultSet js = DBConnection.ExecQuery("SELECT MAX(PostID) FROM Post");
                    String z = "0";
                    if(js.next())
                        z=js.getString(1);
                    int thePostID=Integer.parseInt(z)+1;
                    String query = "INSERT INTO Post VALUES ("+thePostID+" , '2015-05-07', '" 
                            + request.getParameter("MyPost") + "', 0, " + ID + ", 6900)";
                    DBConnection.ExecUpdateQuery(query);
                 DBConnection.ExecUpdateQuery("INSERT INTO Contains VALUES (6900, "+thePostID+" )");
                 DBConnection.ExecUpdateQuery("INSERT INTO Writes VALUES ("+thePostID+" , " + ID);
                 response.sendRedirect("CustomerHomepage.jsp");
            }
            else{
            %> <script> alert("Error making post"); </script>
            <%
                  } 
         %>
