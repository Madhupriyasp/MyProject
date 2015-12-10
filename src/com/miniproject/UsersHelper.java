package com.miniproject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;

public class UsersHelper {
	static DatastoreService datastore = DatastoreServiceFactory
			.getDatastoreService();
	static PersistenceManager pm = PMF.getInstance().getPersistenceManager();
	TimetableHelper timetablemodel = new TimetableHelper();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void storeData(HttpServletRequest req, HttpServletResponse res)
			throws Exception, IOException {

		// Get client request and process
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String birthday = req.getParameter("birthday");
		String gender = req.getParameter("gender");
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String semester = req.getParameter("semester");
		String year = req.getParameter("year");

		// Temporary storage in user object

		Users usersData = new Users();
		usersData.setName(name);
		usersData.setEmail(email);
		usersData.setUsername(username);
		usersData.setPassword(password);
		usersData.setBirthdate(birthday);
		usersData.setGender(gender);
		usersData.setDesignation(designation);
		usersData.setSemseter(semester);
		usersData.setBranch(branch);
		usersData.setYear(year);

		Login login = new Login();
		login.setUsername(username);
		login.setPassword(password);
		login.setDesignation(designation);

		ArrayList userList = new ArrayList();
		String query = "SELECT FROM " + Users.class.getName();
		Query q = pm.newQuery(query);
		@SuppressWarnings("all")
		List<Users> users = (List<Users>) q.execute();

		// check list has null sets
		if (!users.isEmpty()) {
			for (Users user : users) {
				String userUsername = user.getUsername();
				String userEmail = user.getEmail();

				userList.add(userUsername);
				userList.add(userEmail);
			}

			if (userList.contains(username)) {
				req.setAttribute("message",
						"Username Exist!Use Some other name");
				RequestDispatcher rd = req.getRequestDispatcher("/");
				rd.forward(req, res);
			} else if (userList.contains(email)) {
				req.setAttribute("message", "Email-ID already Exist");
				RequestDispatcher rd = req.getRequestDispatcher("/");
				rd.forward(req, res);
			}

			else {
				usersData.setEmail(email);
				usersData.setUsername(username);
				usersData.setDesignation(designation);

				req.setAttribute("message", "Registered succesfully");
				req.setAttribute("username", username);
				try {
					pm.makePersistent(usersData);
					pm.makePersistent(login);
				} finally {
					RequestDispatcher rd = req.getRequestDispatcher("/");
					rd.forward(req, res);
					pm.close();
				}
			}
		} else {
			try {
			pm.makePersistent(usersData);
			pm.makePersistent(login);
			req.setAttribute("message", "Registered succesfully");
			req.setAttribute("username", username);
			
		
		} finally {
			RequestDispatcher rd = req.getRequestDispatcher("/");
			rd.forward(req, res);
			pm.close();
		}
		}
	}

	public void validateLoginDetails(HttpServletRequest req,
			HttpServletResponse res) throws Exception, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String designation = req.getParameter("designation");

		List<Users> results = getLoginDetailsOfUser(designation, username,
				password);

		if (!results.isEmpty()) {
			if (designation.equals("student")) {
				req.setAttribute("username", username);
				List<Users> datas = getDetailsOf(username, req);
				for (Users data : datas) {
					String branch = data.getBranch().toString();
					String sem = data.getSemseter().toString();
					String year = data.getYear().toString();
					List<Mondays> monday_list = timetablemodel
							.getTimeTableofMondays(branch, sem, year);
					req.setAttribute("MondaysList", monday_list);

					List<Tuesdays> tuesday_list = timetablemodel
							.getTimeTableofTuesdays(branch, sem, year);
					req.setAttribute("TuesdaysList", tuesday_list);

					List<Wednesdays> wed_value = timetablemodel
							.getTimeTableofWednesdays(branch, sem, year);
					req.setAttribute("WednesdaysList", wed_value);

					List<Thursdays> thurs_value = timetablemodel
							.getTimeTableofThursdays(branch, sem, year);
					req.setAttribute("ThursdaysList", thurs_value);

					List<Fridays> fri_value = timetablemodel
							.getTimeTableofFridays(branch, sem, year);
					req.setAttribute("FridaysList", fri_value);

					RequestDispatcher rd = req
							.getRequestDispatcher("/student_success");
					rd.forward(req, res);
				}
			}

			if (designation.equals("staff")) {
				req.setAttribute("username", username);
				List<Mondays> monday_list = timetablemodel
						.getMondyasTimeTableofStaff(username);

				req.setAttribute("MondaysList", monday_list);

				List<Tuesdays> tuesday_list = timetablemodel
						.getTuesdaysTimeTableofStaff(username);
				req.setAttribute("TuesdaysList", tuesday_list);

				List<Wednesdays> wed_value = timetablemodel
						.getWednesdaysTimeTableofStaff(username);
				req.setAttribute("WednesdaysList", wed_value);

				List<Thursdays> thurs_value = timetablemodel
						.getThursdaysTimeTableofStaff(username);
				req.setAttribute("ThursdaysList", thurs_value);

				List<Fridays> fri_value = timetablemodel
						.getFridaysimeTableofStaff(username);
				req.setAttribute("FridaysList", fri_value);

				// getTimeTable(username,req);

				RequestDispatcher rd = req
						.getRequestDispatcher("/staff_success");
				rd.forward(req, res);
			}
			if (designation.equals("admin")) {
				// String staff = "Staff";
				List<Users> staffnames = getDetailsOfStaffNames();
			
				if (!(staffnames).isEmpty()) {
					req.setAttribute("staffNameList", staffnames);

				} else {
					req.setAttribute("staffNameList", null);
				}
				RequestDispatcher rd = req.getRequestDispatcher("/admin");
				rd.forward(req, res);
			}

		} else {
			// System.out.println("false");
			req.setAttribute("message", "Invalid UserName and Password");

			RequestDispatcher rd = req.getRequestDispatcher("/");
			rd.forward(req, res);
		}
	}

	public List<Users> getDetailsOfStaffNames() {

		Query q = pm.newQuery(Users.class);
		q.setFilter("designation == designationParameter");
		q.declareParameters("String designationParameter");
		@SuppressWarnings("unchecked")
		List<Users> results = (List<Users>) q.execute("staff");
		return results;

	}

	public static List<Users> getLoginDetailsOfUser(String designation,
			String userName, String password) {

		Query q = pm.newQuery(Users.class);
		q.setFilter("designation == designationParameter && username == usernameParameter && password==passwordParameter");
		q.declareParameters("String designationParameter,String usernameParameter,String passwordParameter");
		@SuppressWarnings("unchecked")
		List<Users> results = (List<Users>) q.execute(designation, userName,
				password);
		return results;
	}

	public static List<Users> getDetailsOf(String username,
			HttpServletRequest req) {
		Query q = pm.newQuery(Users.class);
		q.setFilter("username == usernameParameter");
		q.declareParameters("String usernameParameter");
		@SuppressWarnings("unchecked")
		List<Users> results = (List<Users>) q.execute(username);
		return results;
	}

}
