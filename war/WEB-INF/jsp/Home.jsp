
<!DOCTYPE html>
<html lang="en">
<head>
  <title>TimeTable</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>


  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--   <link href="css/main.css" rel="stylesheet" type="text/css" />
 --><script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/validate.min.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<style>
.jumbotron {
    position: relative;
    background: #000 url("../kcgimages/createlogo.png") center center;
    width: 100%;
    height:234px;
    background-size: cover;
    overflow: hidden;
}

h4{
color:blue;
}
h5
{
color:white;
}

</style>
<script>
$(document).ready(function() {
	$(".msg").fadeOut();
}
</script>
</head>
<body>
  <div class="jumbotron">
<img src="kcgimages/logo_text.gif" border="0" alt="logo"style="position: relative;top:-50px;left:400px;height:100px" />
<nav class="navbar navbar-inverse" style="top:-52px;left:0px;backgrouond-color:#f8cd23">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
      <img src="kcgimages/4.png" border="0" alt="logo"style="position: relative" height= "30px" width="30px">
    </a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
         <!--   <li><a href="#aboutus">About Us</a></li>
             <li><a href="#course">Course</a></li>
        <li><a href="#contactus">Contact Us</a></li>
        <li><a href="#alumni">Alumni</a></li>  -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#register" data-toggle="modal" data-target="#register">
        <span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#login" data-toggle="modal" data-target="#login">
        <span class="glyphicon glyphicon-log-in"></span> Login</a>
        </li>
      </ul>
    </div>
  </div>
   <h5 class="msg" style="top:50px"> <em>  ${message}</em>     </h5>
</nav>
</div>
  

</div>


<!--************************************ Slidin in home page *******************************************************-->
<div id = "carousel" class = "carousel slide" data-ride="carousel" style="position:absolute;top:200px">
	<ol class = "carousel-indicators">
	<li data-target = "#carousel" data-slide-to = "0" class = "active" ></li>
	<li data-target = "#carousel" data-slide-to = "1"></li>
	<li data-target = "#carousel" data-slide-to = "2"></li>

	</ol>
	 <div class = "carousel-inner">
		<div class = "item">
		<img src="images/image1.jpg" class="img-responsive" alt="image">
		</div>
	
		<div class = "item">
		<img src="images/opinion1.jpg" class="img-responsive" alt="image" width="1500px">
		</div>
		<div class = "item active">
		<img src="images/sample.jpg" class="img-responsive" alt="image" width="1500px">
		</div> <div class = "carousel-inner">
	
	</div>
	 		<a class = "carousel-control left" href = "#carousel" data-slide = "prev">
			<span class - "icon-prev"></span>
			</a>
			<a class = "carousel-control right" href ="#carousel" data-slide = "next">
			<span class - "icon-next"></span>
			</a>
</div>
</div>

	<!--***********************Div Modal for register***************************************** -->
 <div class="modal fade" id="register" role="dialog">
	<div class="modal-dialog">
	 <div class="modal-content" style="background-color:white">
	  
     
	 <div class="container">
	 <form id="registerform" class="blocks" action="/add" method="post" novalidate="novalidate">
			
			<p style="left:200px;color:#2699ef;font-size:16px"><em>Register Here</em></p>
			
			<p>
				<label>Name:</label>
				<input type="text" class="text" name="name" />
			</p>
			
			<p>
				<label>Your e-mail:</label>
				<input type="text" class="text" name="email" />
			</p>
			<p>
				<label>Username:</label>
				<input type="text" class="text" name="username" />
			</p>
			<p>
				<label>Password:</label>
				<input type="password" class="text" name="password" />
			</p>
		
			
			<p>
				<select class="text gender" name="gender" tabindex="7"
							 id="select_gender">
							<option value="0">Select Gender..</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="others">Other</option>
			</select>
			</p>
				<div class="parentoption">
			<p>
							<select class=" role text" id="select_role" name="designation"
								tabindex="8">
								<option value="0">Select Designation..</option>
								<option value="student">Student</option>
								<option value="staff">Staff</option>
								<option value="admin">Admin</option>
							</select><br> <br><p>
							
					
				</div>
	<div class="childoption">
	<p>
					<p><select
						name="branch" class="text gender" id="select-branch" class="select-style" required=""
						tabindex="9">
						<option value="0">Select Branch</option>
						<option value="-1">Other</option>
						
						<option value="bca">BCA</option>
						<option value="bsc">BSC</option>
						<option value="mca">MCA</option>
						<option value="msc">MSC</option>
					</select></p> 
					<p> <select id="year"
						name="year" class="select-style gender text" required="" tabindex="10">
												<option value="0">Select Year</option>
												<option value="-1">Other</option>
						
						<option value="firstYear">I</option>
						<option value="secondYear">II</option>
						<option value="thirdYear">III</option>
					</select></p>
					<p>
					<select
						id="semester" name="semester" class="select-style gender text" required=""
						tabindex="11">
												<option value="0">Select Semester</option>
												<option value="-1">Other</option>
						
						<option value="firstSemester">I</option>
						<option value="secondSemester">II</option>
						<option value="thirdSemester">III</option>
						<option value="fourthSemester">VI</option>
						<option value="fiftSemester">V</option>
						<option value="sixthSemester">VI</option>
					</select>
					</p>
	</div>
			<br>
					<br>
			<p>
				<label>&nbsp;</label>
			<div class="bfooter">
			
						<input type="submit" class=" btn-info btn-lg " name="submit" id="submit"
							tabindex="14" value="Sign me up!"style="padding:2px">
				<a class=" btn-danger btn-lg" data-dismiss="modal" style="text-decoration:none;padding:5px;border:1px">cancel</a>
				</div>		
			
		</form>
	</div>
</div>
</div>
</div> 

	<!--***********************Div Modal for Login***************************************** -->
 <div class="modal fade" id="login" role="dialog">
	<div class="modal-dialog">
	 <div class="modal-content" style="background-color:white">
	  
     
	 <div class="container">
	 <form id="loginform" class="blocks" action="/you" method="post"novalidate="novalidate">
			<p style="left:150px;color:#2699ef;font-size:16px"><em>Login</em></p>
			<p>
			<p>
				<label>Username:</label>
				<input type="text" class="text textb" id ="Username" name="username" />
			</p>
			<p>
				<label>Password:</label>
				<input type="password" class="text" id = "password"name="password" />
			</p>
		
				<p style="left:50px">
				 <input
							type="radio" name="designation" value="student" checked>Student <input
							type="radio" name="designation" value="staff">Staff <input
							type="radio" name="designation" value="admin">Admin
				</p>	
			
				<label>&nbsp;</label>
		
						<input type="submit" class=" btn-info btn-lg " name="submit" id="submit"
							tabindex="14" value="Login!"style="padding:2px">
				<a class=" btn-danger btn-lg" data-dismiss="modal" style="text-decoration:none;padding:5px;border:1px">cancel</a>
		</form>
		</div><br><br>
		
		
	</div>
</div>
				
</div> 


</body>
</html>
