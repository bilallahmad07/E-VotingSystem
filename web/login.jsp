<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginPage</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script type="text/javascript" src="CSValidation.js"></script>
        <script src="sliderengine/jquery.js"></script>
        <script src="sliderengine/amazingslider.js"></script>
        <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
        <script src="sliderengine/initslider-1.js"></script>
        <script type="text/javascript" src="bioFingerPrint.js"></script>
    </head>
    <body>
        <OBJECT classid="CLSID: E730808D-30BE-32FE-B057-0B0EA7F79060" height="0" width="0" id="objBioBSP" name="objBioBSP"></OBJECT>
        <div id="wr">
            <%@include file="header.jsp" %>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">

                            <form action="chk_acc.jsp" method="post" name="MainForm" OnSubmit="return regist();">
                                <input type=hidden name='FIRTextData'>
                                <table id="table1" border="1" style="height: 300px">
                                    <tr><th colspan="2"><u>Sign in From Here!</u></th></tr>
                                    <tr>
                                        <td>Type:</td><td>
                                            <select name="logintype" value="logintype" id="logintype" required>
                                                <option value="" selected="selected">---select---</option>
                                                <option name="admin" value="admin">Admin</option>
                                                <option name="officer" value="officer">Officer</option>
                                                <option name="voter" value="voter">Voter</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Epic : </td><td><input type="text" id="epic" name="epic" required/></td>
                                    </tr>
                                    <tr>
                                        <td>Adhar Number : </td><td><input type="text" id="adhar" name="adhar" required/></td>
                                    </tr>
                                    <tr>
                                        <td>Password : </td><td><input type="password" name="biometric" id="biometric" required/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input type="submit" value="submit"/>
                                    </tr>
                                </table>
                            </form>

                        </div>
                        <div id="lw22right" style="margin-top: -27px;">
                            <div id="up" style="height: 270px;"><br><br>
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
