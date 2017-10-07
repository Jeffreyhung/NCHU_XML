<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"
   import="java.lang.*,java.util.*,javax.xml.parsers.*,
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
			background: #403B4A;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #E7E9BB, #403B4A);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #E7E9BB, #403B4A); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			}
		</style> 
	</head>
	<body>
	<%
		String time =new String(request.getParameter("date").getBytes("ISO-8859-1"), "UTF-8");
		final String time_short = time.replaceAll("-", "");
		Document document;
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);
		DocumentBuilder db = dbf.newDocumentBuilder();
		File dir = new File("C:\\Users\\NCHU\\workspace\\EquipManage\\WebContent\\xmls\\");
		File[] foundFiles = dir.listFiles(new FilenameFilter(){
			public boolean accept(File dir, String name) {
				return name.startsWith(time_short);
			}
		});
		String no, org, activity, location, mixer, console, speaker, mic, par, wire, led, line, price;
	%>
		<div class="page-container">
				<!-- header -->
				<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
					<div class="navbar-header "  >
					   <a class="navbar-brand" href="index.html">器材管理系統</a>
					</div>
				</nav>
				<!-- end of header -->
				<div class="container" style="margin-top:70px; text-align: center;">
					<%
					for (File file : foundFiles) {
						document = db.parse(file);
						Element element = (Element) document.getDocumentElement();
						Attr attr_num = element.getAttributeNode("number");
						no = attr_num.getTextContent();
						Element element_org = (Element) document.getElementsByTagName("org").item(0);
						org = element_org.getTextContent();
						Element element_act = (Element) document.getElementsByTagName("activity").item(0);
						activity =element_act.getTextContent();
						Element element_location = (Element) document.getElementsByTagName("location").item(0);
						location = element_location.getTextContent();
						Element element_mixer = (Element) document.getElementsByTagName("mixer").item(0);
						mixer = element_mixer.getTextContent();
						Element element_con = (Element) document.getElementsByTagName("console").item(0);
						console = element_con.getTextContent();
						Element element_speaker = (Element) document.getElementsByTagName("speaker").item(0);
						speaker = element_speaker.getTextContent();
						Element element_mic = (Element) document.getElementsByTagName("mic").item(0);
						mic = element_mic.getTextContent();
						Element element_par = (Element) document.getElementsByTagName("par").item(0);
						par = element_par.getTextContent();
						Element element_led = (Element) document.getElementsByTagName("led").item(0);
						led = element_led.getTextContent();
						Element element_wire = (Element) document.getElementsByTagName("wire").item(0);
						wire = element_wire.getTextContent();
						Element element_line = (Element) document.getElementsByTagName("line").item(0);
						line = element_line.getTextContent();
						Element element_price = (Element) document.getElementsByTagName("price").item(0);
						price = element_price.getTextContent();
						%>
						
						<div class="panel panel-default">
						<table class="table table-bordered" style="background-color: white; text-align: center;">
						<tr><td colspan="6"><b>借用器材</b></td></tr>
						<tr><td>借用單位</td>
							<td><%=org%></td>
							<td>活動名稱</td>
							<td><%=activity%></td>
							<td>活動地點</td>
							<td ><%=location%></td></tr>
						<tr><td colspan="3">活動時間</td>
							<td colspan="3"><%=time%></td></tr>
						<tr><td colspan="6"><b>借用器材</b></td></tr>
						<tr><td>混音機</td>
							<td colspan="2"><%=mixer%></td>
							<td>喇叭數量</td>
							<td colspan="2"><%=speaker%></td></tr>
						<tr><td>燈光前級</td>
							<td colspan="2"><%=console%></td>
							<td>麥克風數量</td>
							<td colspan="2"><%=mic%></td></tr>
						<tr><td>PAR</td>
							<td colspan="2"><%=par%></td>
							<td>電源線</td>
							<td colspan="2"><%=wire%></td></tr>
						<tr><td>LED</td>
							<td colspan="2"><%=led%></td>
							<td>訊號線</td>
							<td colspan="2"><%=line%></td></tr>
						<tr><td colspan="3">價格</td>
							<td colspan="3"><%=price%></td></tr>
						<tr><td colspan="3">編號</td>
							<td colspan="3"><%=no%></td></tr>
						</table>
						</div>
						<br/>
						<%
					} 
				%>
				<div align="right"><a href="index.html"><img src="img\Home2.png" width="150"/></a></div>
				<br/>
				</div>
		</div>
	</body>
</html>
   