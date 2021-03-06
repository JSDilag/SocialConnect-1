
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create Customer</title>

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
            <h1>SocialConnect</h1>
            <h2>Create Customer</h2>
            <hr>
        </header>
        
        <a href="EmployeeHomepage.jsp" class="right">Return to homepage</a>
        
        <form style="width: 50%;">
            <div class="form-group">
                <label for="inputFirstName">First Name</label>
                <input type="text" class="form-control" id="inputFirstName" name="firstname">
            </div>
            <div class="form-group">
                <label for="inputLastName">Last Name</label>
                <input type="text" class="form-control" id="inputLastName" name="lastname">
            </div>
            <div class="form-group">
                <label for="inputSex">Sex</label>
                <input type="radio" class="form-control" id="inputSex" name="sex" value="M">Male
                <input type="radio" class="form-control" id="inputSex" name="sex" value="F">Female
            </div>
            <div class="form-group">
                <label for="inputEmailAddress">Email Address</label>
                <input type="email" class="form-control" id="inputEmailAddress" name="emailaddress">
            </div>
            <div class="form-group">
                <label for="inputDoB">Date of Birth</label>
                <input type="date" class="form-control" id="inputDoB" name="dob">
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" name="address">
            </div>
            <div class="form-group">
                <label for="inputCity">City</label>
                <input type="text" class="form-control" id="inputCity" name="city">
            </div>
            <div class="form-group">
                <label for="inputState">State</label>
                <input type="text" class="form-control" id="inputState" name="state">
            </div>
            <div class="form-group">
                <label for="inputZipCode">Zip Code</label>
                <input type="number" class="form-control" id="inputZipCode" name="zipcode">
            </div>
            <div class="form-group">
                <label for="inputTelephone">Phone Number</label>
                <input type="tel" class="form-control" id="inputTelephone" name="telephone">
            </div>
            <div class="form-group">
                <label for="inputPreferences">Preferences</label>
                <input type="text" class="form-control" id="inputPreferences" name="preferences">
            </div>
            
            <button>Create</button>
        </form>
    </body>
</html>
