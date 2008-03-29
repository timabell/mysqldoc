<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 

  This XSL document shows all INDEX, TRIGGER, and UDF information for a given database.

  Author: Ryan Lowe (ryan.a.lowe@gmail.com)
  Date:   29 March 2008
 
-->

<xsl:template match="/">

  <xsl:text disable-output-escaping="yes">

&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;

&lt;html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"&gt;

&lt;head&gt;

  &lt;meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /&gt;

  &lt;title&gt;DATA DICTIONARY FOR: </xsl:text>

  <xsl:for-each select="databases/database">

    <xsl:value-of select="@name" /><xsl:text> </xsl:text>

  </xsl:for-each>

  <xsl:text disable-output-escaping="yes">

  &lt;/title&gt;

  &lt;style type="text/css"&gt;
    body {font-family:Arial;}
    h1 {text-align:center;}
    table {margin-bottom:1em;}
    tr td {border-bottom:1px solid #ccc;
           border-right:1px solid #ccc;
           padding:3px 8px;
           border-collapse: collapse;}
    tr:hover {background-color:#FFFFCC;}
    th {text-align:left;padding:3px 8px;}
   &lt;/style&gt;
&lt;/head&gt;

&lt;body&gt;

  &lt;h1&gt;&lt;strong&gt;DATA DICTIONARY FOR: </xsl:text>

  <xsl:value-of select="databases/database/@name" />

  <xsl:text disable-output-escaping="yes">

&lt;/strong&gt;&lt;/h1&gt;

  </xsl:text>

  <xsl:for-each select="databases/database/table">

    <xsl:text disable-output-escaping="yes">

      &lt;dl&gt;
      &lt;dt&gt;

    </xsl:text>

    <xsl:if test="@type != 'VIEW'">

      <xsl:text>Table Name </xsl:text>
 
    </xsl:if>

    <xsl:if test="@type='VIEW'">

      <xsl:text>View Name </xsl:text>

    </xsl:if>

    <xsl:text disable-output-escaping="yes">

      &lt;/dt&gt;
      &lt;dd&gt;

    </xsl:text>

    <xsl:value-of select="@name" /><xsl:text> - (</xsl:text>

    <xsl:value-of select="@type" /><xsl:text> </xsl:text>

    <xsl:if test="@type != 'VIEW'">

      <xsl:value-of select="@engine" /><xsl:text disable-output-escaping="yes">)&lt;/dd&gt;

        &lt;dt&gt;Table Stats&lt;/dt&gt;
        &lt;dd&gt;

      </xsl:text>

      <xsl:value-of select="@total_size" /><xsl:text> (DATA: </xsl:text>
      <xsl:value-of select="@data_size" /><xsl:text>, INDEX: </xsl:text>
      <xsl:value-of select="@index_size" /><xsl:text disable-output-escaping="yes">)
 
        &lt;/dd&gt;
        &lt;dt&gt;Table Contents&lt;/dt&gt;

      </xsl:text>

      <xsl:value-of select="@comment" /><xsl:text disable-output-escaping="yes">&lt;/dd&gt;</xsl:text>
 
    </xsl:if>

    <xsl:if test="@type = 'VIEW'">

      <xsl:text disable-output-escaping="yes">)&lt;/dd&gt;</xsl:text>

    </xsl:if>


    <!-- COLUMNS -->
    <xsl:text disable-output-escaping="yes">

      &lt;/dl&gt;
      &lt;table border="0" cellpadding="0" cellspacing="0"&gt;

      &lt;tr&gt;
      &lt;th&gt;Column Name&lt;/th&gt;
      &lt;th&gt;Data Type&lt;/th&gt;
      &lt;th&gt;Default Value&lt;/th&gt;
      &lt;th&gt;Description&lt;/th&gt;
      &lt;/tr&gt;

    </xsl:text>

    <xsl:for-each select="column">

      <xsl:text disable-output-escaping="yes">

        &lt;tr&gt;
        &lt;td&gt;

      </xsl:text>

      <xsl:value-of select="@name" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;td&gt;</xsl:text>
      <xsl:value-of select="@data_type" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;td&gt;</xsl:text>
      <xsl:value-of select="@defalut_value" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;td&gt;</xsl:text>
      <xsl:value-of select="@comment" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;/tr&gt;</xsl:text> 

    </xsl:for-each>

    <xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>

    <!-- INDEXES -->
    <xsl:text disable-output-escaping="yes">

      &lt;table border="0" cellpadding="0" cellspacing="0"&gt;

      &lt;tr&gt;
      &lt;th&gt;Index Name&lt;/th&gt;
      &lt;th&gt;Index Type&lt;/th&gt;
      &lt;th&gt;Affected Column(s)&lt;/th&gt;
      &lt;/tr&gt;

    </xsl:text>

    <xsl:for-each select="index">

      <xsl:text disable-output-escaping="yes">

        &lt;tr&gt;
        &lt;td&gt;

      </xsl:text> 

      <xsl:value-of select="@name" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;td&gt;</xsl:text>
      <xsl:value-of select="@index_type" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;td&gt;</xsl:text>
      <xsl:value-of select="@columns" /><xsl:text disable-output-escaping="yes">&lt;/td&gt;&lt;/tr&gt;</xsl:text>

    </xsl:for-each>

    <xsl:text disable-output-escaping="yes">&lt;/table&gt;</xsl:text>

    <!-- TRIGGERS -->
    <xsl:text disable-output-escaping="yes">

      &lt;table border="0" cellpadding="0" cellspacing="0"&gt;

      &lt;tr&gt;
      &lt;th&gt;Trigger name&lt;/th&gt;
      &lt;th&gt;Action Timing&lt;/th&gt;
      &lt;th&gt;Event Manipulation&lt/th&gt;
      &lt;/tr&gt;

    </xsl:text>

    <xsl:for-each select="trigger">
    
    <!-- UDFs -->

  </xsl:for-each>

  <!-- Build Footers -->
  <xsl:text disable-output-escaping="yes">

    &lt;p&gt;Generated By: &lt;a href="http://code.google.com/p/mysqldoc"&gt;mysqldoc&lt;a&gt; 

  </xsl:text>

  <xsl:value-of select="databases/@mysqldoc_version" />

  <xsl:text disable-output-escaping="yes">

    &lt;/p&gt;
    &lt;/body&gt;
    &lt;/html&gt;

  </xsl:text> 

</xsl:template>

</xsl:stylesheet>

