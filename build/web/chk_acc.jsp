<%@include file = "driver.jsp" %> 
<%@page import="bilal.OTP"%>
<%@page import="bilal.SendMail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>

        <%! int f = 0;%>
        <%! String adhar, type, x, y, biometric, epic;%>
        <%            type = request.getParameter("logintype");
            adhar = request.getParameter("adhar");
            biometric = request.getParameter("biometric");
            epic = request.getParameter("epic");
            String msg = "";

            try {
                out.println("aa");
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery("select Biometric,epic,emailid from " + type + " where Adhar = '" + adhar + "'");
                if (rset.next()) {
                    String b = rset.getString(1);
                    String e = rset.getString(2);
                    String emailid=rset.getString(3);
                    if ((b.equals(biometric)) && (e.equals(epic))) {
                        session.setAttribute("adhar", adhar);
                        session.setAttribute("type", type);
                        session.setAttribute("Biometric", b);
                        session.setAttribute("epic", epic);
                        OTP otp = new OTP();
                        long o = otp.random();
                        //out.println("aa");
                        SendMail.sendMail(emailid, "OTP from E-VotingSystem", o+""); 
                        session.setAttribute("otp", o);
                        
                       %>
                        
                               
    <%
    response.sendRedirect("login2.jsp");
    } else {
    msg = "Biometric or Epic Not Matched!";
    }
    //stmt.executeQuery("create table bill(name varchar2(10))");
    } else {
    msg = "Wrong Adhar Number of " + type + "!";
    }
    %>
    <script>
        alert("<%= msg%>");
    </script>
    <%
            out.println("Click Here to go back!<a href='index.jsp'>Home</a>");
        }catch (Exception e) {
            out.println("Could not login : " + e);
        }

    %>
</body>
</html>
