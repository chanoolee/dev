<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	<link rel="stylesheet" href="/css/style.css" />
	<script src="/js/jQuery-2.1.4.min.js"></script>
	<style>
	
	#sidebar-left {
        width: 15%;
        height:3100px;
        float: left;
        border: 0px solid #bcbcbc;
        font-size:15px;
        vertical-align: middle;
        text-align : center;
        background-color : #2c2c2c;
    }
    
    #header{
    	background-color : #2c2c2c;
    }
    

	</style>
</head>
<body>
		
		<div id = "header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id = "sidebar-left">
			<tiles:insertAttribute name="menu" />
		</div>
		<div align="center">
			<tiles:insertAttribute name="content" />
		</div>
		
		<tiles:insertAttribute name="footer" />
</body>
</html>
