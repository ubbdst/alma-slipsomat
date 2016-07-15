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
   <h2>
    <b>@@requested_for@@ :
       <xsl:value-of select="notification_data/user_for_printing/identifiers/code_value[1]/value"/>
       : &#160;
       <xsl:value-of select="notification_data/user_for_printing/name"/>
                                                        : &#160;
       <xsl:value-of select="notification_data/user_for_printing/user_group"/>
    </b>   
   </h2>

   <div class="messageArea">
    <div class="messageBody">
      <table cellspacing="0" cellpadding="5" border="0">

        <!-- Hvis et spesifikt eksemplar er bestilt, gir vi beskjed om det. -->
          <xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
            <tr>
              <td></td>
              <td><b>@@note_item_specified_request@@.</b></td>
            </tr>
          </xsl:if>

          <!-- Strekkoden *mottaker* kan scanne øverst. -->
          <tr>
            <td valign="top" colspan="2" align="center">
              <font size="2">@@request_id@@:</font><br/>
              <img src="cid:request_id_barcode.png" alt="Request Barcode"/>
            </td>
          </tr>
                                             <!-- Horizontal line -->
        <tr><td colspan="2"><hr/></td></tr>

        <!-- Del 3: Grunnleggende metadata: tittel, forfatter, osv. Dette viser vi alltid! -->
        <tr>
          <td valign="top">Title:</td>
          <td>
            <xsl:value-of select="notification_data/phys_item_display/title_abcnph"/>
          </td>
        </tr>
        <tr>
          <td valign="top">By:</td>
          <td>
            <xsl:value-of select="notification_data/phys_item_display/author"/>
          </td>
        </tr>
        <xsl:if test="notification_data/phys_item_display/isbn != ''">
          <tr>
            <td valign="top">@@isbn@@:</td>
            <td>
              <xsl:value-of select="notification_data/phys_item_display/isbn"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="notification_data/phys_item_display/issn != ''">
          <tr>
            <td valign="top">@@issn@@:</td>
            <td>
              <xsl:value-of select="notification_data/phys_item_display/issn"/>
            </td>
         </tr>
        </xsl:if>
        <tr>
          <td valign="top">Edition/year:</td>
          <td>
            <xsl:value-of select="notification_data/phys_item_display/edition"/>
            <xsl:if test="notification_data/phys_item_display/edition != ''">&#160;</xsl:if>
            <xsl:value-of select="notification_data/phys_item_display/publication_date"/>
          </td>
        </tr>
        <xsl:if test="notification_data/phys_item_display/issue_level_description != ''">
          <tr>
            <td valign="top">Issue:</td>
            <td>
              <xsl:value-of select="notification_data/phys_item_display/issue_level_description"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="notification_data/request/record_display_section/series_small != ''" >
          <tr>
            <td valign="top">Series:</td>
            <td>
              <xsl:value-of select="notification_data/request/record_display_section/series_small"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if  test="notification_data/request/manual_description != ''" >
          <tr>
            <td valign="top"><em>Description: </em></td>
            <td>
              <b>
                <xsl:value-of select="notification_data/request/manual_description"/>
              </b>
            </td>
          </tr>
        </xsl:if>
        <!-- Del 3: SLUTT -->
       <!-- Horizontal line -->
          <tr><td colspan="2"><hr/></td></tr>

          <!-- Destination, request type, notes -->
          <tr>
            <td>@@request_type@@:</td>
            <td>
              <xsl:value-of select="notification_data/request_type"/>
              (<xsl:value-of select="notification_data/request/request_type"/>)
            </td>
          </tr>
          <xsl:if test="notification_data/user_for_printing/name">
            <tr>
              <td valign="top">
                @@requested_for@@:
              </td>
              <td>
                <xsl:value-of select="notification_data/user_for_printing/identifiers/code_value[1]/value"/>
                :
                <xsl:value-of select="notification_data/user_for_printing/name"/>

                <!-- Reference: user_group
                  │1  Egne studenter                     15. Nasjonalbiblioteket               │
                  │2  Egne studenter - høyere grad       16. Folkebiblioteksektoren            │
                  │3  Egne fjernstudenter                17. Bibl. i grunn-/videregående skole │
                  │4  Egne ansatte                       18.-19. Ikke i bruk                   │
                  │5  Ekst. stipendiater egen inst.      20. Bibliotek og lign.inst. i Danmark │
                  │6  Stud./stip./ans. andre utd.inst -  21. Bibliotek og lign.inst. i Sverige │
                  │7  Enkeltpersoner                     22. Bibliotek og lign.inst. i Finland │
                  │8  Bedrifter/inst. uten bibliotek     23. Bibliotek og lign.inst. i Island  │
                  │9  Ikke i bruk                        24. Øvrige Europeiske bibliotek       │
                  │10 Andre bibenheter innen samme inst. 25. Verden ellers                     │
                  │11 Universitetsbibliotek i Norge      50. Bokbinder                         │
                  │12 Høgskolebibliotek i Norge                                                │
                  │13 Bedriftsbibliotek i Norge          55-99 Internt bruk v/bibliotekenheten │
                  │14 Andre fag- og forskningsbibliotek                                        │
                  └────────────────────────────────────────────────────────────────────────────
                -->
              
              </td>
            </tr>
          </xsl:if>
          <xsl:if  test="notification_data/user_for_printing/email != ''" >
            <tr>
              <td valign="top">@@email@@:</td>
              <td>
                <xsl:value-of select="notification_data/user_for_printing/email"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if  test="notification_data/external_id != ''" >
            <tr>
              <td valign="top">@@external_id@@:</td>
              <td>
                <xsl:value-of select="notification_data/external_id"/>
              </td>
            </tr>
          </xsl:if>
          <tr>
            <td valign="top">@@move_to_library@@:</td>
            <td>
              <xsl:value-of select="notification_data/destination"/>
            </td>
          </tr>
          <xsl:if test="notification_data/request/system_notes != ''">
            <tr>
              <td valign="top">@@system_notes@@:</td>
              <td>
                <xsl:value-of select="notification_data/request/system_notes"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="notification_data/request/note != ''">
            <tr>
              <td valign="top"><em>@@request_note@@:</em></td>
              <td>
                <b>
                  <xsl:value-of select="notification_data/request/note"/>
                </b>
              </td>
            </tr>
          </xsl:if>

          <!-- Horizontal line -->
          <tr><td colspan="2"><hr/></td></tr>

      <b></b>

 <xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
            <tr>
              <td>
                @@shelving_location_for_item@@:
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="notification_data/phys_item_display/shelving_location/string != ''">
                    <xsl:value-of select="notification_data/phys_item_display/shelving_location/string"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="notification_data/phys_item_display/barcode"/> :
                    <xsl:value-of select="notification_data/phys_item_display/library_name"/>&#160;
                    <xsl:value-of select="notification_data/phys_item_display/location_name"/>&#160;
                    <xsl:value-of select="notification_data/phys_item_display/call_number"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:if>

<!-- Bestilling på HOLDING med midlertidig plassering -->
              <xsl:if test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
                <p>
                 @@shelving_locations_for_holding@@:
                </p>
                <p>
                  <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
                    <xsl:value-of select="."/>
                  </xsl:for-each>
                </p>
              </xsl:if>

<!-- Bestilling på HOLDING -->
    

                <!-- Hvis det finnes tilgjengelige eksemplarer ved biblioteksavdelingen jeg befinner meg på nå,
                     skriver vi ut dem. -->
                <xsl:if test="count(notification_data/phys_item_display/available_items/available_item[library_code=/notification_data/organization_unit/code]) != 0">
                  <p>
                    Available item(s):
                  </p>
                  <table>
                    <xsl:for-each select="notification_data/phys_item_display/available_items/available_item[library_code=/notification_data/organization_unit/code]">
                      <tr>
                        <td style="margin-right:3px;">
                          <font size="5"><xsl:value-of select="barcode"/></font>
                        </td>
                        <td style="margin-right:3px;">
                          <font size="5"><xsl:value-of select="location_name"/></font>
                        </td>
                        <td style="margin-right:3px;">
                          <u><font size="5"><xsl:value-of select="call_number"/></font></u>
                        </td>
                        <td>
                          <xsl:value-of select="public_note"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </xsl:if>
  
<!-- Hvis det ikke finnes tilgjengelige eksemplarer ved biblioteksavdelingen jeg befinner meg på nå,
                     faller vi tilbake på standard-forslaget fra Alma. -->
                <xsl:if test="count(notification_data/phys_item_display/available_items/available_item[library_code=/notification_data/organization_unit/code]) = 0">
                  <p>
                    <strong>
                      <xsl:value-of select="notification_data/phys_item_display/location_name"/>
                      <xsl:if test="notification_data/phys_item_display/call_number != ''">
                        &#160;<xsl:value-of select="notification_data/phys_item_display/call_number"/>
                      </xsl:if>
      <xsl:if test="notification_data/phys_item_display/accession_number != ''">
                        &#160; - @@accession_number@@:
                        <xsl:value-of select="notification_data/phys_item_display/accession_number"/>
                      </xsl:if>
                    </strong>
<xsl:for-each select="notification_data/phys_item_display/summary_holding_infos/summary_holding_info">
                      <span>
                        &#160;&#160;
                        <xsl:value-of select="summary_holding"/>
                        &#160;
                        <xsl:value-of select="notes/string"/>
                      </span>
                    </xsl:for-each>
                  </p>
</xsl:if>
 <!-- Slutt: Bestilling på HOLDING -->

     </table>
    </div>
   </div>
<br> </br>

  <!-- =====================================================================================
        Libnummer skrives ut hvis LTID begynner med "lib".
        Alternativ 2: CSS-basert løsning for de som ikke bruker html2ps
        Se https://github.com/scriptotek/alma-slipsomat#libnummer-norsk-isil-kode
        ===================================================================================== -->
  <xsl:if test="contains(/notification_data/user_for_printing/identifiers/code_value[1]/value, 'lib') and /notification_data/organization_unit/org_scope/institution_id != '2204'">
    <div id="libnummer" style="position: fixed; bottom: 10px; left: 30px; font-size: 60px;">
      <xsl:value-of select="substring(/notification_data/user_for_printing/identifiers/code_value[1]/value, 4, 3)"/>&#160;&#160;<xsl:value-of select="substring(/notification_data/user_for_printing/identifiers/code_value[1]/value, 7, 4)"/>
    </div>
  </xsl:if>
  <!-- ===================================================================================== -->


</body>
</html>


 </xsl:template>
</xsl:stylesheet>