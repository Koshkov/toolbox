<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="3.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:j="http://www.w3.org/2005/xpath-functions" >
	<xsl:template name="head"> 
		<head>
			<meta charset="utf-8"/>
			<meta name="author" content="Mat L."/>
			<meta name="keywords" content="Digital Tools"/>
			<meta name="robots" content="index,follow"/>
			<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
			<meta http-equiv="Content-Secuirty-Policy" content="default-src 'self';"/>
			<meta name="description" content=""/>
			<meta property="og:type" content="website"/>
			<meta property="og:title" content=""/>
			<meta property="og:description" content=""/>
			<link type="text/css"  rel="stylesheet" href="/style.css"/>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
			<title>ToolBox</title>
		</head>
	</xsl:template> 

	<xsl:template name="categories"> 
		<option value="">Select</option>
		<option value="Citation Management">Citation Management</option>
		<option value="Searching">Searching</option>
		<option value="Digital Libraries">Digital Libraries</option>
		<option value="Time Management">Time Management</option>
		<option value="Note Taking">Note Taking</option>
	</xsl:template> 

	<xsl:template name="form"> 
		<h2>Suggestions.</h2>
		<form action="submit.pl" method="POST">
			<input type="text" id="title" name="title" placeholder="Title"/><br/>
			<input type="text" id="description" name="description" placeholder="Description"/><br/>
			<input type="text" id="uri" name="uri" placeholder="URL"/><br/>
			<select class="cat" id="categories" name="category">
				<xsl:call-template name="categories"/>
			</select>
			<input type="submit"/>
		</form>  
	</xsl:template>

	<xsl:template match="/" name="header"> 
		<header>
			<h1><i style='font-size:24px' class='fas'>&#xf552;&#160;</i>ToolBox.</h1>
			<select id="categories" onchange="filter('software','categories')">
				<xsl:call-template name="categories"/>
			</select>
		</header>
	</xsl:template> 

	<xsl:template match="/" name="main"> 
		<main class="toolbox">
			<xsl:for-each select="box/tool">
				<table>
					<xsl:attribute name="software">
						<xsl:value-of select="category"/>
					</xsl:attribute>
					<tr>
						<td colspan="2">
							<h2>
								<i style='font-size:24px' class='fas'>&#xf7d9;&#160;</i>
								<xsl:value-of select="title" />
							</h2>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<b>Date Added: </b><xsl:value-of select="date" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<b>URL:</b><a target="_blank" href="{uri}"> <xsl:value-of select="uri"/></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<b>Description: </b><xsl:value-of select="description" /> 
						</td>
					</tr>
					</table>
			</xsl:for-each>
		</main>
	</xsl:template> 

	<xsl:template name="footer"> 
		<footer>
			<hr/>
			<section id="bottom-bar">
				<section>
					<xsl:call-template name="form"/>
				</section>
				<section>
					<h2>About.</h2>
					<p>
						A simple repo of useful and overlooked software. Suggestions
						should:
					</p> 
					<ul>
						<li>Promote open access to information.</li>
						<li>Be free to use or have a free option.</li>
						<li>Be unique and not widely unknown about.</li>
					</ul>
					<i>Copyleft 2024</i>
				</section>
			</section>
			<script src="js/assets.js"></script>
		</footer>
	</xsl:template> 

	<!--Build Page-->
	<xsl:template match="/" name="buildpage"> 
		<html>
			<xsl:call-template name="head"/>
			<body>
				<xsl:call-template name="header"/>
				<xsl:call-template name="main"/>
				<xsl:call-template name="footer"/>
			</body>
		</html>
	</xsl:template> 
</xsl:transform>
			
