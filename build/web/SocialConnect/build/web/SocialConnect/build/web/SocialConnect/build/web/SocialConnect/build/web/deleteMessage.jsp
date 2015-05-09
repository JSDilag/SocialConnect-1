
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

<%   String select[] = request.getParameterValues("MessageCheck"); 
     if(select != null)
     {           if (select.length != 0) 
                  {  int rs;
                     String z = select[0];
                      for (int i = 0; i < select.length; i++) 
                     {   z="delete from Message where MessageID="+select[i];
                         DBConnection.ExecUpdateQuery(z);
                     }
                  }
     }
     else
      %> <script> alert("Nothing selected"); </script>     
      <a href="Messages.jsp">Return</a>
                        