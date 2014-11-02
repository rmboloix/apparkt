<%-- 
    Document   : index
    Created on : 01-nov-2014, 20:09:12
    Author     : Raf
--%>

<%@page import="java.security.Principal"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Root!</h1>
        <% 
            Principal p = request.getUserPrincipal();
        %>
        
        <%=p.getName() %>
        
    </body>
</html>
