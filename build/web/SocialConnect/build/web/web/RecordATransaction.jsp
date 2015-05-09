
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Record a Transaction</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/employee.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <header>
            <h1>Social Connect</h1>
            <h2>Record transaction</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form>
            
            <div class="form-group">
                <label for="inputAdID">Advertisement ID</label>
                <input type="text" class="form-control" id="inputAdID" name="adid">
            </div>
            <div class="form-group">
                <label for="inputDate">Quantity</label>
                <input type="number" class="form-control" id="inputQuantity" name="quantity">
            </div>
            <div class="form-group">
                <label for="inputAccountNumber">Account Number</label>
                <input type="text" class="form-control" id="inputAccountNumber" name="accountnumber">
            </div>
            <div class="form-group">
                <label for="inputDate">Date</label>
                <input type="date" class="form-control" id="inputDate" name="date">
            </div>
            <button>Record</button>
            <input type="button" value="SUBMIT">
        </form>
        
        <%
            String accountNumber = request.getParameter("");
            String quantity = request.getParameter("");
            String totalPrice = request.getParameter("");
            String dateTime = request.getParameter("");
        %>
    </body>
</html>
