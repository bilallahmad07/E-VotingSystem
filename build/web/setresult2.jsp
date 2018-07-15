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
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="indexcss.css"/>
        <link rel="stylesheet" type="text/css" href="menu.css"/>
        <script type="text/javascript" src="disable.js"></script>
        <script type="text/javascript" src="register.js"></script>
    </head>
    <body>
        <div id="wr" style="height: 1100px">
            <%@include file="header2.jsp" %>
            <div id="lw" style="height: 1000px">
                <%@include file="lw1.jsp" %>
                <div id="lw2" style="height: 800px">
                    <%@include file="driver.jsp" %>
                    <%    Statement stmt, stmt2;
                        ResultSet rs1, rs2, rs3;
                        String cons, winner, party;
                        int lt = Integer.parseInt(session.getAttribute("lt") + "");
                        stmt = conn.createStatement();
                        stmt2 = conn.createStatement();
                        rs1 = stmt.executeQuery("select max(cid) from state");
                        int max;
                        rs1.next();
                        max = rs1.getInt(1);
                        if (lt >= max) {
                            out.println("<center><h3>Result Saved</h3></center>");
                        } else {
                            String save[] = request.getParameterValues("save");
                            if (save!=null) {
                                for (int i = 0; i < save.length; i++) {
                                    rs1 = stmt.executeQuery("select constituency from state where cid=" + Integer.parseInt(save[i]));
                                    rs1.next();
                                    cons = rs1.getString(1);
                                    rs2 = stmt.executeQuery("select name, party from CANDIDATE where CONSTITUENCY = '" + cons + "' and VOTES>=all(select votes from CANDIDATE where CONSTITUENCY =  '" + cons + "')");
                                    if (rs2.next()) {
                                        winner = rs2.getString(1);
                                        party = rs2.getString(2);
                                        stmt.executeUpdate("update state set winner = '" + winner + "' where cid = " + Integer.parseInt(save[i]));
                                        stmt.executeUpdate("update state set party = '" + party + "' where cid = " + Integer.parseInt(save[i]));
                                        stmt.executeUpdate("update state set result = '" + 1 + "' where cid = " + Integer.parseInt(save[i]));
                                        int diff=0, v1=0, v2=0;
                                        rs3 = stmt2.executeQuery("SELECT votes FROM CANDIDATE where CONSTITUENCY = '"+cons+"' ORDER by VOTES desc ");
                                        if(rs3.next()){
                                            v1 = rs3.getInt(1);
                                        }
                                        if(rs3.next()){
                                            v2 = rs3.getInt(1);
                                        }
                                        diff = v1-v2;
                                        stmt.executeUpdate("update state set vote_diff = '" + diff + "' where cid = " + Integer.parseInt(save[i]));
                                        
                                    }
                                }
                            }
                            response.sendRedirect("setresult.jsp?value=" + lt);
                        }
                    %>
                </div>
            </div>
            <div id="ft"></div>
        </div>
    </body>
</html>
