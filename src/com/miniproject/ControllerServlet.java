package com.miniproject;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

@Controller
public class ControllerServlet {
	@RequestMapping("/")
	public String homePage(HttpServletRequest req) {

		return "Home";
	}

	@RequestMapping(value = "/displaystudent", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String dispalyStudentTimeTable(ModelMap model) {

		return "DisplayStudent";

	}
	
	@RequestMapping(value = "/displaystaff", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String dispalyStaffTimeTable(ModelMap model) {

		return "DisplayStaff";

	}
	

	
	@RequestMapping(value = "/student_success", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String onAfterStudentLogin(ModelMap model) {

		return "StudentLoginSuccess";

	}
	
	
	@RequestMapping(value = "/admin",  method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showaboutUs(ModelMap model) {

		return "AdminPage";

	}

	
	@RequestMapping(value = "/staff_success",  method = { RequestMethod.GET,
			RequestMethod.POST })
	public String onAfterStaffLogin(ModelMap model) {

		return "StaffLoginSuccess";

	}

	@RequestMapping(value = "/add", method = { RequestMethod.GET,
			RequestMethod.POST})
	// method=RequestMethod.POST)
	public void getInputToRegister(HttpServletRequest req,
			HttpServletResponse res) throws Exception {

		UsersHelper userbeanobj = new UsersHelper();
		userbeanobj.storeData(req, res);

	}
	
	
	@RequestMapping(value = "/create", method = { RequestMethod.GET,
			RequestMethod.POST })
	// method=RequestMethod.POST)
	public void getInputToStoreTimeTable(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String staffname = req.getParameter("staffname");
		//System.out.println("sdkjdf"+branch+year+sem);
			if( (!year.equals("0")) && (!branch.equals("0")) && (!sem.equals("0") ) ) 
			{
				TimetableHelper timetablemodel  = new TimetableHelper();
				timetablemodel.storeTimeTable(req,res);
				
			}
		else if (!staffname.equals("0")){
			TimetableHelper timetablemodel  = new TimetableHelper();
			timetablemodel.storeTimeTable(req,res);
			
		}
		else
		{
			req.setAttribute("message",
					"Select correct branch,semester,year or staffname..");

			RequestDispatcher rd = req
					.getRequestDispatcher("/admin");
			rd.forward(req, res);
		}
			
	}


	@RequestMapping(value = "/update", method = { RequestMethod.GET,
			RequestMethod.POST })
	// method=RequestMethod.POST)
	public void getInputToUpdateTimeTable(HttpServletRequest req,
			HttpServletResponse res, ModelMap model) throws Exception {
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String staffname = req.getParameter("staffname");
		//System.out.println("sdkjdf"+branch+year+sem);
			if( (!year.equals("0")) && (!branch.equals("0")) && (!sem.equals("0") ) ) 
			{
				TimetableHelper timetablemodel  = new TimetableHelper();
				timetablemodel.updateTimeTable(req,res);
				
			}
		else if (!staffname.equals("0")){
			TimetableHelper timetablemodel  = new TimetableHelper();
			timetablemodel.updateTimeTable(req,res);
			
		}
		else
		{
			req.setAttribute("message",
					"Select correct branch,semester,year or staffname..");

			RequestDispatcher rd = req
					.getRequestDispatcher("/admin");
			rd.forward(req, res);
		}
			
			
		
	}



	@RequestMapping(value = "/you", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getInputToLogin(HttpServletRequest req,
			HttpServletResponse res, ModelMap model) throws Exception,
			IOException {
		UsersHelper userbeanobj = new UsersHelper();
		userbeanobj.validateLoginDetails(req, res);

	}

	@RequestMapping(value = "/viewtimetable", method = { RequestMethod.GET,
			RequestMethod.POST })
	// method=RequestMethod.POST)
	public void ViewTimeTable(HttpServletRequest req,
			HttpServletResponse res, ModelMap model) throws Exception {
		
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String staffname = req.getParameter("staffname");
		//System.out.println("sdkjdf"+branch+year+sem);
			if( (!year.equals("0")) && (!branch.equals("0")) && (!sem.equals("0") ) ) 
			{
				TimetableHelper timetablemodel  = new TimetableHelper();
				timetablemodel.viewTimeTable(req,res);
				
			}
		else if (!staffname.equals("0")){
			TimetableHelper timetablemodel  = new TimetableHelper();
			timetablemodel.viewTimeTable(req,res);
			
		}
		else
		{
			req.setAttribute("message",
					"Select correct branch,semester,year or staffname..");

			RequestDispatcher rd = req
					.getRequestDispatcher("/admin");
			rd.forward(req, res);
		}

		

		

	}
	
	
	@RequestMapping(value ="/delete",method = { RequestMethod.GET,
			RequestMethod.POST })
	// method=RequestMethod.POST)
	public void deleteTimeTable(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		String designation = req.getParameter("designation");
		String branch = req.getParameter("branch");
		String sem = req.getParameter("semester");
		String year = req.getParameter("year");
		String staffname = req.getParameter("staffname");
		//System.out.println("sdkjdf"+branch+year+sem);
			if( (!year.equals("0")) && (!branch.equals("0")) && (!sem.equals("0") ) ) 
			{
				TimetableHelper timetablemodel  = new TimetableHelper();
				timetablemodel.deleteTimeTable(req,res);
				
			}
		else if (!staffname.equals("0")){
			TimetableHelper timetablemodel  = new TimetableHelper();
			timetablemodel.deleteTimeTable(req,res);
			
		}
		else
		{
			req.setAttribute("message",
					"Select correct branch,semester,year or staffname..");

			RequestDispatcher rd = req
					.getRequestDispatcher("/admin");
			rd.forward(req, res);
		}
}



	}
