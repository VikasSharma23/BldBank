import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
// Import Database Connection Class file
import mypack.dbconnect;
  
// Servlet Name
public class user extends HttpServlet {
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        String dname = request.getParameter("dname");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String bld = request.getParameter("bld");
        String location = request.getParameter("location");
        String password = request.getParameter("password");
        try {
  
            // Initialize the database
            Connection con = dbconnect.initializeDatabase();

            Statement stmt = con.createStatement();
  
            String sql = "INSERT INTO newdonor (Dname,MobileNum,Email,Gender,Age,BloodGroup,Location,Password) VALUES ('"+dname+"', '"+mobile+"', '"+email+"', '"+gender+"', '"+age+"', '"+bld+"', '"+location+"', '"+password+"')";
            stmt.executeUpdate(sql); 
  
            // Close all the connections
            stmt.close();
            con.close();
  
            // Get a writer pointer 
            // to display the successful result
            // out.println("<html><body><b>Successfully Inserted"
            //             + "</b></body></html>");
            out.pritntln("Name "+ dname);
            // out.pritntln("Mobile Number ");
            // out.pritntln("");
            // out.pritntln("");
            // out.pritntln("");
            // out.pritntln("");
            // out.pritntln("");
            // out.pritntln("");
        }
        catch (Exception e) {
            out.println("Error Occured "+e);
            e.printStackTrace();
        }
    }
}