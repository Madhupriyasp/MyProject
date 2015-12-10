package com.miniproject;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimetableHelper {
	static PersistenceManager pm = PMF.getInstance().getPersistenceManager();

	/*Store timetable values 
	*1.This stores the timetable created by the admin 
	*2.Check that particular schedule is already exist in a  persistence object 
	*/
	
	public void storeTimeTable(HttpServletRequest req, HttpServletResponse res)
			throws Exception, IOException {
	
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
	
	
	
		String staffname = req.getParameter("staffname");
	
		// Modays storage
	
		String mon_Period1 = req.getParameter("monPeriod1");
		String mon_Period2 = req.getParameter("monPeriod2");
		String mon_Period3 = req.getParameter("monPeriod3");
		System.out.println("monday"+mon_Period3);
		String mon_Period4 = req.getParameter("monPeriod4");
		String mon_Period5 = req.getParameter("monPeriod5");
	
		Mondays monday = new Mondays();
	
		monday.setSemester(sem);
		monday.setBranch(branch);
		monday.setYear(year);
		monday.setStaffname(staffname);
		monday.setPeriod1(mon_Period1);
		monday.setPeriod2(mon_Period2);
		monday.setPeriod3(mon_Period3);
		monday.setPeriod4(mon_Period4);
		monday.setPeriod5(mon_Period5);
	
		// Tuesdays storage
		String tues_Period1 = req.getParameter("tuesPeriod1");
		String tues_Period2 = req.getParameter("tuesPeriod2");
		String tues_Period3 = req.getParameter("tuesPeriod3");
		String tues_Period4 = req.getParameter("tuesPeriod4");
		String tues_Period5 = req.getParameter("tuesPeriod5");
		Tuesdays tuesday = new Tuesdays();
	
		tuesday.setSemester(sem);
		tuesday.setBranch(branch);
		tuesday.setYear(year);
		tuesday.setStaffname(staffname);
		tuesday.setPeriod1(tues_Period1);
		tuesday.setPeriod2(tues_Period2);
		tuesday.setPeriod3(tues_Period3);
		tuesday.setPeriod4(tues_Period4);
		tuesday.setPeriod5(tues_Period5);
	
		// Wedenesday storage
	
		String wed_Period1 = req.getParameter("wedPeriod1");
		String wed_Period2 = req.getParameter("wedPeriod2");
		String wed_Period3 = req.getParameter("wedPeriod3");
		String wed_Period4 = req.getParameter("wedPeriod4");
		String wed_Period5 = req.getParameter("wedPeriod5");
	
		Wednesdays wed = new Wednesdays();
		wed.setSemester(sem);
		wed.setBranch(branch);
		wed.setYear(year);
		wed.setStaffname(staffname);
		wed.setPeriod1(wed_Period1);
		wed.setPeriod2(wed_Period2);
		wed.setPeriod3(wed_Period3);
		wed.setPeriod4(wed_Period4);
		wed.setPeriod5(wed_Period5);
	
		// Thursday storage
	
		String thurs_Period1 = req.getParameter("thursPeriod1");
		String thurs_Period2 = req.getParameter("thursPeriod2");
		String thurs_Period3 = req.getParameter("thursPeriod3");
		String thurs_Period4 = req.getParameter("thursPeriod4");
		String thurs_Period5 = req.getParameter("thursPeriod5");
		Thursdays thurs = new Thursdays();
		thurs.setSemester(sem);
		thurs.setBranch(branch);
		thurs.setYear(year);
		thurs.setStaffname(staffname);
		thurs.setPeriod1(thurs_Period1);
		thurs.setPeriod2(thurs_Period2);
		thurs.setPeriod3(thurs_Period3);
		thurs.setPeriod4(thurs_Period4);
		thurs.setPeriod5(thurs_Period5);
	
		// Friday storage
	
		String fri_Period1 = req.getParameter("friPeriod1");
		String fri_Period2 = req.getParameter("friPeriod2");
		String fri_Period3 = req.getParameter("friPeriod3");
		String fri_Period4 = req.getParameter("friPeriod4");
		String fri_Period5 = req.getParameter("friPeriod5");
		Fridays fri = new Fridays();
		fri.setSemester(sem);
		fri.setBranch(branch);
		fri.setYear(year);
		fri.setStaffname(staffname);
		fri.setPeriod1(fri_Period1);
		fri.setPeriod2(fri_Period2);
		fri.setPeriod3(fri_Period3);
		fri.setPeriod4(fri_Period4);
		fri.setPeriod5(fri_Period5);
	
		List<Mondays> monday_value = getTimeTableofMondays(branch, sem, year);
		List<Tuesdays> tuesday_value = getTimeTableofTuesdays(branch, sem, year);
		List<Wednesdays> wed_value = getTimeTableofWednesdays(branch, sem, year);
		List<Thursdays> thurs_value = getTimeTableofThursdays(branch, sem, year);
		List<Fridays> fri_value = getTimeTableofFridays(branch, sem, year);
	
		if (monday_value.isEmpty()) {
			if (tuesday_value.isEmpty()) {
				if (wed_value.isEmpty()) {
					if (thurs_value.isEmpty()) {
						if (fri_value.isEmpty()) {
							
							pm.makePersistent(monday);
							pm.makePersistent(tuesday);
							pm.makePersistent(wed);
							pm.makePersistent(thurs);
							pm.makePersistent(fri);
							req.setAttribute("message",
									"Timetable is created..");
							
						}
							else {
							req.setAttribute("message",
									"Timetable is already exist..");
	
							RequestDispatcher rd = req
									.getRequestDispatcher("/admin");
							rd.forward(req, res);
						}
						RequestDispatcher rd = req
								.getRequestDispatcher("/admin");
						rd.forward(req, res);
	
					} else {
						req.setAttribute("message",
								"Timetable is already exist..");
	
						RequestDispatcher rd = req
								.getRequestDispatcher("/admin");
						rd.forward(req, res);
					}
				} else {
					req.setAttribute("message",
							"Timetable is already exist..");
	
					RequestDispatcher rd = req.getRequestDispatcher("/admin");
					rd.forward(req, res);
				}
			}
	
			else {
				req.setAttribute("message", "Timetable is already exist..");
	
				RequestDispatcher rd = req.getRequestDispatcher("/admin");
				rd.forward(req, res);
			}
	
		} else {
			req.setAttribute("message", "Timetable is already exist..");
	
			RequestDispatcher rd = req.getRequestDispatcher("/admin");
			rd.forward(req, res);
		}
	
	}


	/*
	 *Delete timetable by getting the response from the user 
	 */
	
	public void deleteTimeTable(HttpServletRequest req, HttpServletResponse res) throws Exception, IOException {
		
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String staffname = req.getParameter("staffname");
		
		List<Mondays> monday_value = getTimeTableofMondays(branch, sem, year);
		List<Tuesdays> tuesday_value = getTimeTableofTuesdays(branch, sem, year);
		List<Wednesdays> wed_value = getTimeTableofWednesdays(branch, sem, year);
		List<Thursdays> thurs_value = getTimeTableofThursdays(branch, sem, year);
		List<Fridays> fri_value = getTimeTableofFridays(branch, sem, year);
		
		if(designation.equals("student"))
		{
			if(!monday_value.isEmpty()){
			pm.deletePersistentAll(monday_value);
			pm.deletePersistentAll(tuesday_value);
			pm.deletePersistentAll(wed_value);
			pm.deletePersistentAll(thurs_value);
			pm.deletePersistentAll(fri_value);
			req.setAttribute("message", "Time table deleted successfully..");
			}
			else
			{			
				req.setAttribute("message", "Time table does not exist..");
			}

		RequestDispatcher rd = req.getRequestDispatcher("/admin");
		rd.forward(req, res);
		}
		
		
		
		else if(designation.equals("staff"))
		{
			List<Mondays> monday_stafflist =getMondyasTimeTableofStaff(staffname);
			List<Tuesdays> tuesday_stafflist =getTuesdaysTimeTableofStaff(staffname);
			List<Wednesdays> wed_stafflist =getWednesdaysTimeTableofStaff(staffname);
			List<Thursdays> thurs_stafflist = getThursdaysTimeTableofStaff(staffname);
			List<Fridays> fri_stafflist= getFridaysimeTableofStaff(staffname);
			if(!monday_stafflist.isEmpty()){
			pm.deletePersistentAll(monday_stafflist);
			pm.deletePersistentAll(tuesday_stafflist);
			pm.deletePersistentAll(wed_stafflist);
			pm.deletePersistentAll(thurs_stafflist);
			pm.deletePersistentAll(fri_stafflist);
			req.setAttribute("message", "Time table deleted successfully..");
			}else
			{
				req.setAttribute("message", "Time table does not exist..");
			}
			RequestDispatcher rd = req.getRequestDispatcher("/admin");
			rd.forward(req, res);
	
		}
		else
		{
			req.setAttribute("message", "Time table does not exist");
			RequestDispatcher rd = req.getRequestDispatcher("/admin");
			rd.forward(req, res);		
		}
		
	}
	
	

		
	@SuppressWarnings("unused")
	public void updateTimeTable(HttpServletRequest req, HttpServletResponse res) throws Exception, IOException {
		// TODO Auto-generated method stub
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String mkey = req.getParameter("mkey");
		String tkey = req.getParameter("tkey");
		String wkey = req.getParameter("wkey");
		String thkey = req.getParameter("thkey");
		String fkey = req.getParameter("fkey");
		System.out.println("update "+designation+branch+year+sem);
		
		UsersHelper model = new UsersHelper();
		List<Users> staffnames = model.getDetailsOfStaffNames();
		/*for(Users user : staffnames)
		{
			System.out.println("stfafnear"+user.getUsername());
		}*/
		if (!(staffnames).isEmpty()) {
			 //System.out.println("hello");
			 req.setAttribute("staffNameList",staffnames);

		} else {
		 //System.out.println("hekkk");
			req.setAttribute("staffNameList", null);
		}
		//System.out.println("TimeTable"+branch+sem+year);
		String staffname = req.getParameter("staffname");
		//System.out.println("staffname"+staffname);
		String mon_Period1 = req.getParameter("monPeriod1");
		String mon_Period2 = req.getParameter("monPeriod2");
		String mon_Period3 = req.getParameter("monPeriod3");
		String mon_Period4 = req.getParameter("monPeriod4");
		String mon_Period5 = req.getParameter("monPeriod5");

		//Mondays monday = new Mondays();
		Mondays monday = pm.getObjectById(Mondays.class,mkey);


		monday.setSemester(sem);
		monday.setBranch(branch);
		monday.setYear(year);
		monday.setStaffname(staffname);
		monday.setPeriod1(mon_Period1);
		monday.setPeriod2(mon_Period2);
		monday.setPeriod3(mon_Period3);
		monday.setPeriod4(mon_Period4);
		monday.setPeriod5(mon_Period5);

		// Tuesdays storage
		String tues_Period1 = req.getParameter("tuesPeriod1");
		String tues_Period2 = req.getParameter("tuesPeriod2");
		String tues_Period3 = req.getParameter("tuesPeriod3");
		String tues_Period4 = req.getParameter("tuesPeriod4");
		String tues_Period5 = req.getParameter("tuesPeriod5");
		Tuesdays tuesday = pm.getObjectById(Tuesdays.class,tkey);

		tuesday.setSemester(sem);
		tuesday.setBranch(branch);
		tuesday.setYear(year);
		tuesday.setStaffname(staffname);
		tuesday.setPeriod1(tues_Period1);
		tuesday.setPeriod2(tues_Period2);
		tuesday.setPeriod3(tues_Period3);
		tuesday.setPeriod4(tues_Period4);
		tuesday.setPeriod5(tues_Period5);

		// Wedenesday storage

		String wed_Period1 = req.getParameter("wedPeriod1");
		String wed_Period2 = req.getParameter("wedPeriod2");
		String wed_Period3 = req.getParameter("wedPeriod3");
		String wed_Period4 = req.getParameter("wedPeriod4");
		String wed_Period5 = req.getParameter("wedPeriod5");
		Wednesdays wed = pm.getObjectById(Wednesdays.class, wkey);

		//Wednesdays wed = new Wednesdays();
		wed.setSemester(sem);
		wed.setBranch(branch);
		wed.setYear(year);
		wed.setStaffname(staffname);
		wed.setPeriod1(wed_Period1);
		wed.setPeriod2(wed_Period2);
		wed.setPeriod3(wed_Period3);
		wed.setPeriod4(wed_Period4);
		wed.setPeriod5(wed_Period5);

		// Thursday storage

		String thurs_Period1 = req.getParameter("thursPeriod1");
		String thurs_Period2 = req.getParameter("thursPeriod2");
		String thurs_Period3 = req.getParameter("thursPeriod3");
		String thurs_Period4 = req.getParameter("thursPeriod4");
		String thurs_Period5 = req.getParameter("thursPeriod5");
		
		Thursdays thurs = pm.getObjectById(Thursdays.class, thkey);

		//Thursdays thurs = new Thursdays();
		thurs.setSemester(sem);
		thurs.setBranch(branch);
		thurs.setYear(year);
		thurs.setStaffname(staffname);
		thurs.setPeriod1(thurs_Period1);
		thurs.setPeriod2(thurs_Period2);
		thurs.setPeriod3(thurs_Period3);
		thurs.setPeriod4(thurs_Period4);
		thurs.setPeriod5(thurs_Period5);

		// Friday storage

		String fri_Period1 = req.getParameter("friPeriod1");
		String fri_Period2 = req.getParameter("friPeriod2");
		String fri_Period3 = req.getParameter("friPeriod3");
		String fri_Period4 = req.getParameter("friPeriod4");
		String fri_Period5 = req.getParameter("friPeriod5");
		
		Fridays fri = pm.getObjectById(Fridays.class, fkey);

		//Fridays fri = new Fridays();
		fri.setSemester(sem);
		fri.setBranch(branch);
		fri.setYear(year);
		fri.setStaffname(staffname);
		fri.setPeriod1(fri_Period1);
		fri.setPeriod2(fri_Period2);
		fri.setPeriod3(fri_Period3);
		fri.setPeriod4(fri_Period4);
		fri.setPeriod5(fri_Period5);

		if (monday!=null) {
			if (tuesday!=null) {
				if (wed!=null) {
					if(thurs!=null) {
						if (fri!=null) {
							
							pm.makePersistent(monday);
							pm.makePersistent(tuesday);
							pm.makePersistent(wed);
							pm.makePersistent(thurs);
							pm.makePersistent(fri);
							req.setAttribute("message",
									"Timetable is updated..");
							RequestDispatcher rd = req
									.getRequestDispatcher("/admin");
							rd.forward(req, res);
							
						}
					}
				}
			}
		}
							else {
							req.setAttribute("message",
									"Error in updating..");
	
							RequestDispatcher rd = req
									.getRequestDispatcher("/admin");
							rd.forward(req, res);
						}
					
	}


	
	
	
	/*
	 * Fetch the time table of wednesdays list by passing the branch ,semester and year
	 */
	
		public List<Wednesdays> getTimeTableofWednesdays(String branch,
			String sem, String year) {
		List<Wednesdays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Wednesdays.class);
		q.setFilter("branch == branchParameter && semester == semesterParameter && year == yearParameter ");
		q.declareParameters("String branchParameter,String semesterParameter,String yearParameter");
		@SuppressWarnings("unchecked")
		List<Wednesdays> results = (List<Wednesdays>) q.execute(branch, sem,
				year);
		return results;
	}

	
		
		
		
		
		
		
		/*
		 * Fetch the time table of Thursdays list by passing the branch ,semester and year
		 */
	public List<Thursdays> getTimeTableofThursdays(String branch, String sem,
			String year) {
		List<Thursdays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Thursdays.class);
		q.setFilter("branch == branchParameter && semester == semesterParameter && year == yearParameter ");
		q.declareParameters("String branchParameter,String semesterParameter,String yearParameter");
		@SuppressWarnings("unchecked")
		List<Thursdays> results = (List<Thursdays>) q
				.execute(branch, sem, year);
		return results;
	}

	
	
	
	

	
	
	
	
	
	
	/*
	 * Fetch the time table of Fridays list by passing the branch ,semester and year
	 */
	public List<Fridays> getTimeTableofFridays(String branch, String sem,
			String year) {
		List<Fridays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Fridays.class);
		q.setFilter("branch == branchParameter && semester == semesterParameter && year == yearParameter ");
		q.declareParameters("String branchParameter,String semesterParameter,String yearParameter");
		@SuppressWarnings("unchecked")
		List<Fridays> results = (List<Fridays>) q.execute(branch, sem, year);
		return results;
	}

	
	
	
	
	
	
	
	
	
	
	
	/*
	 * Fetch the time table of Mondays list by passing the branch ,semester and year
	 */
	public  List<Mondays> getTimeTableofMondays(String branch,
			String sem, String year) {
		List<Mondays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Mondays.class);
		q.setFilter("branch == branchParameter && semester == semesterParameter && year == yearParameter ");
		q.declareParameters("String branchParameter,String semesterParameter,String yearParameter");
		@SuppressWarnings("unchecked")
		List<Mondays> results = (List<Mondays>) q.execute(branch, sem, year);
		return results;
	}

	
	
	
	/*
	 * Fetch the time table of Tuesdays list by passing the branch ,semester and year
	 */
	public  List<Tuesdays> getTimeTableofTuesdays(String branch,
			String sem, String year) {
		List<Mondays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Tuesdays.class);
		q.setFilter("branch == branchParameter && semester == semesterParameter && year == yearParameter ");
		q.declareParameters("String branchParameter,String semesterParameter,String yearParameter");
		@SuppressWarnings("unchecked")
		List<Tuesdays> results = (List<Tuesdays>) q.execute(branch, sem, year);
		return results;
	}
	
	
	
	/*
	 * get staff  time table of Mondays list by passing the staff username
	 */
	public  List<Mondays> getMondyasTimeTableofStaff(String username) {
		List<Mondays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Mondays.class);
		q.setFilter("staffname == staffnameParameter");
		q.declareParameters("String staffnameParameter");
		@SuppressWarnings("unchecked")
		List<Mondays> results = (List<Mondays>) q.execute(username);
		return results;
	}


	/*
	 * get staff  time table of Tuesdays list by passing the staff username
	 */
	public  List<Tuesdays> getTuesdaysTimeTableofStaff(String username) {
		List<Mondays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Tuesdays.class);
		q.setFilter("staffname == staffnameParameter");
		q.declareParameters("String staffnameParameter");
		@SuppressWarnings("unchecked")
		List<Tuesdays> results = (List<Tuesdays>) q.execute(username);
		return results;
	}
	
	/*
	 * get staff  time table of Wednesdays list by passing the staff username
	 */
	public  List<Wednesdays> getWednesdaysTimeTableofStaff(String username) {
		List<Wednesdays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Wednesdays.class);
		q.setFilter("staffname == staffnameParameter");
		q.declareParameters("String staffnameParameter");
		@SuppressWarnings("unchecked")
		List<Wednesdays> results = (List<Wednesdays>) q.execute(username);
		return results;
	}
	
	/*
	 * get staff  time table of Thursdays list by passing the staff username
	 */
	public  List<Thursdays> getThursdaysTimeTableofStaff(String username) {
		List<Thursdays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Thursdays.class);
		q.setFilter("staffname == staffnameParameter");
		q.declareParameters("String staffnameParameter");
		@SuppressWarnings("unchecked")
		List<Thursdays> results = (List<Thursdays>) q.execute(username);
		return results;
	}
	
	
	/*
	 * get staff  time table of Tuesdays list by passing the staff username
	 */
	public  List<Fridays> getFridaysimeTableofStaff(String username) {
		List<Fridays> listof = null;
		// System.out.println(branch+sem+year);

		Query q = pm.newQuery(Fridays.class);
		q.setFilter("staffname == staffnameParameter");
		q.declareParameters("String staffnameParameter");
		@SuppressWarnings("unchecked")
		List<Fridays> results = (List<Fridays>) q.execute(username);
		return results;
	}


	


	public void viewTimeTable(HttpServletRequest req, HttpServletResponse res) throws Exception, IOException {
		// TODO Auto-generated method stub
		String designation = req.getParameter("designation");
		
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		//String day = req.getParameter("day");
		String staffname = req.getParameter("staffname");
		//System.out.println("stffas"+staffname);
		req.setAttribute("branch",branch);
		req.setAttribute("semester",sem);
		req.setAttribute("year",year);
		req.setAttribute("staffname",staffname);

		if (designation.equals("student")) {
			
				List<Mondays> monday_list = getTimeTableofMondays(branch, sem, year);
			
				req.setAttribute("mondaysList",monday_list );

				List<Tuesdays> tuesday_list = getTimeTableofTuesdays(branch, sem, year);
				req.setAttribute("tuesdaysList",tuesday_list );

				List<Wednesdays> wed_value = getTimeTableofWednesdays(branch, sem, year);
				req.setAttribute("wednesdaysList",wed_value );

				List<Thursdays> thurs_value = getTimeTableofThursdays(branch, sem, year);
				req.setAttribute("thursdaysList",thurs_value );

				List<Fridays> fri_value = getTimeTableofFridays(branch, sem, year);
				req.setAttribute("fridaysList",fri_value );

			RequestDispatcher rd = req
					.getRequestDispatcher("/displaystudent");
			rd.forward(req, res);
		}
		
		
		if (designation.equals("staff")) {
			
			List<Mondays> monday_list = getMondyasTimeTableofStaff(staffname);
			req.setAttribute("mondaysList",monday_list );

			List<Tuesdays> tuesday_list = getTuesdaysTimeTableofStaff(staffname);
			req.setAttribute("tuesdaysList",tuesday_list );

			List<Wednesdays> wed_value = getWednesdaysTimeTableofStaff(staffname);
			req.setAttribute("wednesdaysList",wed_value );

			List<Thursdays> thurs_value = getThursdaysTimeTableofStaff(staffname);
			req.setAttribute("thursdaysList",thurs_value );

			List<Fridays> fri_value = getFridaysimeTableofStaff(staffname);
			req.setAttribute("fridaysList",fri_value );

			//getTimeTable(username,req);
			
			RequestDispatcher rd = req
					.getRequestDispatcher("/displaystaff");
			rd.forward(req, res);
		}
		
	}

	






}
