<%@page import="java.text.SimpleDateFormat"%>
<%    if (((session.getAttribute("adhar")) == null) || ((session.getAttribute("Biometric")) == null)) {
        response.sendRedirect("invalid.jsp");
    }
%>
<%!SimpleDateFormat df;%>
<%    df = new SimpleDateFormat("dd/MM/yyyy");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
    </head>
    <body>
        <div id="wr" style="height: 1200px">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 1000px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 800px">
                    <%@include file="lw21voter.jsp" %>
                    <div id="lw22" style="height: 800px">
                        <div id="lw22left" style="height: 800px">
                            <table id="table1" border="1" style="margin-top: 5px; text-align: left;">
                                <%! int f = 0;%>
                                <%! String adhar, type, bio;%>
                                <%!java.util.Date datee;%>
                                <%@include file = "driver.jsp" %> 
                                <%
                                    adhar = session.getAttribute("adhar") + "";
                                    bio = session.getAttribute("Biometric") + "";
                                    try {
                                        String msg = "", x = "";
                                        int i = 1;
                                        String left[] = {"", "Adhar", "Name", "Emailid", "Telephone No.", "Mobile No.", "House No.", "Area", "Thana", "Post Office", "City", "Constituency", "Polling Booth", "State", "Pincode", "Father's Name", "Mother's Name", "Husband's Name", "Religion", "Sex", "Date of Birth", "Epic"};
                                        Statement stmt = conn.createStatement();
                                        ResultSet rset = stmt.executeQuery("select * from voter where adhar = '" + adhar + "'");
                                        if (rset.next()) {
                                %>
                                <tr><th colspan="2"><center><u>Voter's Slip</u></center></th></tr>
                                <tr><td><b><%=left[21]%></b></td><td><%=rset.getString(24)%></td></tr>
                                        <%
                                            while (i < 20) {
                                                x = rset.getString(i);
                                                if (x == null) {
                                                    x = "N/A";
                                                }
                                        %>
                                <tr><td><b><%=left[i]%></b></td><td><%=x%></td></tr>
                                        <%

                                                i++;
                                            }
                                            datee = rset.getDate("dateofbirth");
                                            String d2 = df.format(datee);
                                        %>

                                <tr><td><b><%=left[20]%></b></td><td><%=d2%></td></tr>

                                <%
                                        }
                                    } catch (Exception e) {
                                        out.println("Could not login : " + e);
                                    }
                                %>
                                <tr><td colspan="2">Note 1 : This Voter Slip is not an Identification Document.</td></tr>
                                <tr><td colspan="2">Note 2 : Bringing this voter Slip at the polling station is not compulsary.
                                        It is issued only as a convenience to electors.</td></tr>
                                <tr><td colspan="2">Note 3 : If this Voter Slip does not have a photograph or it has a wrong
                                        particulars or photograph, the voter can still be allowed to vote based on alternate
                                        identity documents permitted by Election Commision of India.</td></tr>
                            </table>

                        </div>
                        <div id="lw22right" style="height: 800px">
                            <div id="up" style="height: 300px">
                                <br><br>
                                <a href="http://eci.nic.in/eci_main1/ecz.aspx" style="color: black; text-decoration: none; font-size: 16px;">
                                    <img src="images/cec_nz.jpg" style="margin-left: 25%; width: 50%; margin-top: 10px; border: 2px solid #666666;"/>
                                    <br>
                                    <center>Dr. Nasim Zaidi<br>Cheif  Election Commisioner</center></a>
                            </div>
                            <div id="middle" style="height: 485px">
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
