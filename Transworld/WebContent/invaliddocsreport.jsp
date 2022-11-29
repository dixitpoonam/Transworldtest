<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="header.jsp" %>
<html>

<head>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<style>

SPAN.searchword {
	background-color: cyan;
}

SPAN.super {
	text-decoration: blink;
	text-align: center;
}

.popup {
	background-color: #98AFC7;
	position: absolute;
	visibility: hidden; . popupnew { background-color : #98AFC7;
	position: absolute;
	visibility: visible; . popupx { background-color : #98AFC7;
	position: absolute;
	visibility: hidden;
}

BODY {
	bgcolor="#FFE4E1";
}

</style>
	<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
	<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	<script type="text/javascript" src="js/ajax-dynamic-content.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/ajax-tooltip.js"></script>	
	<script src="js/sorttable.js" type="text/javascript"></script>


<script language="JavaScript" type="text/javascript">

function settovalid(filename,id)

{
	//alert(filename);
	//alert(id);

	var filename=filename;
	//alert(filename);
	var id=id;
	//alert(id);
var ajaxRequest;  // The variable that makes Ajax possible!
	try
	{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
			alert("File Status Updated.");
			reload();
		} 
	}
	var queryString = "?fname="+filename+"&id="+id;
	try
	{
		ajaxRequest.open("GET", "ValidandDuplicateDocs.jsp" + queryString, true);
		ajaxRequest.send(null);
	} 
	catch (e) 
	{
		alert(e);
	}



	
}

function reload()
{

	window.location.reload();
}
</script>

</head>

<body>
<title>Transworld Inward Report</title>
<div class="wrapper">
<div class="header">

<div class="righttop">
<ul>
		<%
	//	Connection conn=null;
		String status=request.getParameter("validity");
		System.out.println("status  i8s  "+status);
		
		try
		{
			
		Statement stmt=null,st1=null;
		String sql=null;
		ResultSet rst=null;
		stmt=conn.createStatement();
		st1=conn.createStatement();
		//	Class.forName("org.gjt.mm.mysql.Driver");
		//	conn=DriverManager.getConnection("jdbc:mysql://localhost/db_leaveapplication","fleetview","1@flv");
		//	conn=DriverManager.getConnection("jdbc:mysql://localhost/db_leaveapplication","fleetview","1@flv");
		}
		catch(Exception e)
		{
			System.out.println("Exception=========>>"+e);
		}
		
		
		String datenew1="";
		String datenew2="";
		
			datenew1=datenew2=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
		String empname1=session.getAttribute("email").toString();
		
	//	Connection conn=null; 
		Statement stmt=null,st=null;
		String sql=null;
		ResultSet rst=null,rs=null;
		String msg="";//,role="";
	
		stmt=conn.createStatement();
		st=conn.createStatement();
		
		String user="",pass="";
		//	String sqlUP="select * from t_InwardLogin where username='"+empname+"'";
		String sqlUP="select * from t_leaveadmin where UName='"+empname1+"'";
			rs=stmt.executeQuery(sqlUP);
			if(rs.next())
			{
				user=rs.getString("UName");
				pass=rs.getString("pass");
			}
			
			
			DateFormat df123= new SimpleDateFormat("dd-MMM-yyyy");
			DateFormat df1234= new SimpleDateFormat("yyyy-MM-dd");
			String dataDate1="";
			String dataDate2="";
			String fname="";
			int srno=0;
			int sn=1;
			int i=0;
			DateFormat d1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			DateFormat d2=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
			
			
			
		%>
		

</ul>
</div>


</div>
</div>


<script language="JavaScript" type="text/javascript">


</script>
<%
%>


<% 
		//out.println("---------"+datenew1+"------------"+datenew2+"---------");
		
	//	String empname="s_joshi@transworld-compressor.com";
		%>
		<%	if(request.getParameter("validity").equals("invalid")){ %>
		
		<table align="center">
		<tr>
		
		<td align="center"><b><font size="4" color="#151B54">Invalid Document Report</font></b></td>
		</tr>
		</table>
		<%}else if(request.getParameter("validity").equals("duplicate")) {%>
			<table align="center">
		<tr>
		
		<td align="center"><b><font size="4" color="#151B54">Duplicate Document Report</font></b></td>
		</tr>
		</table>
		<%} %>
		
	
		
		<br></br>
		<br></br>
		<form name="" method="post" action="" Onsubmit="return validate()">
		<table class="sortable">
		<tr>
	
		<td style="width: 5px; background-color: #C6DEFF; " align="center"><font size="2" color="black"><b>Sr.</b></font></td>
		<td style="width: 5px; background-color: #C6DEFF; " align="center"><font size="2" color="black"><b>File Name</b></font></td>
		<td style="width: 5px; background-color: #C6DEFF; " align="center"><font size="2" color="black"><b>Upload Date</b></font></td>
		<td style="width: 5px; background-color: #C6DEFF; " align="center"><font size="2" color="black"><b>Uploaded By</b></font></td>
		<td style="width: 5px; background-color: #C6DEFF; " align="center"><font size="2" color="black"><b>Mark As</b></font></td>

		</tr>
		
		<%
int trcnt=0;

try
{

	
	String sqlData="";

		System.out.println(">>>>>>>>>>>>"+request.getQueryString().toString());
		if(request.getParameter("validity").equals("invalid"))
		{System.out.println("IN IFV  ");
		sqlData="select * from t_uploadedFiles where FileStatus='Invalid' ";
		}
		else if(request.getParameter("validity").equals("duplicate"))
		{
			
			System.out.println("IN ELSE OIF   ");
			sqlData="select * from t_uploadedFiles where FileStatus='Duplicate' ";}
		

		
	ResultSet rs1=st.executeQuery(sqlData);
	System.out.println(sqlData);
	while(rs1.next())
	{
		
		fname=rs1.getString("FileName");
		srno=rs1.getInt("SrNo");
		%>
		<tr>
		<td align="right"><div align="right"><font size="2" color="black"><%=sn++%></font></div></td>
		<td align="left"><div align="left"><font size="2" color="black"><%=rs1.getString("FileName")%></font></a></div></td>

		
		<td align="right" sorttable_customkey="20080211131900"><div align="right"><font size="2" color="black"><%=d2.format(d1.parse(rs1.getString("UpdatedDateTime")))%></font></div></td>
		<td align="left"><div align="left"><font size="2" color="black"><%=rs1.getString("UploadedBy").toString()%></font></div></td>
		<%
		if(request.getParameter("validity").equals("invalid")){
		%>
		
		<td align="left"><a href="#" onclick="settovalid('<%=fname %>','3')"><font color="blue;">Valid</font></a></td>
		<%}else if(request.getParameter("validity").equals("duplicate")){  %>
		<td align="left"><a href="#" onclick="settovalid('<%=fname %>','4')"><font color="blue;">Valid</font></a></td>
		
		<%} %>
		
		</tr>
		<%
		i++;
	}
	%>

	<input type="hidden" name="chbxCnt" id="chbxCnt" value="<%=i %>" />
<input type="hidden" name="filename" id="filename" value="<%=fname%>" />
	<%
}
catch(Exception e)
{
	System.out.println("Thumbnail Exception======>>"+e);	
}

%>
		
		
		
		</table>
		</form>	