<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>

      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" />
        <!-- header.xsl -->
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->

        <br />

        <xsl:choose>
          <xsl:when test="notification_data/notification_type='OverdueNotificationType1'">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <h>@@inform_you_item_below@@ </h>
                  <h>@@borrowed_by_you@@ @@decalred_as_lost@@ <xsl:call-template name="ubb_recall_message"/></h>
                </td>
              </tr>
            </table>

            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" />
                <!-- style.xsl -->
              </xsl:attribute>

              <xsl:for-each select="notification_data">
                <table>
                  <tr>
                    <td>
                      <b>@@lost_item@@: </b>
                      <xsl:value-of select="item_loan/title"/>
                      <br />
                      <b>@@description@@: </b>
                      <xsl:value-of select="item_loan/description"/>
                      <br />
                      <b> @@by@@: </b>
                      <xsl:value-of select="item_loan/author"/>
                      <br />
                      <b>@@library@@: </b>
                      <xsl:value-of select="organization_unit/name"/>
                      <br />
                      <b>@@loan_date@@: </b>
                      <xsl:value-of select="item_loan/loan_date"/>
                      <br />
                      <b>@@due_date@@: </b>
                      <xsl:value-of select="item_loan/due_date"/>
                      <br />
                      <b>@@barcode@@: </b>
                      <xsl:value-of select="item_loan/barcode"/>
                      <br />
                      <b>@@call_number@@: </b>
                      <xsl:value-of select="phys_item_display/call_number"/>
                      <br />
                      <b>@@charged_with_fines_fees@@ </b>
                    </td>
                  </tr>
                </table>
              </xsl:for-each>
              <table cellpadding="5" class="listing">
                <xsl:attribute name="style">
                  <xsl:call-template name="mainTableStyleCss" />
                  <!-- style.xsl -->
                </xsl:attribute>
                <tr>
                  <th>@@fee_type@@</th>
                  <th>@@fee_amount@@</th>
                  <th>@@note@@</th>
                </tr>
                <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                  <tr>
                    <td>
                      <xsl:value-of select="fine_fee_type_display"/>
                    </td>
                    <td>
                      <xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
                    </td>
                    <td>
                      <xsl:value-of select="ff"/>
                    </td>
                  </tr>
                </xsl:for-each>

              </table>
              <br />
              <br />
        @@additional_info_1@@
              <br />
        @@additional_info_2@@
              <br />
           
            </table>
            <br />
          </xsl:when>
          <xsl:when test="notification_data/notification_type='OverdueNotificationType2'">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <h>@@inform_you_item_below_type2@@ </h>
                  <h> @@decalred_as_lost_type2@@ <xsl:call-template name="ubb_recall_message"/></h>
                </td>
              </tr>
            </table>

            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" />
                <!-- style.xsl -->
              </xsl:attribute>

              <xsl:for-each select="notification_data">
                <table>
                  <tr>
                    <td>
                      <b>@@lost_item@@: </b>
                      <xsl:value-of select="item_loan/title"/>
                      <br />
                      <b>@@description@@: </b>
                      <xsl:value-of select="item_loan/description"/>
                      <br />
                      <b> @@by@@: </b>
                      <xsl:value-of select="item_loan/author"/>
                      <br />
                      <b>@@library@@: </b>
                      <xsl:value-of select="organization_unit/name"/>
                      <br />
                      <b>@@loan_date@@: </b>
                      <xsl:value-of select="item_loan/loan_date"/>
                      <br />
                      <b>@@due_date@@: </b>
                      <xsl:value-of select="item_loan/due_date"/>
                      <br />
                      <b>@@barcode@@: </b>
                      <xsl:value-of select="item_loan/barcode"/>
                      <br />
                      <b>@@call_number@@: </b>
                      <xsl:value-of select="phys_item_display/call_number"/>
                    </td>
                  </tr>
                </table>
              </xsl:for-each>

              <br />
              <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                <xsl:if test="fine_fee_type = 'OVERDUENOTIFICATIONFINE'">
                  <b>@@charged_with_fines_fees@@ </b>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <xsl:call-template name="mainTableStyleCss" />
                      <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                      <th>@@fee_type@@</th>
                      <th>@@fee_amount@@</th>
                      <th>@@note@@</th>
                    </tr>
                    <tr>
                      <td>
                        <xsl:value-of select="fine_fee_type_display"/>
                      </td>
                      <td>
                        <xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
                      </td>
                      <td>
                        <xsl:value-of select="ff"/>
                      </td>
                    </tr>
                  </table>
                </xsl:if>
              </xsl:for-each> 
              <br />
        @@additional_info_1_type2@@
              <br />
        @@additional_info_2@@
              <br />

            </table>
            <br />
          </xsl:when>
        
          <xsl:when test="notification_data/notification_type='OverdueNotificationType3'">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <h>@@inform_you_item_below_type3@@ </h>
                  <h> @@decalred_as_lost_type3@@ <xsl:call-template name="ubb_recall_message"/></h>
                </td>
              </tr>
            </table>

            <table cellpadding="5" class="listing">
              <xsl:attribute name="style">
                <xsl:call-template name="mainTableStyleCss" />
                <!-- style.xsl -->
              </xsl:attribute>

              <xsl:for-each select="notification_data">
                <table>
                  <tr>
                    <td>
                      <b>@@lost_item@@: </b>
                      <xsl:value-of select="item_loan/title"/>
                      <br />
                      <b>@@description@@: </b>
                      <xsl:value-of select="item_loan/description"/>
                      <br />
                      <b> @@by@@: </b>
                      <xsl:value-of select="item_loan/author"/>
                      <br />
                      <b>@@library@@: </b>
                      <xsl:value-of select="organization_unit/name"/>
                      <br />
                      <b>@@loan_date@@: </b>
                      <xsl:value-of select="item_loan/loan_date"/>
                      <br />
                      <b>@@due_date@@: </b>
                      <xsl:value-of select="item_loan/due_date"/>
                      <br />
                      <b>@@barcode@@: </b>
                      <xsl:value-of select="item_loan/barcode"/>
                      <br />
                      <b>@@call_number@@: </b>
                      <xsl:value-of select="phys_item_display/call_number"/>
                    </td>
                  </tr>
                </table>
              </xsl:for-each>

              <br />
              <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                <xsl:if test="fine_fee_type = 'OVERDUENOTIFICATIONFINE'">
                  <b>@@charged_with_fines_fees@@ </b>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <xsl:call-template name="mainTableStyleCss" />
                      <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                      <th>@@fee_type@@</th>
                      <th>@@fee_amount@@</th>
                      <th>@@note@@</th>
                    </tr>
                    <tr>
                      <td>
                        <xsl:value-of select="fine_fee_type_display"/>
                      </td>
                      <td>
                        <xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
                      </td>
                      <td>
                        <xsl:value-of select="ff"/>
                      </td>
                    </tr>
                  </table>
                </xsl:if>
              </xsl:for-each> 
              <br />
        @@additional_info_1_type3@@
              <br />
        @@additional_info_2@@
              <br />

            </table>
            <br />
          </xsl:when>
          
        </xsl:choose> 
        <xsl:call-template name="email-footer" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>

  <xsl:template name="ubb_recall_message">
  <xsl:choose>
   <xsl:when test="notification_data/item_loan/process_status = 'RECALL'">
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'no'"><b>Annen låner venter, vennligst levér snarest.</b></xsl:if>
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'nn'"><b>Annan lånar ventar, ver venleg å levere snarast.</b></xsl:if>
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'en'"><b>There is a waiting list, please return the item as soon as possible.</b></xsl:if>
    </xsl:when>
    <xsl:otherwise>
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'no'"><b>Maksimal lånetid er nådd.</b></xsl:if>
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'nn'"><b>Maksimal lånetid er nådd.</b></xsl:if>
    <xsl:if test="notification_data/receivers/receiver/preferred_language = 'en'"><b>Maximum loan period has been reached.</b></xsl:if>
    </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>