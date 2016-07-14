<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
    Template for converting date from MM/DD/YYYY to YYYY-MM-DD and remove time.
    Added by: DMOH 2016-01-20
    Parameters:
      value:     The date on format MM/DD/YYYY
-->
<xsl:template name="isoDate">
  <xsl:param name="value"/>
  <xsl:value-of select="concat(
    substring($value, 7, 4),
    '-',
    substring($value, 4, 2),
    '-',
    substring($value, 1, 2)
  )"/>
</xsl:template>


<!--
    Template for converting date from MM/DD/YYYY to d. m YYYY (and remove time).
    Added by: DMOH 2016-06-28
    Parameters:
      value:     The date on format MM/DD/YYYY
-->
<xsl:template name="stdDate">
  <xsl:param name="value"/>
  <xsl:value-of select="number(substring($value, 1, 2))"/>
  <xsl:choose>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'en'">
      <xsl:text> </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>. </xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:call-template name="monthName">
    <xsl:with-param name="value" select="substring($value, 4, 2)" />
  </xsl:call-template>
  <xsl:text> </xsl:text>
  <xsl:value-of select="substring($value, 7, 4)"/>
</xsl:template>

<xsl:template name="monthName">
  <xsl:param name="value"/>
  <xsl:choose>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'en'">
      <xsl:choose>
        <xsl:when test="$value = '01'">January</xsl:when>
        <xsl:when test="$value = '02'">February</xsl:when>
        <xsl:when test="$value = '03'">March</xsl:when>
        <xsl:when test="$value = '04'">April</xsl:when>
        <xsl:when test="$value = '05'">May</xsl:when>
        <xsl:when test="$value = '06'">June</xsl:when>
        <xsl:when test="$value = '07'">July</xsl:when>
        <xsl:when test="$value = '08'">August</xsl:when>
        <xsl:when test="$value = '09'">September</xsl:when>
        <xsl:when test="$value = '10'">October</xsl:when>
        <xsl:when test="$value = '11'">November</xsl:when>
        <xsl:when test="$value = '12'">December</xsl:when>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$value = '01'">januar</xsl:when>
        <xsl:when test="$value = '02'">februar</xsl:when>
        <xsl:when test="$value = '03'">mars</xsl:when>
        <xsl:when test="$value = '04'">april</xsl:when>
        <xsl:when test="$value = '05'">mai</xsl:when>
        <xsl:when test="$value = '06'">juni</xsl:when>
        <xsl:when test="$value = '07'">juli</xsl:when>
        <xsl:when test="$value = '08'">august</xsl:when>
        <xsl:when test="$value = '09'">september</xsl:when>
        <xsl:when test="$value = '10'">oktober</xsl:when>
        <xsl:when test="$value = '11'">november</xsl:when>
        <xsl:when test="$value = '12'">desember</xsl:when>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0">
 <tr>
  <td>
   <xsl:for-each select="notification_data">
    <h3>@@dear@@</h3>
   </xsl:for-each>
  </td>
 </tr>
</table>


</xsl:template>

</xsl:stylesheet>