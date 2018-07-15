<%@page import="java.text.SimpleDateFormat"%>
<%!String date;%>
<%!SimpleDateFormat df;%>
<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
    df = new SimpleDateFormat("yyyy/MM/dd");
    date = df.format(new java.util.Date());
%>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <link rel="stylesheet" type="text/css" href="newcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script>
            function chk_input() {
                var a;
                a = document.getElementById("option").value;
                if (a == "")
                {
                    alert("Please select the candidate to cast vote!");
                    return false;
                }
                else
                {

                    return true;
                }
            }

            function prreset() {

                if (confirm("Do you want to reset!"))
                    return true;
                else
                    return false;
            }

        </script>

    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header.jsp" %>
            <div id="lw" style="height: 900px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 700px">
                    <%@include file="lw21voter.jsp" %>
                    <div id="lw22" style="height: 700px">
                        <div id="lw22left" style="height: 700px">
                            <%@include file="driver.jsp" %>
                            <%!String adhar, status, cons, state;%>
                            <%
                                try {
                                    Statement stmt = conn.createStatement();
                                    adhar = session.getAttribute("adhar") + "";
                                    ResultSet rsltset = stmt.executeQuery("select * from voter where adhar = '" + adhar + "'");
                                    if (rsltset.next()) {
                                        status = rsltset.getString("status");
                                        session.setAttribute("status", status);
                                        state = rsltset.getString("State");
                                        cons = rsltset.getString("Constituency");
                                    }
                                    rsltset = stmt.executeQuery("select votingdate from state where state = '" + state + "' and constituency = '" + cons + "'");
                                    rsltset.next();
                                    java.util.Date dddd = rsltset.getDate(1);
                                    String date2 = df.format(dddd);
                                    if (date.equals(date2)) {
                                        if (status.equals("0")) {
                                            int i = 1;
                            %>
                            <form action="vote_entry.jsp" method="post">
                                <table id="table1" border="1" style="width: 90%; height: 90%; margin-left: 5%;">
                                    <tr><th colspan="5">Voting Ballot</th></tr>
                                    <tr><th><u>sl. no.</u></th><th><u>Party</u></th><th><u>Logo</u></th><th><u>Candidate</u></th><th><u>Select</u></th></tr>

                                    <%
                                        ResultSet rset = stmt.executeQuery("select * from candidate where state = '" + state + "' and constituency = '" + cons + "'");
                                        while (rset.next()) {
                                            String a = rset.getString("party");
                                            String b = rset.getString("Logo");
                                            String c = rset.getString("name");
                                    %>
                                    <tr>
                                        <td><%=i%>
                                        <td><%=a%></td>
                                        <td><img src="images/<%=b%>" ></td>
                                        <td><%=c%></td>
                                        <td>
                                            <input type="radio" name="option" value="<%=a%>" id="option"  required>
                                        </td>
                                    </tr>
                                    <%i = i + 1;
                                        }
                                    %>
                                    <tr>
                                        <td colspan="5"><input type="submit" value="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="reset" onclick="return prreset()"</td>
                                    </tr>
                                </table>
                            </form>
                            <%
                                        } else {
                                            out.println("<h2><center>You have already casted your vote</center></h2>");
                                        }
                                    } else {
                                        out.println("<h2>You are allowed to vote on voting day only."
                                                + " Please see the Voting Dates by clicking Election Dates</h2>."
                                                + "<br>"
                                                + "<a href='date_1.jsp'>or you can also click here to see the voting dates!</a>");
                                    }
                                } catch (Exception e) {
                                    out.println("Could not login : " + e);
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
