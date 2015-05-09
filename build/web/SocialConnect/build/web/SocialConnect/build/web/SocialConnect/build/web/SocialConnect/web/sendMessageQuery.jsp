
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

            <%  String ID = session.getAttribute("login").toString();
                String subject = request.getParameter("MsgSubject");
                String content = request.getParameter("MsgContent");
                String receiver = request.getParameter("MsgReceiverID");
                if (subject != null && content != null && receiver != null) 
                  {   java.sql.ResultSet js = DBConnection.ExecQuery("SELECT MAX(MessageID) FROM Message");
                      String z = "0";
                      
                      if(js.next())
                          z = js.getString(1);
                      DBConnection.ExecUpdateQuery("insert into Message values ("+Integer.parseInt(z)+1+", '2015-05-07', '"+subject+"', '"
                                                 +content+"', "+ID+", "+receiver+")");
                    %> <script> alert("Message Sent"); </script>  
                        <a href="Messages.jsp">Return</a>
                    <% 
                   
                  }
                else 
                {   %> <script> alert("One or more fields missing"); </script> 
                <a href="sendMessage.jsp">Return</a>
               <%     
                } %>        
