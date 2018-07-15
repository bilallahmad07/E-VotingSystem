<%@page import="java.text.SimpleDateFormat"%>
<%    session.invalidate();
%>
<%@page import="java.util.*" %>
<%!String date;%>
<%!SimpleDateFormat df;%>
<%
    df = new SimpleDateFormat("yyyy/MM/dd");
    date = df.format(new java.util.Date());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script src="sliderengine/jquery.js"></script>
        <script src="sliderengine/amazingslider.js"></script>
        <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
        <script src="sliderengine/initslider-1.js"></script>
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
                            <br>
                            <%@include file="driver.jsp" %>
                            <%
                                ResultSet rsltset;
                                Statement stmt;
                                stmt = conn.createStatement();
                                rsltset = stmt.executeQuery("select resdate from resultdate");
                                rsltset.next();
                                java.util.Date dddd = rsltset.getDate(1);
                                String date2 = df.format(dddd);
                                if (date.equals(date2)) {
                            %>
                            <center><h1>Welcome to Results</h1></center><br><br>
                            <span style="font-size: 22px; margin-left: 30px;">Select the type of Result</span><br>
                            <ul>
                                <li><a href="const_result.jsp">Constituency Wise Result</a></li><br>
                                <li><a href="state_result.jsp">State Wise Result</a></li><br>
                                <li><a href="seepercentvoting.jsp?cid=1">See Voting Percentage</a></li>
                            </ul>
                            <%
                                } else {
                                    out.println("<center><h2>Results will declared only on Result Day</h2></center><br><br>");
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
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/Linkto_electo_search.aspx">Search your name in voter's list</a></td></tr>
                                    <tr class="tr2"><td><a href="http://psleci.nic.in/">Know your Polling Station</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/tm.aspx">Training Material</a></td></tr>
                                    <tr class="tr2"><td><a href="http://eci.nic.in/eci_main1/electoral_law.aspx">Election Laws & instructions</a></td></tr>
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
