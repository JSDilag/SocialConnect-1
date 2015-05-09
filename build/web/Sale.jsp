
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="javax.swing.JOptionPane"%>

<html lang="en">
   <body style="background-color: #E8D830">

<%

    String Id = session.getAttribute("login").toString();
    String query;
    java.sql.ResultSet rs;
    java.sql.ResultSet cs;

    if(session.getAttribute("ItemName") != null && session.getAttribute("AdID") !=null)
    {    String ItemName = session.getAttribute("ItemName").toString();
         String AdId = session.getAttribute("AdID").toString();
 
                  query= "SELECT MAX(TransactionID) FROM Sale";
                  rs = DBConnection.ExecQuery(query);
                  String z = "0";
                  if(rs.next())        
                      z= rs.getString(1);
                  int y = Integer.parseInt(z) + 1;
                  int quantity = 0;
                  query= "SELECT AccountNumber FROM Account WHERE CustomerID="+Id;              
                  rs = DBConnection.ExecQuery(query);
                  if(rs.next())
                  {  query = "SELECT A.Quantity FROM Sale S, Advertisement A WHERE S.AdvertisementID= A.AdvertisementID AND A.AdvertisementID="+AdId;
                     cs = DBConnection.ExecQuery(query);
                     if(cs.next())
                     {  quantity = Integer.parseInt(cs.getString(1));
                         if(quantity > 0 )
                        {   // query = "INSERT INTO Sale VALUES ("+ y+", '2015-05-07', "+AdId+", 1, "+rs.getString(1);
                            //DBConnection.ExecUpdateQuery(query);
                            query = "INSERT INTO transactionsapproval VALUES ("+ y+", '2015-05-07', "+AdId+", 1, "+rs.getString(1);
                            DBConnection.ExecUpdateQuery(query);
                            quantity--;
                            query = "UPDATE Advertisement SET Quantity= "+quantity+" WHERE AdvertisementID = "+AdId;
                            DBConnection.ExecUpdateQuery(query);   
                                 response.sendRedirect("saleSuccessful.jsp");
                        } else out.print("Error making sale, 0 quantity");        
                     } else out.print("Error making sale, 0 quantity");
                      
                  } 
    ;}  else { out.print("Error making sale, no account");
                    ;}   
    
            
    
%>   <a href="CustomerHomepage.jsp">Return</a>    
    </body>
</html>