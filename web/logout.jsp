<%-- 
    Document   : logout
    Created on : 03-nov-2014, 21:35:10
    Author     : Raf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect(request.getContextPath());
        %>
    </body>
</html>
