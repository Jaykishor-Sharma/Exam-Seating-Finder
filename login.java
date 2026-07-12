package myFirstBackendProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/loginForm")
public class login extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req , HttpServletResponse res) throws  IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		String myEnroll = req.getParameter("enroll");

		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/storage" , "root" , "Jay@#2005");
			PreparedStatement ps = con.prepareStatement("select * from seatingtable where enrollment_no = ?" );
			ps.setString(1, myEnroll);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
			    
				User  user = new User();
				user.setEnrollment(rs.getString("enrollment_no"));
				user.setBuilding(rs.getString("building_name"));
				user.setRoom(rs.getString("room_no"));
				
				HttpSession session = req.getSession();
				session.setAttribute("session_user", user);
				RequestDispatcher rd = req.getRequestDispatcher("/profile.jsp");
				rd.include(req, res);
				
			}else {
				
				out.print("<h3 style ='color:red'> Enrollment No is not Exist. </h3>");
				
				RequestDispatcher rd = req.getRequestDispatcher("/fron.html");
				rd.include(req, res);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();

		}
		
	}

}
