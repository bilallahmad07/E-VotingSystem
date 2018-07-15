<%    session.invalidate();
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
        <div id="wr">
            <div id="hd">
                <div id="hd1">
                    <img src="images/hd1u.jpg" style="width: 89%; height: 100%;"/>
                </div>
                <div id="hd2">
                    <img src="images/evotingsys.png" style="width: 100%; height: 100%;"/>
                </div>
                <div id="hd3">
                    <div id="upr"></div>

                </div>
            </div>
            <div id="lw">
                <%@include file="lw1.jsp" %>
                <div id="lw2">
                    <%@include file="lw21.jsp" %>
                    <div id="lw22">
                        <div id="lw22left">
                            <h1 style="font-size: 42px; margin-left: 70px; color: red;"><b>It's Your Vote</b></h1>
                            <h1 style="font-size: 42px; margin-left: 160px; color: red;"><b>It's Your Choice.</b></h1>
                            <center>
                                <br>
                                <h2>
                                    <b style="margin-top: 10%; font-size: 30px;"><u>What is E-VOTING?</u></b>
                                </h2>
                            </center>
                            <p style="font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; 
                                font-size: 17px; margin-left: 15px; margin-right: 10px; text-align: left; ">E-Voting System is a web-based
                                system that facilitates the running of the Elections Online over the network i.e., Internet. 
                                This System have been developed to simplify the process of organising Elections and make it convinient 
                                for voters to vote remotely from their home.The Voters can register themselves online and their is no need
                                of standing in long queues for voting.
                            </p>
                        </div>
                        <%@include file="lw22right.jsp" %>
                    </div>
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
