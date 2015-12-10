<%@ page import="java.util.List"%>
<%@ page import="com.miniproject.Mondays"%>
<%@ page import="com.miniproject.Tuesdays"%>
<%@ page import="com.miniproject.Wednesdays"%>
<%@ page import="com.miniproject.Thursdays"%>
<%@ page import="com.miniproject.Fridays"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
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

#nav {
	width: 400px;
	float: left;
	position: absolute;
	top: 158px;
	width: 284px;
	height: 1100px;
	left: 0px;
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
			<h5 style="top: 50px">
				<em> ${message}</em>
			</h5>
		</nav>



	</div>



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
		style="top: -100px; left: 140px; position: absolute">

		<form method="post" action="/update" name="updateform" id="updateform"
			onclick="validate()">



			<%
				String branch = (String) request.getAttribute("branch");
				String semester = (String) request.getAttribute("semester");
				String year = (String) request.getAttribute("year");
				if (request.getAttribute("mondaysList") != null) {

					List<Mondays> monday = (List<Mondays>) request
							.getAttribute("mondaysList");
			%>

			<div class="table-responsive"
				style="left: 200px; top: 300px; position: absolute; width: 1000px">
				<h4 align="center">Time Table</h4>

				<p>
					<em>Branch : ${branch}</em><br>
					<br>
				</p>

				<p>
					<em>Semester : ${semester}</em><br>
					<br>
				</p>
				<p>
					<em>Year : ${year}</em><br>
					<br>
				</p>
				<input type="hidden" name="branch" value="${branch}" /> <input
					type="hidden" name="semester" value="${semester}" /> <input
					type="hidden" name="year" value="${year}" />

				<table class="table">

					<h5>


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
							<input type="hidden" name="mkey" id="key"
								value="<%=KeyFactory.keyToString(mon.getMkey())%>" />

							<tr class="success">

								<td>Monday</td>
								<td><input type="text" class=" textw" name="monPeriod1"
									required value="<%=mon.getPeriod1()%>" />
								<td><input type="text" class=" textw" name="monPeriod2"
									required value="<%=mon.getPeriod2()%>" /></td>
								<td><input type="text" class=" textw" name=monPeriod3
									"
										required value="<%=mon.getPeriod3()%>" /></td>
								<td><input type="text" class=" textw" name="monPeriod4"
									required value="<%=mon.getPeriod4()%>" /></td>
								<td><input type="text" class=" textw" name="monPeriod5"
									required value="<%=mon.getPeriod5()%>" /></td>
							</tr>

							<%
								}

									if (request.getAttribute("tuesdaysList") != null) {

										List<Tuesdays> tues_datas = (List<Tuesdays>) request
												.getAttribute("tuesdaysList");

										for (Tuesdays data : tues_datas) {
											//out.println(data);
							%>

							<input type="hidden" name="tkey" id="key"
								value="<%=KeyFactory.keyToString(data.getTkey())%>" />
							<tr class="success">

								<td>Tuesday</td>
								<td><input type="text" class=" textw" name="tuesPeriod1"
									value="<%=data.getPeriod1()%>" required />
								<td><input type="text" class=" textw" name="tuesPeriod2"
									required value="<%=data.getPeriod2()%>" /></td>
								<td><input type="text" class=" textw" name="tuesPeriod3"
									required value="<%=data.getPeriod3()%>" /></td>
								<td><input type="text" class=" textw" name="tuesPeriod4"
									required value="<%=data.getPeriod4()%>" /></td>
								<td><input type="text" class=" textw" name="tuesPeriod5"
									required value="<%=data.getPeriod5()%>">
							</tr>

							<%
								}
							%>
							<%
								if (request.getAttribute("wednesdaysList") != null) {

											List<Wednesdays> wed_datas = (List<Wednesdays>) request
													.getAttribute("wednesdaysList");
											for (Wednesdays data : wed_datas) {
												//out.println(data);
							%>

							<input type="hidden" name="wkey" id="key"
								value="<%=KeyFactory.keyToString(data.getWkey())%>" />
							<tr class="success">

								<td>Wednesday</td>
								<td><input type="text" class=" textw" name="wedPeriod1"
									value="<%=data.getPeriod1()%>" required />
								<td><input type="text" class=" textw" name="wedPeriod2"
									required value="<%=data.getPeriod2()%>" /></td>
								<td><input type="text" class=" textw" name="wedPeriod3"
									required value="<%=data.getPeriod3()%>" /></td>
								<td><input type="text" class=" textw" name="wedPeriod4"
									required value="<%=data.getPeriod4()%>" /></td>
								<td><input type="text" class=" textw" name="wedPeriod5"
									required value="<%=data.getPeriod5()%>" /></td>

							</tr>

							<%
								}
							%>
							<%
								if (request.getAttribute("thursdaysList") != null) {

												List<Thursdays> thurs_datas = (List<Thursdays>) request
														.getAttribute("thursdaysList");
												for (Thursdays data : thurs_datas) {
													//out.println(data);
							%>

							<input type="hidden" name="thkey" id="key"
								value="<%=KeyFactory.keyToString(data
										.getThkey())%>" />
							<tr class="success">

								<td>Thursday</td>
								<td><input type="text" class=" textw" name="thursPeriod1"
									required value="<%=data.getPeriod1()%>" />
								<td><input type="text" class=" textw" name="thursPeriod2"
									required value="<%=data.getPeriod2()%>" /></td>
								<td><input type="text" class=" textw" name="thursPeriod3"
									required value="<%=data.getPeriod3()%>" /></td>
								<td><input type="text" class=" textw" name="thursPeriod4"
									required value="<%=data.getPeriod4()%>" /></td>
								<td><input type="text" class=" textw" name="thursPeriod5"
									required value="<%=data.getPeriod5()%>" /></td>

							</tr>

							<%
								}
							%>
							<%
								if (request.getAttribute("fridaysList") != null) {

													List<Fridays> friday_datas = (List<Fridays>) request
															.getAttribute("fridaysList");
													for (Fridays data : friday_datas) {
														//out.println(data);
							%>

							<input type="hidden" name="fkey" id="key"
								value="<%=KeyFactory.keyToString(data
											.getFkey())%>" />
							<tr class="success">

								<td>Friday</td>
								<td><input type="text" class=" textw" name="friPeriod1"
									value="<%=data.getPeriod1()%>" required />
								<td><input type="text" class=" textw" name="friPeriod2"
									required value="<%=data.getPeriod2()%>" /></td>
								<td><input type="text" class=" textw" name="friPeriod3"
									required value="<%=data.getPeriod3()%>" /></td>
								<td><input type="text" class=" textw" name="friPeriod4"
									required value="<%=data.getPeriod4()%>" /></td>
								<td><input type="text" class=" textw" name="friPeriod5"
									required value="<%=data.getPeriod5()%>" /></td>

							</tr>

							<%
								}
												}
											}
										}
									}
								} else {
									out.println("Currently the time table is not available!");
								}
							%>


						</tbody>
				</table>
<a href =/admin>
<input type="button" class="text btn-info" name="submit" id="submit"
					tabindex="14" value="Back"
					style="padding: 2px; background-color: blue;"></a>


				<input type="submit" class="text btn-info" name="submit" id="submit"
					tabindex="14" value="Update Timetable"
					style="padding: 2px; background-color: blue;">

			</div>
		</form>
</body>
</html>
