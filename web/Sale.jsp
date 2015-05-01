
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%

    String Ids = session.getAttribute("login").toString();
    int Id = Integer.parseInt(Ids);
    String query = "SELECT H.AccountID FROM HasAccount H WHERE CustomerID="+Id;
    java.sql.ResultSet rs = DBConnection.ExecQuery(query);
    String ItemName = session.getAttribute("ItemName");
    String AdIdS = session.getAttribute("AdID");

	if ((ItemName!= null) && rs.next() && AdIdS != null)   /*Fields entered and Customer has Account*/
        {   int AdID = Integer.parseInt(AdIdS);

              query = "INSERT INTO Sale VALUES ("+ 200010009+", '2015-05-07', "+AdID+", 1, 90010101)";
               	rs = DBConnection.ExecQuery(query);
		        if (rs.next())
                  { 
                    response.sendRedirect("saleSuccessful.jsp");
		          } 
                else { out.print("Error making sale");
                     response.sendRedirect("CustomerHomepage.jsp");               
                }
        }   
  else {out.print("ItemName field missing or you have no account");
        }      
    
%>