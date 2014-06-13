<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  IDENTITY
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!-- Maintain short tags on leaf nodes -->
<xsl:template match="*[count(node())=0]">
  <xsl:copy-of select="."/>
</xsl:template>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  OVERRIDES
  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<!-- Replace main table with DIV -->
<xsl:template match="/table">
	<div class="login_form" id="{/table/@id}">
		<xsl:apply-templates select="./*" />
	</div>
</xsl:template>

<!-- Put nice heading in -->
<xsl:template match="/table/tr[1]/td[1]/table/tr[1]/td[1]">
	<h2 class="lf_header"><xsl:value-of select="."/></h2>
</xsl:template>

<!-- Main control rows -->
<xsl:template match="/table/tr/td/table/tr[position() &gt; 1 and position() &lt; count(/table/tr/td/table/tr)]">
	<div class="lf_control_item">
		<xsl:apply-templates select="./*" />
	</div>
</xsl:template>

<!-- Error rows - the html generated by ASP.NET doesn't really contain anything useful to look for, so we check for the color being Red. Yuck.-->
<xsl:template match="/table/tr/td/table/tr[contains(td/@style, 'color:Red')]">
	<div class="lf_control_item lf_error_item">
		<xsl:apply-templates select="./*" />
	</div>
</xsl:template>

<!-- Final control row - submit button -->
<xsl:template match="/table/tr/td/table/tr[position() = count(/table/tr/td/table/tr)]">
	<div class="lf_control_item lf_submit_item">
		<xsl:apply-templates select="./*" />
	</div>
</xsl:template>

<!-- Blank everything else table related -->
<xsl:template match="tr">
	<xsl:apply-templates select="./*" />
</xsl:template>

<xsl:template match="td">
	<xsl:apply-templates select="./*|text()" />
</xsl:template>

<xsl:template match="table">
	<xsl:apply-templates select="./*" />
</xsl:template>

</xsl:stylesheet>
