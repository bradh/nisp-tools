<?xml version="1.0" encoding="ISO-8859-1"?>

<!--

This stylesheet is created for the NISP, and is intended for
postprocessing the resolver output.

Copyright (c) 2009, Jens Stavnstrup/DALO <stavnstrup@mil.dk>
Danish Defence Acquisition and Logistic Organisation (DALO),
Danish Defence Research Establishment (DDRE) and 
NATO Command, Control and Consultation Organisation (NC3O).

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.1'
                exclude-result-prefixes="#default">


<xsl:output method="xml" version="1.0" encoding="ISO-8859-1"
            doctype-public="-//OASIS//DTD DocBook XML V4.5//EN"
            doctype-system="../src/schema/dtd/docbkx45/docbookx.dtd"/>


<!-- ==================================================================== -->

<!-- FOP 0.92+ requires that tables in fo files to have at least one row.
     For consistency, we enforce that whether the target is XHTML or FO. -->


<xsl:template match="tbody">
  <tbody>
    <xsl:apply-templates select="@*"/>
    <xsl:if test="count(row)=0">
      <row>
        <xsl:for-each select="../colspec"><entry/></xsl:for-each>
      </row>
    </xsl:if>    
    <xsl:apply-templates/>
  </tbody>
</xsl:template>  

<!-- ==================================================================== -->


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


</xsl:stylesheet>
