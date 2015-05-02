<!--<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>SocialConnect Registration Page</title>
        <link rel="shortcut icon" href="images/favicon-32x32.png" type="image/x-icon">
        <link rel="icon" href="images/favicon-32x32.png" type="image/x-icon">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/main.css" rel="stylesheet">
    </head>
    <style>
        body {
            background-color: lightblue;
        }
    </style>
    <body >


        <div id="Reg" style="padding: 30px; padding-left: 300px; padding-right: 300px;">
            <div style="background-color: white; border-style: solid;">
                <div class="content">
                    <div class="header">
                        <h1 class="text-center">Registration</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form col-md-12 center-block" action="RegistrationSuccess.jsp" method="post">
                            <div class="form-group" >
                                <h4 style="display:inline;">First Name </h4>
                                <input name="FirstName" type="text" class="form-control input-lg"  placeholder="e.g. Sayyed"autofocus>
                            </div>
                            <div class="form-group">
                                <h4 style="display:inline;">Last name </h4>
                                <input name="LastName" type="text" class="form-control input-lg" placeholder="e.g. Best">
                            </div>
                            <div class="form-group">
                                <h4 style="display:inline;">Sex </h4>
                                <div class="row">
                                    <div class="btn-group" data-toggle="buttons">
                                        <div style="padding-left: 40px;">
                                            <label class="radio">
                                                <input type="radio" id="Sex" name="Sex" value="M" /> M
                                            </label> 
                                            <label class="radio">
                                                <input type="radio" id="Sex" name="Sex" value="F" /> F
                                            </label>  
                                        </div>
                                    </div>
                                </div>   
                            </div>
                            <div class="form-group">                          	
                                <h4 style="display:inline;">Email </h4>
                                <input name="Email" type="text" class="form-control input-lg" placeholder="e.g. Alex@blah.com" >
                            </div>
                            <div class="form-group">                          	
                                <h4 style="display:inline;">Date Of Birth </h4>
                                <input name="DOB" type="text" class="form-control input-lg" placeholder="e.g. 1988-10-10" >
                            </div>                        
                            <div class="form-group">                          	
                                <h4 style="display:inline;">Address </h4>
                                <input name="Address" type="text" class="form-control input-lg"  placeholder="e.g. 71 MajorApt, Oak St.">
                            </div>                        
                            <div class="form-group">                          	
                                <h4 style="display:inline;">City </h4>
                                <input name="City" type="text" class="form-control input-lg" placeholder="e.g. Stony Brook" >
                            </div>                        
                            <div class="form-group">                          	
                                <h4 style="display:inline;">State </h4>
                                <input name="State" type="text" class="form-control input-lg" placeholder="e.g. NY" >
                            </div>                   
                            <div class="form-group">                          	
                                <h4 style="display:inline;">ZipCode </h4>
                                <input name="ZipCode" type="text" class="form-control input-lg" placeholder="e.g. 11790" >
                            </div>
                            <div class="form-group">                          	
                                <h4 style="display:inline;">Telephone </h4>
                                <input name="Telephone" type="text" class="form-control input-lg" placeholder="e.g. 4314649886" >
                            </div>
                            <div class="form-group">   
                                <h4 style="display:inline;">Preferences </h4>
                                <div style="padding-left: 30px;">
                                    <label class="checkbox">
                                        <input type="checkbox" name="Preferences" value="cars">cars
                                    </label>     
                                    <label class="checkbox">
                                        <input type="checkbox" name="Preferences" value="life insurance">life insurance
                                    </label>   
                                    <label class="checkbox">
                                        <input type="checkbox" name="Preferences" value="clothing">clothing
                                    </label> 
                                    <label class="checkbox">
                                        <input type="checkbox" name="Preferences" value="toys">toys
                                    </label>   
                                </div>    

                            </div>
                            <div class="form-group">                          	
                                <h4 style="display:inline;">Password </h4>
                                <input name="Password" type="password" class="form-control input-lg" placeholder="e.g. admin" >
                                <div class="form-group"> 
                                    <center>                         	
                                        <a class="btn btn-large btn-info" href="RegistrationSuccess.jsp">Register</a>
                                    </center>
                                </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                        </div>	
                    </div>
                </div>		      
                <a href="index.html">Return</a>
            </div> 
        </div>


    </body>
</html>