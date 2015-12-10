<%@ page import="java.util.List"%>
<%@ page import="com.miniproject.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="com.miniproject.Mondays" %>
<%@ page import="com.miniproject.Tuesdays" %>
<%@ page import="com.miniproject.Wednesdays" %>
<%@ page import="com.miniproject.Thursdays" %>
<%@ page import="com.miniproject.Fridays" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>TimeTable</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page import="com.miniproject.Users"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%@ page import="com.google.appengine.api.datastore.Entity"%>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>


<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link
	href="twitter-bootstrap-v2\docs\assets\css\bootstrap-responsive.css"
	rel="stylesheet">
<link href="css/main.css" rel="stylesheet" type="text/css" />




<link href="css/default.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/validate.min.js" type="text/javascript"></script>
<script src="js/init.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<script src="js/append.js" type="text/javascript"></script>

<style>
.jumbotron {
	position: relative;
	background: #000 url("../kcgimages/createlogo.png") center center;
	width: 100%;
	height: 234px;
	background-size: cover;
	overflow: hidden;
}
#nav {
    width:400px;
    float:left;
    position:absolute;
    top:150px;
    width:284px;
    height:1100px;
    left:0px;
}
th {
	width: 5px;
}

h4 {
	color: blue;
}

.textw {
	width: 160px;
}
.btns{
left:300px;
}
.form{
left:350px;
	}

</style>

<script>

	

	function showcreationform() {
		document.getElementById('create').style.display = "block";
		document.getElementById('deleteform').style.display = "none";
		document.getElementById('viewtimetable').style.display = "none";

	}

	 function showDeleteform() {
		document.getElementById('deleteform').style.display = "block";
		document.getElementById('viewtimetable').style.display = "none";
		document.getElementById('create').style.display = "none";


	} 
	
	function showUpdateform() {
		document.getElementById('view').style.display = "block";
		document.getElementById('create').style.display = "none";
		document.getElementById('deleteform').style.display = "none";

	}
	

	$(document).ready(function() {
		//$(".msg").fadeOut();

		$(".childoption").hide();
		$(".stafftext").hide();

		$(".parent-option select").change(function() {
			var selectedVal = $(":selected", this).val();
			if (selectedVal == "0") {
				alert("Please select Designation");
				$(".childoption").hide();
				$(".stafftext").hide();
			}
				else if (selectedVal == "student") {
				$(".childoption").show();
				$(".stafftext").hide();
				

			} else if (selectedVal == "staff") {
				$(".childoption").hide();
				$(".stafftext").show();
			} else {
				$(".childoption").hide();
			}
		});
		

		/* $(".select-branch select").click(function() {
			var selectedval = $('#select-branch').find(":selected").text();
			if (selectedval == "0") {
				alert("Please select Branch");
			}
		
	}); */
		/* $(function () {
			  var $field = $("#id_text").attr("name");
			  var $params = {debug:false, rules:{}, messages:{}};
			  $params['rules'][$field] = {"required": true, "rule": ["params"]};
			  $params['messages'][$field] = "error message";
			  $("#createform").validate($params);
			});

	}); */
</script>


</head>
<body>
	<div class="jumbotron">
		<img src="kcgimages/logo_text.gif" border="0" alt="logo"
			style="position: relative; top: -50px; left: 400px; height: 100px" />
		<nav class="navbar navbar-inverse"
			style="top: -52px; left: 0px; backgrouond-color: #f8cd23">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <img src="kcgimages/4.png"
						border="0" alt="logo" style="position: relative" height="30px"
						width="30px">
					</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="/">Home</a></li>
						<li><a href="#aboutus">About Us</a></li>
						<li><a href="#course">Course</a></li>
						<li><a href="#contactus">Contact Us</a></li>
						<li><a href="#alumni">Alumni</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/" data-toggle="modal" data-target="/"> <span
								class="glyphicon glyphicon-user"></span> Logout
						</a></li>

					</ul>
				</div>
			</div>

		</nav>
	</div>
	<div class="container">
	
	
	<div id="nav">
		<p>
			<marquee behavior="alternate" direction="up">
				<img src="kcgimages/imagesprinci.jpg" width="300" height="200"
					alt="Natural" /> <img src="kcgimages/kcgconnect.jpg" width="300"
					height="120" alt="Natural" /> <img src="kcgimages/sports.jpg"
					width="300" height="120" alt="Natural" /> <img
					src="kcgimages/sports1.jpg" width="300" height="120" alt="Natural" />
				<img src="kcgimages/opinion2.jpg" width="300" height="120"
					alt="Natural" /> <img src="kcgimages/opinion1.jpg" width="300"
					height="120" alt="Natural" /> <img src="kcgimages/sports.jpg"
					width="300" height="120" alt="Natural" /> <img
					src="kcgimages/image7.jpg" width="300" height="120" alt="Natural" />

			</marquee>
		</p>

	</div>
		<h5 class="msg" style="top: 50px">
			<em> ${message}</em>
		</h5>
		<div class="btns" style="top: 200px; position: absolute">

			<button type="button" id="btn1" class="btn btn-default"
				onclick="showcreationform()">Create TimeTable</button>
			<button type="button" id="btn2" class="btn btn-default"
				onclick="showUpdateform()">View/Update TimeTable</button>
			<button type="button" id="btn3" class="btn btn-default"
				onclick="showDeleteform()">Delete TimeTable</button>
		
		<br><br>
		   
		   <h5 style="top:50px;color:green"> <em>  ${message}</em>     </h5>
		
		</div>

		
<!------------------------------ form to create an timetable  ------------------------------------------------------>
		
		
		<div id="create" style="display: none;" class="answer_list">
		<div class="form">
			<form method="post" action="/create" name="createform"
				id="createform" onclick="validate()" >

				<div class="parent-option">
					<select class="text select-style role" id="select-role" name="designation"
						tabindex="8" required="" onchange="showReqOption(this)">
						
						<option value="0"selected>Designation..</option>
						<option value="student">Student</option>
						<option value="staff">Staff</option>
					</select><br> <br>
				</div>
				<div class="stafftext">
					<label>Select the staff name here to create timetable</label>
					<select class="text role" id="select-role" name="staffname"
						tabindex="8">
					<option value="0"selected>Select staff name..</option>
						<%
			
		if(request.getAttribute("staffNameList")!=null){
			List<Users> results = 
                           (List<Users>)request.getAttribute("staffNameList");
		//out.println(users);
			//if(!results.isEmpty()){

				for(Users list:results)
				{
				
				%>		
 				<option value="<%=list.getUsername()%>"><%=list.getUsername()%></option>
 				<%
				}
				
				}%>
							</select>
					
				</div>

				<div class="childoption">
					 <select
						name="branch" id="select-branch" class="select-branch text" required=""
						tabindex="9">
						<option value="0">Select Branch</option>
						<option value="bca">BCA</option>
						<option value="bsc">BSC</option>
						<option value="mca">MCA</option>
						<option value="msc">MSC</option>
					</select> <select id="year"
						name="year" class="select-style gender text" required="" tabindex="10">
												<option value="0">Select Year</option>
						
						<option value="firstYear">I</option>
						<option value="secondYear">II</option>
						<option value="thirdYear">III</option>
					</select> <select
						id="semester" name="semester" class="select-style gender text" required=""
						tabindex="11">
						<option value="0">Select Semester</option>
						<option value="firstSemester">I</option>
						<option value="secondSemester">II</option>
						<option value="thirdSemester">III</option>
						<option value="fourthSemester">VI</option>
						<option value="fiftSemester">V</option>
						<option value="sixthSemester">VI</option>
					</select><br><br>
					
				</div>

				<div id="addedRows">
					<div class="showrows" id="showrows">

						<table class="table table-condensed">
							<thead>
								<th>Day</th>
								<th>Hour1</th>

								<th>Hour2</th>

								<th>Hour3</th>

								<th>Hour4</th>

								<th>Hour5</th>

							</thead>
							<tbody>

								<tr id="rowId">
									
								<td><label>Monday</label></td>
									<td><input type="text" id = "id_text" class=" textw" name="monPeriod1"
										 />
									<td><input type="text" id = "id_text" class=" textw" name="monPeriod2"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="monPeriod3"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="monPeriod4"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="monPeriod5"
										required /></td>




								</tr>
								<tr id="rowId">
									
									<td><label>Tuesday</label></td>
									<td><input type="text" id = "id_text" class=" textw" name="tuesPeriod1"
										required />
									<td><input type="text" id = "id_text" class=" textw" name="tuesPeriod2"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="tuesPeriod3"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="tuesPeriod4"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="tuesPeriod5"
										required /></td>





								</tr>
								<tr id="rowId">
									
										<td><label>Wednesday</label></td>
									<td><input type="text" id = "id_text" class=" textw" name="wedPeriod1"
										required />
									<td><input type="text"  id = "id_text" class=" textw" name="wedPeriod2"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="wedPeriod3"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="wedPeriod4"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="wedPeriod5"
										required /></td>






								</tr>
								<tr id="rowId">
								<td><label>Thursday</label></td>
									<td><input type="text" id = "id_text" class=" textw" name="thursPeriod1"
										required />
									<td><input type="text" id = "id_text" class=" textw" name="thursPeriod2"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="thursPeriod3"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="thursPeriod4"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="thursPeriod5"
										required /></td>





								</tr>
								<tr id="rowId">
									
										
									<td><label>Friday</label></td>
									<td><input type="text" id = "id_text" class=" textw" name="friPeriod1"
										required />
									<td><input type="text" id = "id_text" class=" textw" name="friPeriod2"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="friPeriod3"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="friPeriod4"
										required /></td>
									<td><input type="text" id = "id_text" class=" textw" name="friPeriod5"
										required /></td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
				<input type="submit"  style="background-color:#08bfda;padding:5px;width:50px;left:200px" name="submit" id="submit"
					tabindex="14" value="Create"
					style="padding: 2px; background-color: blue;">
				</div>
			</form>
		
		
		</div>
<!------------------------------ form to update an timetable  ------------------------------------------------------>
		
		<div id="view" style="display: none;" class="viewtimetable">
		<div class="form">
			<form method="post" action="/viewtimetable" name="viewtimetable"
				id="viewtimetable">

			

				<div class="parent-option">
				<p>Select the designation to whom you are going to create a timetable here</p>
					<select class="text select-style role" id="select-role" name="designation"
						tabindex="8" required="" onchange="showReqOption(this)">
						
						<option value="0"selected>Designation..</option>
						<option value="student">Student</option>
						<option value="staff">Staff</option>
					</select><br> <br>
				</div>
				<div class="stafftext">
					<label>Select the staff name here to create timetable</label>
					<select class="text role" id="select-role" name="staffname"
						tabindex="8">
					<option value="0"selected>Select staff name..</option>
						<%
			
		if(request.getAttribute("staffNameList")!=null){
				out.println("helllo");
			List<Users> results = 
                           (List<Users>)request.getAttribute("staffNameList");
		//out.println(users);
			//if(!results.isEmpty()){

				for(Users list:results)
				{
					//System.out.println(list.getUsername());
				
		%>		
 				<option value="<%=list.getUsername()%>"><%=list.getUsername()%></option>
 				<%
				}
				
				}%>
					</select>
				</div>

				<div class="childoption">
					 <select
						name="branch" id="select-branch" class="select-style text" required=""
						onchange="showReqOption(this)">
												<option value="0">select branch</option>
						
						<option value="bca">BCA</option>
						<option value="bsc">BSC</option>
						<option value="mca">MCA</option>
						<option value="msc">MSC</option>
					</select> <select id="year"
						name="year" class="select-style gender text" required="" tabindex="10">
												<option value="0">Select Year</option>
						
						<option value="firstYear">I</option>
						<option value="secondYear">II</option>
						<option value="thirdYear">III</option>
					</select> <select
						id="semester" name="semester" class="select-style gender text" required=""
						tabindex="11">
						<option value="0">Select Semester</option>
						<option value="firstSemester">I</option>
						<option value="secondSemester">II</option>
						<option value="thirdSemester">III</option>
						<option value="fourthSemester">VI</option>
						<option value="fiftSemester">V</option>
						<option value="sixthSemester">VI</option>
					</select>
				</div><br><br>

				
						
				<input type="submit" class="text btn-info" name="submit" id="submit"
					tabindex="14" value="Get Timetable"
					style="padding: 2px">
			</form>
		</div>
	</div>
		
<!------------------------------ form to delete an timetable  ------------------------------------------------------>
<div id="deleteform" style="display: none;">
		<div class="form">

			<form method="post" action="/delete" name="updateform"
				id="updateform">

			

				<div class="parent-option">
				<p>Select the designation to whom you are going to delete a timetable here</p>
					<select class="text select-style role" id="select-role" name="designation"
						tabindex="8" required="" onchange="showReqOption(this)">
						
						<option value="0"selected>Designation..</option>
						<option value="student">Student</option>
						<option value="staff">Staff</option>
					</select><br> <br>
				</div>
				<div class="stafftext">
					<label>Select the staff name here to create timetable</label>
					<select class="text role" id="select-role" name="staffname"
						tabindex="8">
					<option value="0"selected>Select staff name..</option>
						<%
			
		if(request.getAttribute("staffNameList")!=null){
				out.println("helllo");
			List<Users> results = 
                           (List<Users>)request.getAttribute("staffNameList");
		//out.println(users);
			//if(!results.isEmpty()){

				for(Users list:results)
				{
					//System.out.println(list.getUsername());
				
		%>		
 				<option value="<%=list.getUsername()%>"><%=list.getUsername()%></option>
 				<%
				}
				
				}%>
							</select>
					<><!-- <input type="text" class="text" name="Staffname" /> -->

						<h5>
							</p>
				</div>

				<div class="childoption">
					 <select
						name="branch" id="select-branch" class="select-style text" required=""
						tabindex="9">
												<option value="0">select branch</option>
						
						<option value="bca">BCA</option>
						<option value="bsc">BSC</option>
						<option value="mca">MCA</option>
						<option value="msc">MSC</option>
					</select> <select id="year"
						name="year" class="select-style gender text" required="" tabindex="10">
												<option value="0">Select Year</option>
						
						<option value="firstYear">I</option>
						<option value="secondYearr">II</option>
						<option value="thirdYear">III</option>
					</select> <select
						id="semester" name="semester" class="select-style gender text" required=""
						tabindex="11">
						<option value="0">Select Semester</option>
						<option value="firstSemester">I</option>
						<option value="secondSemester">II</option>
						<option value="thirdSemester">III</option>
						<option value="fourthSemester">VI</option>
						<option value="fiftSemester">V</option>
						<option value="sixthSemester">VI</option>
					</select>
				</div><br><br>

						
				<input type="submit" class="text btn-info" name="submit" id="submit"
					tabindex="14" value="Delete Timetable"
					style="padding: 2px">
			</form>
							</div>
			
		</div>

</body>
</html>
