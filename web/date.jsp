<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Dates</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script type="text/javascript" src="Aj_consti.js"></script>
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

                            <h2 style="margin-left: 33%">Dates of Elections.</h2>
                            <form action="date_info.jsp" method="post">
                                <table align="center" id="table1" style="height: 150px;" border="1">
                                    <tr>
                                        <td class="align">Select state</td>
                                        <td class="align">
                                            <select class="align" value="" onblur="funp()" name="states" id="states" required>
                                                <option value="" selected="selected">---select---</option>
                                                
                                                <%@include file="driver.jsp" %> 
                                                <%
                                                    Statement stmt;
                                                    ResultSet rset;
                                                    try {
                                                        stmt = conn.createStatement();
                                                        rset = stmt.executeQuery("select distinct state from state");
                                                        while (rset.next()) {
                                                %>
                                                <option name="<%= rset.getString("state")%>" value="<%= rset.getString("state")%>"><%= rset.getString("state")%></option>
                                                <%
                                                    }
                                                    }
                                                    catch(Exception e){
                                                        out.println("Error : "+e);
                                                    }
                                                %>  
                                            </select>*
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="align">Constituency:</td>
                                        <td class="align">
                                            <select name="consti" value="" id="consti" required>
                                                <option value="" selected="selected">---select state first---</option>
                                                
                                            </select>*    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input type="submit" value="submit" onclick="return chkdetail()"/>&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="reset" value="reset" onclick="return prReset()"/></td>
                                    </tr>
                                </table>
                            </form>

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
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
