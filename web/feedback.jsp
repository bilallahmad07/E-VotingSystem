<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        
    </head>
    <body><br><br>
        <form action="submitfeedback" method="post">
            <%
            if (request.getParameter("msg")!=null) {
                out.println("<center><h4>Feedback Saved</h4></center>");
            }
        %>
            <table align="center" border="1">
                <tr><th colspan="2">Enter Your Feedback</th></tr>
                        <%
                            if (session.getAttribute("adhar") == null) {
                        %>
                <tr><td>Adhar : </td><td><input name="adhar" required /></td></tr><br>
                        <%
                        } else {
                            String s = session.getAttribute("adhar") + "";
                        %>
                <input name="adhar" type="hidden" value="<%=s%>">
                <%
                    }
                %>
                <tr><td>Feedback : </td><td><textarea rows="10" cols="80" name="feedback"></textarea></td></tr>
                <br><br>
                <tr><td></td><td><input type="submit"/></td></tr>
            </table>
                
        </form>
    <center><p id="pp"></p></center>
    </body>
</html>
