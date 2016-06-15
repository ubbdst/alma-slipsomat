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
   <xsl:attribute name="style">
    <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
   </xsl:attribute>

    <xsl:call-template name="head" /> <!-- header.xsl -->
    <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

  <br />

     <div class="messageArea">
    <div class="messageBody">
     <table cellspacing="0" cellpadding="5" border="0">
      <tr>
       <td>
<p>
       @@following_item_requested_on@@
       <xsl:value-of select="notification_data/request/create_date"/>,
       @@can_picked_at@@
<b>
       <xsl:choose>
        <xsl:when test="notification_data/outgoing/pickup_location_str != ''">
         <xsl:value-of select="notification_data/outgoing/pickup_location_str"/>
        </xsl:when>
        <xsl:when test="notification_data/request/assigned_unit_name != ''">
         <xsl:value-of select="notification_data/request/assigned_unit_name"/>
        </xsl:when>
        <xsl:otherwise>
         <em>(Unknown pickup location. This bug is tracked)</em>
        </xsl:otherwise>
       </xsl:choose></b>.
      </p>
 </td>
      </tr>

      <xsl:if test="notification_data/request/work_flow_entity/expiration_date">
      <tr>
       <td>
        @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
        </td>
      </tr>
       </xsl:if>
      <tr>
       <td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
      </tr>
      <xsl:if test="notification_data/request/system_notes">
      <tr>
       <td>@@notes_affect_loan@@:</td>
      </tr>

      <tr>
       <td><xsl:value-of select="notification_data/request/system_notes"/></td>
      </tr>

      </xsl:if>

     </table>
    </div>
   </div>
    <br />
    <table>

      <tr><td>@@sincerely@@</td></tr>
      <tr><td>@@department@@</td></tr>

    </table>




    <xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
   </body>
 </html>
 </xsl:template>



</xsl:stylesheet>