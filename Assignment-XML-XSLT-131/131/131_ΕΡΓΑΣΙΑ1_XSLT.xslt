<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
	<html>
		<head>
		<title>ADMINCONTROL</title>
		<style>
         #p1{
            padding:5px;
            border:1px solid black;
            font-size:18px;
          }
         #p2{
            display:inline;
          }
         .font {
			background-color:LightBlue;
         }
         .employee-font{
            color:DarkSlateGray;
         }
     </style>
		</head>
		<body style="background-color:#DEF5E5">
			<xsl:apply-templates select="COMPANY"/>
		</body>
	</html>
	</xsl:template>
	<xsl:template match="COMPANY">
		<xsl:apply-templates select="DEPARTMENT"/>
		<xsl:apply-templates select="EQUIPMENT"/>
	</xsl:template>
	<xsl:template match="DEPARTMENT">
		<div style="background-color:#8EC3B0">
			<p id="p1" style="color:White" align="center"><b><xsl:value-of select="D_NAME"/></b></p>
		</div>
		<xsl:apply-templates select="PROJECT"/>
	</xsl:template>
	<xsl:template match="PROJECT">
		<div style="background-color:#BCEAD5">
			<hr></hr>
			<p style="color:White" align="center"><b>Name of the project: <xsl:value-of select="@NAME"/></b></p>
			<p style="color:White" align="center">Number of employees: <xsl:value-of select="@EMPLOYEES_NO"/></p>
			<hr></hr>
		</div>
		<xsl:apply-templates select="TEAM"/>
		<xsl:apply-templates select="EMPLOYEE"/>
	</xsl:template>
	<xsl:template match="TEAM">
		<div class="font" align="center">TEAMS</div>
		<br></br>
		<p id="p2" style="color:rgb(100,149,237);"><xsl:value-of select="FULLSTACK/NAME_FS"/> | </p>
		<p id="p2" style="color:rgb(100,149,237);"><xsl:value-of select="FRONTEND/NAME_FE"/> | </p>
		<p id="p2" style="color:rgb(100,149,237);"><xsl:value-of select="BACKEND/NAME_BE"/></p>
		<p></p>
	</xsl:template>
	<xsl:template match="EMPLOYEE">
		<div class="font" align="center">EMPLOYEES</div>
		<p class="employee-font">Developers:</p>
		<p style="color:rgb(100,149,237);"><xsl:value-of select="DEVELOPER"/></p>
		<p style="color:rgb(100,149,237);">salary: <xsl:value-of select="DEVELOPER/@SALARY"/></p>
		<hr></hr>
		<p class="employee-font">QA:</p>
		<p style="color:rgb(100,149,237);"><xsl:value-of select="QA"/></p>
		<p style="color:rgb(100,149,237);">salary: <xsl:value-of select="QA/@SALARY"/></p>
		<hr></hr>
		<p class="employee-font">Team Leaders:</p>
		<p style="color:rgb(100,149,237);"><xsl:value-of select="TEAM_LEADER"/></p>
		<p style="color:rgb(100,149,237);">salary: <xsl:value-of select="TEAM_LEADER/@SALARY"/></p>
		<xsl:apply-templates select="EMPLOYEE"/>
	</xsl:template>
	<xsl:template match="EQUIPMENT">
		<div class="font" align="center">EQUIPMENT</div>
		<p class="employee-font">Laptops in project:</p>
		<p style="color:rgb(100,149,237);"><xsl:value-of select="LAPTOP/NAME_LAPTOP"/></p>
		<p style="color:rgb(100,149,237);">cpu: <xsl:value-of select="LAPTOP/@CPU"/></p>
		<hr></hr>
		<p class="employee-font">Printers in project:</p>
		<p style="color:rgb(100,149,237);"><xsl:value-of select="PRINTER/NAME_PRINTER"/></p>
		<p style="color:rgb(100,149,237);">model: <xsl:value-of select="PRINTER/@MODEL"/></p>
	</xsl:template>
</xsl:stylesheet>

