<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <link rel="stylesheet" type="text/css" href="newcss.css"/>
        <script type="text/javascript" src="disable.js"></script>

    </head>
    <body>
        <div id="wr">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">

                            <%
                                String state = request.getParameter("states");
                                String cons = request.getParameter("consti");

                            %>
                            <%@page import="java.sql.*"%>
                            <%
                                String msg = "";
                                Class.forName("oracle.jdbc.OracleDriver");
                                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bilal", "bil1212210039");
                                Statement stmt = conn.createStatement();
                                ResultSet rs3 = stmt.executeQuery("select state from state where constituency = '" + cons + "'");
                                if (rs3.next()) {
                                    String db_state = rs3.getString(1);
                                    if (db_state.equals(state)) {
                                        ResultSet rs1 = stmt.executeQuery("select winner,party from state where constituency = '" + cons + "'");
                                        if (rs1.next()) {
                                            out.println("<br><center><h3>The Winner from " + cons + " is " + rs1.getString(1) + " of " + rs1.getString(2) + "</center></h3>");
                                        }
                                        ResultSet rs2 = stmt.executeQuery("select name,party,logo,votes from candidate where constituency = '" + cons + "'");
                                        int i = 1;
                                        %>
                                        <table id="table1" border="1" style="width: 95%; margin-left: 5px; text-align: center">
                                        <tr><th>Sl. no.</th><th>Logo</th><th>Name</th><th>Party</th><th>Votes</th></tr>
                                        <%
                                        while (rs2.next()) {

                            %>
                            <tr><td><%=i%></td><td><img src="images/<%=rs2.getString(3)%>" /></td><td><%=rs2.getString(1)%></td><td><%=rs2.getString(2)%></td><td><%=rs2.getString(4)%></td></tr>
                                    <%
                                                    i++;
                                                }
                                        %>
                                        </table>
                                        <%
                                            } else {
                                                msg = msg + "The Constituency does not belongs to selected State";
                                            }
                                        } else {
                                            msg = msg + "The Constituency does not exist in the database. Please contact the ECI";
                                        }
                                        out.println("<br><center><h3>" + msg + "</h3></center>");
                                    %>
                            <br>
                        </div>
                        <div id="lw22right" style="height: 600px;  margin-top: -27px;">
                            <div id="up" style="height: 270px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 315px">
                                <table style="text-align: center; width: 100%; height: 98%; margin-top: 5px; ">
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/Linkto_electo_search.aspx">Search your name in voter's list</a></td></tr>
                                    <tr class="tr2"><td><a href="http://psleci.nic.in/">Know your Polling Station</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>                                    <tr><td></td></tr>
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
                    <!--<div id="ft"></div>-->
                </div>
                </body>
                </html>
