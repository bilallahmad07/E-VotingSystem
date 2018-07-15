package bilal;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class submitfeedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("error.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        Connection conn;
        try{
        Driver driver = (Driver) Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bilal", "bil1212210039");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select max(fid)+1 from feedback");
        rs.next();
        int fid = rs.getInt(1);
        PreparedStatement ps = conn.prepareStatement("insert into feedback values(?,?,?)");
        ps.setString(1,request.getParameter("adhar"));
        ps.setString(2,request.getParameter("feedback"));
        ps.setInt(3,fid);
        int n = ps.executeUpdate();
        if(n==1){
            response.sendRedirect("feedback.jsp?msg=saved");
        }
        }
        catch(Exception e){
            
            out.println("Feedback not Saved : "+e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
