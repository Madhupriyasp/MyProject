<%@ page import="java.util.List"%>
<%@ page import="com.miniproject.Mondays"%>
<%@ page import="com.miniproject.Tuesdays"%>
<%@ page import="com.miniproject.Wednesdays"%>
<%@ page import="com.miniproject.Thursdays"%>
<%@ page import="com.miniproject.Fridays"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>TimeTable</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


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
<style>
.jumbotron {
	position: relative;
	background: #000 url("../kcgimages/createlogo.png") center center;
	width: 100%;
	height: 234px;
	background-size: cover;
	overflow: hidden;
}

h4 {
	color: blue;
}

h5 {
	color: green;
}

#nav {
	width: 400px;
	float: left;
	position: absolute;
	top: 150px;
	width: 284px;
	height: 1100px;
	left: 10px;
}
</style>

<script>
	function showtimetableform() {
		document.getElementById('timetable').style.display = "block";

	}
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
	</p>

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
	<div class="container"
		style="top: 200px; left: 140px; position: absolute">
		

		<h5 style="top: 50px">
			<em> ${message}</em>
		</h5>
		
		<%
			if (request.getAttribute("MondaysList") != null) {

				List<Mondays> monday = (List<Mondays>) request
						.getAttribute("MondaysList");
		
		%>

		<div class="table-responsive"
			style="left: 300px; top: -0px; position: absolute; width: 600px">
			<p style="color: green; font-size: 20px;left:200px">
						<em>Welcome! ${username}</em><br>
						<br></p>
			
						<h5>Your Time Table is listed here!</h5>
			
			<table class="table">
			
				<thead>
			<tr class="success">



							<th>Day</th>
							<th>Hour1</th>
							<th>Hour2</th>
							<th>Hour3</th>
							<th>Hour4</th>
							<th>Hour5</th>


						</tr>
					</thead>
					<tbody>
						<%
							for (Mondays mon : monday) {
									//out.println(mon);
						%>

						<tr class="success">

							<td>Monday</td>

							<td><%=mon.getPeriod1()%></td>
							<td><%=mon.getPeriod2()%></td>
							<td><%=mon.getPeriod3()%></td>
							<td><%=mon.getPeriod4()%></td>
							<td><%=mon.getPeriod5()%></td>
				</h5>
				</tr>

				<%
					}
	
				%>
				<%
					if (request.getAttribute("TuesdaysList") != null) {

							List<Tuesdays> tues_datas = (List<Tuesdays>) request
									.getAttribute("TuesdaysList");
							for (Tuesdays data : tues_datas) {
								//out.println(data);
				%>
				<tr class="success">

					<td>Tuesday</td>

					<td><%=data.getPeriod1()%></td>
					<td><%=data.getPeriod2()%></td>
					<td><%=data.getPeriod3()%></td>
					<td><%=data.getPeriod4()%></td>
					<td><%=data.getPeriod5()%></td>
					</h5>
				</tr>

				<%
					}
				%>
				<%
					if (request.getAttribute("WednesdaysList") != null) {

								List<Wednesdays> wed_datas = (List<Wednesdays>) request
										.getAttribute("WednesdaysList");
								for (Wednesdays data : wed_datas) {
									//out.println(data);
				%>
				<tr class="success">

					<td>Wednesday</td>

					<td><%=data.getPeriod1()%></td>
					<td><%=data.getPeriod2()%></td>
					<td><%=data.getPeriod3()%></td>
					<td><%=data.getPeriod4()%></td>
					<td><%=data.getPeriod5()%></td>
					</h5>
				</tr>

				<%
					}
				%>
				<%
					if (request.getAttribute("ThursdaysList") != null) {

									List<Thursdays> thurs_datas = (List<Thursdays>) request
											.getAttribute("ThursdaysList");
									for (Thursdays data : thurs_datas) {
										//out.println(data);
				%>
				<tr class="success">

					<td>Thursday</td>

					<td><%=data.getPeriod1()%></td>
					<td><%=data.getPeriod2()%></td>
					<td><%=data.getPeriod3()%></td>
					<td><%=data.getPeriod4()%></td>
					<td><%=data.getPeriod5()%></td>
					</h5>
				</tr>

				<%
					}
				%>
				<%
					if (request.getAttribute("FridaysList") != null) {

										List<Fridays> friday_datas = (List<Fridays>) request
												.getAttribute("FridaysList");
										for (Fridays data : friday_datas) {
											//out.println(data);
				%>
				<tr class="success">

					<td>Friday</td>

					<td><%=data.getPeriod1()%></td>
					<td><%=data.getPeriod2()%></td>
					<td><%=data.getPeriod3()%></td>
					<td><%=data.getPeriod4()%></td>
					<td><%=data.getPeriod5()%></td>
					</h5>
				</tr>

				<%
					}
										//end for loop
									}
								}
							}
						}
				
					} 
				else {
						out.println("Currently the time table is not available!");
					}
				%>

				</tbody>
			</table>
		</div>
</body>
</html>
