<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="salutation">

</xsl:template>

<!-- @OLG Limt inn oslo sin templat for footer for testing-->
<xsl:template name="email-footer">
  <xsl:param name="email" />
  <xsl:param name="sender_name" />

  <div style="border-top: 1px solid #ccc; margin-top: 1.2em; font-size: 90%; color: #777;">

    <xsl:for-each select="/notification_data/organization_unit">
      <p>
        <xsl:choose>
          <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'no'">
           Har du spørsmål eller trenger hjelp?
          </xsl:when>
          <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nn'">
           Har du spørsmål eller treng hjelp?
          </xsl:when>
          <xsl:otherwise>
           Questions?
          </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>

          <!-- Bruk epost-adresse fra parameter hvis gitt -->
          <xsl:when test="$email != ''">
            <xsl:choose>
              <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'no'">
               Kontakt oss på
              </xsl:when>
              <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nn'">
               Kontakt oss på
              </xsl:when>
              <xsl:otherwise>
               Please contact us at
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$email"/>
          </xsl:when>

          <!-- Bruk epost-adresse til notification_data/organization_unit hvis tilgjengelig -->
          <xsl:when test="email/email != ''">
            <xsl:choose>
              <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'no'">
               Kontakt oss på
              </xsl:when>
              <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nn'">
               Kontakt oss på
              </xsl:when>
              <xsl:otherwise>
               Please contact us at
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="email/email"/>
          </xsl:when>

          <!-- Alternativt: Bruk standard-URL -->
          <xsl:otherwise>
            <a>
              <xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
              @@contact_us@@</a>.
          </xsl:otherwise>
        </xsl:choose>
      </p>

      <p>
        <xsl:choose>
         <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'no'">
          Vennlig hilsen<br />
         </xsl:when>
         <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nn'">
          Venleg helsing<br />
         </xsl:when>
         <xsl:otherwise>
          Kind regards,<br />
         </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>
          <xsl:when test="$sender_name != ''">
            <xsl:value-of select="$sender_name"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="name"/>
          </xsl:otherwise>
        </xsl:choose>
      </p>

    </xsl:for-each>
  </div>
</xsl:template>


<xsl:template name="lastFooter">
 <table>
 <xsl:attribute name="style">
  <xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
 </xsl:attribute>
 <tr>
 <xsl:for-each select="notification_data/organization_unit">

  <xsl:attribute name="style">
   <xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
  </xsl:attribute>
  <tr><td><xsl:value-of select="name"/>&#160;
</td></tr>
  <tr><td>Send svar til / Reply to: <xsl:value-of select="email/email"/></td></tr>
 </xsl:for-each>
 </tr>
 </table>
</xsl:template>

<xsl:template name="contactUs">
  <!-- -->
</xsl:template>


<xsl:template name="myAccount">
  <p id="myAccount" style="font-size: 90%;">
    <a>
      <xsl:attribute name="href">@@email_my_account@@</xsl:attribute>
      @@my_account@@
    </a>
  </p>
</xsl:template>



</xsl:stylesheet>