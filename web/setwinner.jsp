<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
    String type = (String) (session.getAttribute("type"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Candidates</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <div id="lw21">
                        <div style="height: 100px; width: 95%; background-color: #ffff99">
                            <center><span style="font-size: 20px; font-weight: 900;">Welcome<br><%=session.getAttribute("type")%><br></span>
                                <a href="logout.jsp"><input type="button" value="logout"/></a></center>
                        </div>
                        <table id="tble1" style="width: 95%; height: 590px; margin-top: 5px; background-color: #ffcccc; text-align: center;">
                            <tr class="tr1"><td><a href="<%= type%>" >Home</a></td></tr>
                            <tr class="tr1"><td><a href="http://eci.nic.in">Visit ECI</a></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>
                    </div>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <br><br>
                            <%@include file="driver.jsp" %>
                            <%!String state, cons, party, name;%>
                            <%
                                state = session.getAttribute("state").toString();
                                cons = session.getAttribute("constituency").toString();
                                party = request.getParameter("option");
                                
                                int i = 1;
                                        try {
                                            Statement stmt = conn.createStatement();
                                            stmt.executeUpdate("update state set party = '"+party+"' where constituency = '"+cons+"' and state = '"+state+"'");      
                                            PreparedStatement ps = conn.prepareStatement("select name from candidate where party = ? and constituency = ? and state = ?");
                                            ps.setString(1,party);
                                            ps.setString(2,cons);
                                            ps.setString(3, state);
                                            ResultSet rs = ps.executeQuery();
                                            if(rs.next()){
                                                name = rs.getString(1);
                                                ps = conn.prepareStatement("update state set winner = ? where state = ? and constituency = ?");
                                                ps.setString(1, name);
                                                ps.setString(2, state);
                                                ps.setString(3, cons);
                                                ps.executeUpdate();
                                                out.println("<center><h3>Result Saved</h3></center>");
                                            }
                                            else out.println("<center><h3>Result not Saved</h3></center>");
                                            } catch (Exception e) {
                                             out.println("<center><h3>Result not Saved : </h3></center>"+e);
                                        }

                                    %>
                        </div>
                        <div id="lw22right" style="height: 700px">
                            <div id="up" style="height: 270px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 415px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                    <tr><td></td></tr>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
