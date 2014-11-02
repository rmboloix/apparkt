<%-- 
    Document   : index
    Created on : 01-nov-2014, 20:09:12
    Author     : Rafael Mateo Boloix
--%>

<%@page import="java.security.Principal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Root!</h1>
       
        <h2>Benvingut! ${pageContext.request.userPrincipal.name}</h2>
        
    </body>
</html>
