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
			background: #283048;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #859398, #283048);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #859398, #283048); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			}
		</style>
	</head>
	
	<body>
		<% 
		String org =new String(request.getParameter("org").getBytes("ISO-8859-1"), "UTF-8");
		String activity =new String(request.getParameter("activity").getBytes("ISO-8859-1"), "UTF-8");
		String location =new String(request.getParameter("location").getBytes("ISO-8859-1"), "UTF-8");
		String time =new String(request.getParameter("date").getBytes("ISO-8859-1"), "UTF-8");
		String mixer =new String(request.getParameter("mixer").getBytes("ISO-8859-1"), "UTF-8");
		String speaker =new String(request.getParameter("speaker").getBytes("ISO-8859-1"), "UTF-8");
		String console =new String(request.getParameter("console").getBytes("ISO-8859-1"), "UTF-8");
		String mic =new String(request.getParameter("mic").getBytes("ISO-8859-1"), "UTF-8");
		String par =new String(request.getParameter("par").getBytes("ISO-8859-1"), "UTF-8");
		String wire =new String(request.getParameter("wire").getBytes("ISO-8859-1"), "UTF-8");
		String led =new String(request.getParameter("led").getBytes("ISO-8859-1"), "UTF-8");
		String line =new String(request.getParameter("line").getBytes("ISO-8859-1"), "UTF-8");
		
		XML.PriceServiceLocator service = new XML.PriceServiceLocator();
		XML.Price port = service.getPrice();
		int price = port.getPrice(mixer, console, Integer.parseInt(speaker), Integer.parseInt(mic), Integer.parseInt(par), Integer.parseInt(led), Integer.parseInt(wire), Integer.parseInt(line));
		
		Document document;
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("SSS");
		String random = ft.format(dNow).toString();
		String file_name = time.replaceAll("-", "");
		file_name = file_name.concat(random);
		
		try {
		  //讀檔案
			DocumentBuilder db = dbf.newDocumentBuilder();
			File file = new File("C:\\Users\\NCHU\\workspace\\EquipManage\\WebContent\\equip.xml");
			document = db.parse(file);	
		//修改內容
			Element element = (Element) document.getDocumentElement();
			Attr attr_num = element.getAttributeNode("number");
			attr_num.setTextContent(file_name);
			Attr attr_date = element.getAttributeNode("date");
			attr_date.setTextContent(time);
			Element element_org = (Element) document.getElementsByTagName("org").item(0);
			element_org.setTextContent(org);
			Element element_act = (Element) document.getElementsByTagName("activity").item(0);
			element_act.setTextContent(activity);
			Element element_location = (Element) document.getElementsByTagName("location").item(0);
			element_location.setTextContent(location);
			Element element_mixer = (Element) document.getElementsByTagName("mixer").item(0);
			element_mixer.setTextContent(mixer);
			Element element_con = (Element) document.getElementsByTagName("console").item(0);
			element_con.setTextContent(console);
			Element element_speaker = (Element) document.getElementsByTagName("speaker").item(0);
			element_speaker.setTextContent(speaker);
			Element element_mic = (Element) document.getElementsByTagName("mic").item(0);
			element_mic.setTextContent(mic);
			Element element_par = (Element) document.getElementsByTagName("par").item(0);
			element_par.setTextContent(par);
			Element element_led = (Element) document.getElementsByTagName("led").item(0);
			element_led.setTextContent(led);
			Element element_wire = (Element) document.getElementsByTagName("wire").item(0);
			element_wire.setTextContent(wire);
			Element element_line = (Element) document.getElementsByTagName("line").item(0);
			element_line.setTextContent(line);
			Element element_price = (Element) document.getElementsByTagName("price").item(0);
			element_price.setTextContent(Integer.toString(price));
		//輸出為新的XML
			TransformerFactory tff = TransformerFactory.newInstance();
			Transformer tf = tff.newTransformer();
			FileOutputStream ofile = new FileOutputStream("C:\\Users\\NCHU\\workspace\\EquipManage\\WebContent\\xmls\\"+file_name.concat(".xml"));
			tf.transform(new DOMSource(document),new StreamResult(ofile));
			ofile.close();
		
		}catch(SAXException se) {
			System.out.println("error");
		} catch(ParserConfigurationException pce){
			System.out.println("errorfffff");
		} catch(Exception ee){
			ee.printStackTrace();
		}
		%>
	
	<div class="page-container">
			<!-- header -->
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header "  >
				   <a class="navbar-brand"  href="index.html">器材管理系統</a>
				</div>
			</nav><!-- end of header -->
			
			<div class="container" style="margin-top:70px; "><!-- main part -->
			<div class="panel panel-default">
			<table class="table table-bordered" style="background-color: white; text-align: center;" >
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
					<td colspan="3"><%=file_name%></td></tr>
			</table>
			</div>
			<img src="img\Add-Success.png" width="200" style="margin:0px auto;display:block"/>
			</div><!-- end of main part -->
			<div align="right"><a href="index.html"><img src="img\Home2.png" width="150"/></a></div>
		</div>
	</body>
</html>
