<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
   import="java.lang.*,
			java.util.*,
			javax.xml.parsers.*,
			org.xml.sax.*,
			org.w3c.dom.*,
			java.io.*,
			javax.xml.transform.*,
			javax.xml.transform.stream.*,
			javax.xml.transform.dom.DOMSource,
			java.util.Date,
			java.text.*"
		   %>  
		   
<html lang=zh-TW>
	<head>
		<script src="js/bootstrap.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<link href="css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
		body {
			background: #304352;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #d7d2cc, #304352);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #d7d2cc, #304352); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		}
		</style>
	</head>
	
	<body>
		<% 
		String no =new String(request.getParameter("no").getBytes("ISO-8859-1"), "UTF-8");
		Document document;
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);
		DocumentBuilder db = dbf.newDocumentBuilder();
		String filename = no.concat(".xml");
		try {
		  //讀檔案
			File fileX = new File("C:\\Users\\NCHU\\workspace\\EquipManage\\WebContent\\xmls\\"+filename);
			document = db.parse(fileX);
			fileX.delete();

	%>
	<div class="page-container">
			<!-- header -->
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header "  >
				   <a class="navbar-brand" href="index.html">器材管理系統</a>
				</div>
			</nav><!-- end of header -->
			
			<div class="container" style="margin-top:70px; text-align: center;"><!-- main part -->
			<img src="img\Delete-Success.png" width="250"/>
			</div><!-- end of main part -->
			<div align="right"><a href="index.html"><img src="img\Home2.png" width="150"/></a></div>
		</div>
		
		<%
		}catch(SAXException se) {
			System.out.println("error");
		} catch(Exception ee){
			ee.printStackTrace();
		}
	%>
	</body>
</html>