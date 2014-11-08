<%-- 
    Document   : head
    Created on : 26-oct-2014, 12:11:35
    Author     : Rafael Mateo Boloix
--%>

<%@tag description="head" pageEncoding="UTF-8"%>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="title"%>
<%-- any content can be specified here e.g.: --%>
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Apparkt | ${title} ${pageContext.request.contextPath}</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/p-logo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link href='http://fonts.googleapis.com/css?family=Expletus+Sans:700,400' rel='stylesheet' type='text/css'/>
    <link href="${pageContext.request.contextPath}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div id="main-content" class="container-fluid">