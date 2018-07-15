<html>
    <head>
        <script type="text/javascript">
            alert("Invalid OTP! Please try again");
        </script>
    </head>
    <body>
        <%
            session.invalidate();
            out.println("<br><br><br><center><a href='login.jsp'>Click here to go to Login Page</center>");
        %>
    </body>
</html>

