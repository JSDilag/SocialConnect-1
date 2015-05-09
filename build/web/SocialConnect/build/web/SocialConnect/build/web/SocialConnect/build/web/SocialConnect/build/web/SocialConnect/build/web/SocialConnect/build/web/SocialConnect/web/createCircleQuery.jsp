
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

            <%  
                String ID = session.getAttribute("login").toString();
                String Query;
               String circleID= request.getParameter("circleID"); 

               String circleName= request.getParameter("circleName");
               String circleType= request.getParameter("circleType");
            
                    if (!(circleID.trim().equals("")) && (!(circleName.trim().equals(""))) && (!(circleType.trim().equals(""))))
                    {   
                        Query="INSERT INTO Circle VALUES ("+circleID+", '"+circleName+"', '"+circleType+"', "+ID+")";
                        DBConnection.ExecUpdateQuery(Query);
                        out.print("Circle created");
                        DBConnection.ExecUpdateQuery("INSERT INTO Owns VALUES ("+circleID+", "+ID+")");
                        DBConnection.ExecUpdateQuery("INSERT INTO CircleMembership VALUES ("+ID+", "+circleID+")");
                        %> <script> alert("Circle created"); </script>   
                 <%   }
                  else
                  {   out.println();out.println();out.println();out.println();out.println();
                      out.print("\n"+"\n"+"\n"+"One or more fields are missing");
                  }  
              %>      
              <br><br><br><br>  
            <a href="Circles.jsp">Return</a>  
   
