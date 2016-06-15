<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
 <html>
  <head>
  <xsl:call-template name="generalStyle" />
  </head>
   <body>

<xsl:if test="/notification_data/request/resource_sharing_request_id != ''">
                 <xsl:message terminate="yes">Resource Sharing Request - No automatic cancellation letter sent</xsl:message>
</xsl:if>
   <xsl:attribute name="style">
    <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
   </xsl:attribute>
    <xsl:call-template name="head" /> <!-- header.xsl -->
    <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
    <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

  <div class="messageArea">
    <div class="messageBody">
      <table cellspacing="0" cellpadding="5" border="0">
      <tr>
       <td>@@we_cancel_y_req_of@@ <xsl:value-of select="notification_data/request/create_date"/>:</td></tr>
      <tr>
       <td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
      </tr>
      <xsl:if test="notification_data/request/note != ''">
       <tr>
        <td><b> @@request_note@@: </b> <xsl:value-of select="notification_data/request/note"/></td>
       </tr>
      </xsl:if>
      <tr>
       <td><b> @@reason_deleting_request@@: </b> <xsl:value-of select="notification_data/request/status_note_display"/></td>
      </tr>
      <xsl:if test="notification_data/request/system_notes != ''">
       <tr>
        <td><b> @@request_cancellation_note@@: </b> <xsl:value-of select="notification_data/request/system_notes"/></td>
       </tr>

      </xsl:if>
<br />
<br />
<xsl:text>Ta kontakt med ditt bibliotek hvis du har spørsmål til dette. Du finner kontaktinformasjon via lenken nederst.</xsl:text>
<br />
<xsl:text>If you have any questions, please contact your library. Contact information can be found via the link below.</xsl:text>
     </table>
     <br />
    <table>

      <tr><td>@@sincerely@@</td></tr>
      <tr><td>@@department@@</td></tr>

    </table>
    </div>
   </div>
    <!-- footer.xsl -->
   <xsl:call-template name="contactUs" />
  </body>
 </html>
 </xsl:template>
</xsl:stylesheet>