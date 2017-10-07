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
		   
<!DOCTYPE html>
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
		
		<%
		String no =new String(request.getParameter("no").getBytes("ISO-8859-1"), "UTF-8");
		Document document;
		DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		dbf.setIgnoringElementContentWhitespace(true);
		DocumentBuilder db = dbf.newDocumentBuilder();
		String filename = no.concat(".xml");
		String time, org, activity, location, mixer, console, speaker, mic, par, wire, led, line, price;
		try {
		  //讀檔案
			File fileX = new File("C:\\Users\\NCHU\\workspace\\EquipManage\\WebContent\\xmls\\"+filename);
			document = db.parse(fileX);
			Element element = (Element) document.getDocumentElement();
			Attr attr_date = element.getAttributeNode("date");
			time = attr_date.getTextContent();
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

	</head>
	<body>
	
		<div class="page-container">
				<!-- header -->
				<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
					<div class="navbar-header "  >
					   <a class="navbar-brand" href="index.html">器材管理系統</a>
					</div>
				</nav>
				<!-- end of header -->
				<div class="container" style="margin-top:70px; "><!-- main part -->
				<form action = "update.jsp" method = "post" style="text-align: center;">
				<div class="panel panel-default">
				<table class="table table-bordered" style="background-color: white; text-align: center;">
					<tr>
						<td colspan="6"><b>借用器材	</b></td>
					</tr>
					<tr>
						<td>借用單位</td>
						<td><input type='text' name="org" value="<%=org %>"></td>
						<td>活動名稱</td>
						<td><input type='text' name="activity" value="<%=activity %>"></td>
						<td>地點</td>
						<td ><input type='text' name="location"  value="<%=location %>"></td>
					</tr>
					<tr>
						<td colspan="3">活動時間</td>
						<td colspan="3"><input type='date' name="date"  value="<%=time %>"></td>
					</tr>
					<tr>
						<td colspan="6"><b>借用器材</b></td>
					</tr>
					<tr>
						<td>混音機</td>
						<td colspan="2">
							<select class="form-control" name="mixer"> 
								<option  value="<%=mixer %>" selected="selected"><%=mixer %></option>
								<option value="o1">O1v96i</option> 
								<option value="yamaha">Yamaha</option> 
								<option value="bx">BX2442</option> 
								<option value="lm">LM</option> 
								<option value="rm">RM</option> 
							</select>
						</td>
						<td>喇叭數量</td>
						<td colspan="2">
							<select class="form-control" name="speaker">
								<option  value="<%=speaker %>" selected="selected"><%=speaker %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>燈光前級</td>
						<td colspan="2">
							<select class="form-control" name="console">
								<option  value="<%=console %>" selected="selected"><%=console %></option>
								<option value="dmx">DMX</option> 
								<option value="kk256">KK256</option> 
								<option value="kk1024p">KK1024p</option> 
								<option value="C24">C24</option>
							</select>
						</td>
						<td>麥克風</td>
						<td colspan="2">
							<select class="form-control" name="mic">
								<option  value="<%=mic %>" selected="selected"><%=mic %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>PAR燈</td>
						<td colspan="2">
							<select class="form-control" name="par"> 
								<option  value="<%=par %>" selected="selected"><%=par %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
							</select>
						</td>
						<td>電源線</td>
						<td colspan="2">
							<select class="form-control" name="wire"> 
								<option  value="<%=wire %>" selected="selected"><%=wire %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
								<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="1">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>LED燈</td>
						<td colspan="2">
							<select class="form-control" name="led">
								<option  value="<%=led %>" selected="selected"><%=led %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
							</select>
						</td>
						<td>訊號線</td>
						<td colspan="2">
							<select class="form-control" name="line"> 
								<option  value="<%=line %>" selected="selected"><%=line %></option>
								<option value="1">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="1">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option>
								<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="1">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
							</select>
						</td>
					</tr>
				</table>
				</div>
				
					<input type="hidden" name="no" value="<%=no%>">
					<button type="submit" class="btn btn-default btn-lg">更改</button>&nbsp;
					<button type="submit" class="btn btn-default btn-lg" formaction="delete.jsp">刪除</button>
				</form>
				
			</div><!-- end of main part -->
			<div align="right"><a href="index.html"><img src="img\Home2.png" width="150"/></a></div>
		</div>
		
 
		
		<%	
		}catch (FileNotFoundException e){
			out.println("<script language=\"javascript\">");
			out.println("alert(\"查無此編號，請重新輸入\");");
			out.println("history.go(-1);");
			out.println("</script>");
		}catch(SAXException se) {
			System.out.println("error");
		} catch(Exception ee){
			ee.printStackTrace();
		}
	%>
	</body>
</html>

