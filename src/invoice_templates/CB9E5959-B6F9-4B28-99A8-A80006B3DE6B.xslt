<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:msxml="urn:schemas-microsoft-com:xslt" xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:customCode="urn:customCode" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001" xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988" xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001" xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi">
  <xsl:decimal-format name="european" decimal-separator="," grouping-separator="." NaN=""/>
  <xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
  <xsl:param name="SV_OutputFormat" select="'HTML'"/>
  <xsl:variable name="XML" select="/"/>
  <xsl:template match="/">
    <html>
      <head>
        <title/>
        <style type="text/css">
          body{background-color:#FFFFFF;font-family:'Tahoma', "Times New Roman", Times, serif;font-size:9px;color:#000000;}h1, h2{padding-bottom:3px;padding-top:3px;margin-bottom:5px;text-transform:uppercase;font-family:Arial, Helvetica, sans-serif;}h1{font-size:1.4em;text-transform:none;}h2{font-size:1em;color:#000000;;}h3{font-size:1em;color:#000000;text-align:justify;margin:0;padding:0;}h4{font-size:1.1em;font-style:bold;font-family: Arial, Helvetica, sans-serif;color:#000000;margin:0;padding:0;}hr{height:2px;color:#000000;background-color:#000000;border-bottom:1px solid #000000;}p, ul, ol{margin-top:1.5em;}ul, ol{margin-left:3em;}blockquote{margin-left:3em;margin-right:3em;font-style:italic;}a{text-decoration:none;color:#000000;}a:hover{border:none;color:#000000;}#despatchTable{border-collapse:collapse;font-size:10px;float:right;border-color:#000000;}#ettnTable{border-collapse:collapse;font-size:10px;border-color:#000000;}#customerPartyTable{border-width:0px;border-style:inset;border-color:#000000;border-collapse:collapse;}#customerIDTable{border-width:2px;border-style:inset;border-color:#000000;border-collapse:collapse;}#customerIDTableTd{border-width:2px;border-style:inset;border-color:#000000;border-collapse:collapse;}#lineTable{border-width:2px;border-style:inset;border-color:#000000;border-collapse:collapse;font-size:8px;}#lineTableTd{font-size:8px;border-width:1px;padding:1px;border-style:inset;border-color:#000000;background-color:white;}#lineTableTr{border-width:1px;padding:0px;border-style:inset;border-color:#000000;background-color: white;}#lineTableDummyTd{border-width:1px;border-color:white;padding:1px;border-style:inset;border-color:black;background-color:white;}#lineTableBudgetTd{border-width:2px;border-spacing:0px;padding:1px;border-style:inset;border-color:black;background-color:white;}#notesTable{border-width:2px;border-style:inset;border-color:black;border-collapse:collapse;}#notesTableTd{border-width:0px;border-style:inset;border-color:black;border-collapse:collapse;}table{border-spacing:0px;}#budgetContainerTable{border-width:0px;border-spacing:0px;border-style:inset;border-color:black;border-collapse:collapse;}td{border-color:#000000;}#iptal{font-size: 150pt;opacity: 0.5;color: red;position: absolute;top: 550px;left: 220px;} #allowanceContainerTable{border-width:2px;border-style:inset;border-color:#000000;border-collapse:collapse;font-size:8px;}#allowanceContainerTd{font-size:8px;border-width:1px;padding:1px;border-style:inset;border-color:#000000;background-color:white;}#allowanceContainerTr{border-width:1px;padding:0px;border-style:inset;border-color:#000000;background-color: white;}
        </style>
        <title>e-Arşiv</title>
      </head>
      <body style="margin-left=0.6in; margin-right=0.6in; margin-top=0.79in; margin-bottom=0.79in">
        <xsl:for-each select="$XML">
          <table style="border-color:blue; " border="0" cellspacing="0px" width="800" cellpadding="0px">
            <tbody>
              <tr valign="top">
                <td width="40%">
                  <br/>
                  <table align="center" border="0" width="100%">
                    <tbody>
                      <hr/>
                      <tr align="left">
                        <xsl:for-each select="//n1:Invoice">
                          <xsl:for-each select="cac:AccountingSupplierParty">
                            <xsl:for-each select="cac:Party">
                              <td align="left">
                                <xsl:if test="cac:PartyName">
                                  <xsl:value-of select="cac:PartyName/cbc:Name"/>
                                  <br/>
                                </xsl:if>
                                <xsl:for-each select="cac:Person">
                                  <xsl:for-each select="cbc:Title">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:FirstName">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:MiddleName">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:FamilyName">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:NameSuffix">
                                    <xsl:apply-templates/>
                                  </xsl:for-each>
                                </xsl:for-each>
                              </td>
                            </xsl:for-each>
                          </xsl:for-each>
                        </xsl:for-each>
                      </tr>
                      <tr align="left">
                        <xsl:for-each select="//n1:Invoice">
                          <xsl:for-each select="cac:AccountingSupplierParty">
                            <xsl:for-each select="cac:Party">
                              <td align="left">
                                <xsl:for-each select="cac:PostalAddress">
                                  <xsl:for-each select="cbc:StreetName">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:BuildingName">
                                    <xsl:apply-templates/>
                                  </xsl:for-each>
                                  <xsl:if test="cbc:BuildingNumber">
                                    <span>
                                      <xsl:text> No:</xsl:text>
                                    </span>
                                    <xsl:for-each select="cbc:BuildingNumber">
                                      <xsl:apply-templates/>
                                    </xsl:for-each>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:if>
                                  <br/>
                                  <xsl:for-each select="cbc:PostalZone">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                  <xsl:for-each select="cbc:CitySubdivisionName">
                                    <xsl:apply-templates/>
                                  </xsl:for-each>
                                  <span>
                                    <xsl:text>/ </xsl:text>
                                  </span>
                                  <xsl:for-each select="cbc:CityName">
                                    <xsl:apply-templates/>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                </xsl:for-each>
                              </td>
                            </xsl:for-each>
                          </xsl:for-each>
                        </xsl:for-each>
                      </tr>
                      <xsl:if test="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone or //n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax">
                        <tr align="left">
                          <xsl:for-each select="//n1:Invoice">
                            <xsl:for-each select="cac:AccountingSupplierParty">
                              <xsl:for-each select="cac:Party">
                                <td align="left">
                                  <xsl:for-each select="cac:Contact">
                                    <xsl:if test="cbc:Telephone">
                                      <span>
                                        <xsl:text>Tel: </xsl:text>
                                      </span>
                                      <xsl:for-each select="cbc:Telephone">
                                        <xsl:apply-templates/>
                                      </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="cbc:Telefax">
                                      <span>
                                        <xsl:text> Fax: </xsl:text>
                                      </span>
                                      <xsl:for-each select="cbc:Telefax">
                                        <xsl:apply-templates/>
                                      </xsl:for-each>
                                    </xsl:if>
                                    <span>
                                      <xsl:text>&#160;</xsl:text>
                                    </span>
                                  </xsl:for-each>
                                </td>
                              </xsl:for-each>
                            </xsl:for-each>
                          </xsl:for-each>
                        </tr>
                      </xsl:if>
                      <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI">
                        <tr align="left">
                          <td>
                            <xsl:text>Web Sitesi: </xsl:text>
                            <xsl:value-of select="."/>
                          </td>
                        </tr>
                      </xsl:for-each>
                      <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
                        <tr align="left">
                          <td>
                            <xsl:text>E-Posta: </xsl:text>
                            <xsl:value-of select="."/>
                          </td>
                        </tr>
                      </xsl:for-each>
                      <tr align="left">
                        <xsl:for-each select="//n1:Invoice">
                          <xsl:for-each select="cac:AccountingSupplierParty">
                            <xsl:for-each select="cac:Party">
                              <td align="left">
                                <span>
                                  <xsl:text>Vergi Dairesi: </xsl:text>
                                </span>
                                <xsl:for-each select="cac:PartyTaxScheme">
                                  <xsl:for-each select="cac:TaxScheme">
                                    <xsl:for-each select="cbc:Name">
                                      <xsl:apply-templates/>
                                    </xsl:for-each>
                                  </xsl:for-each>
                                  <span>
                                    <xsl:text>&#160; </xsl:text>
                                  </span>
                                </xsl:for-each>
                              </td>
                            </xsl:for-each>
                          </xsl:for-each>
                        </xsl:for-each>
                      </tr>
                      <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
                        <tr align="left">
                          <td>
                            <xsl:value-of select="cbc:ID/@schemeID"/>
                            <xsl:text>: </xsl:text>
                            <xsl:value-of select="cbc:ID"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                  <hr/>
                </td>
                <td width="20%" align="center" valign="middle">
                  <br/>
                  <br/>
                  <img style="width:91px;" align="middle" alt="E-Fatura Logo" src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzMiA3OS4xNTkyODQsIDIwMTYvMDQvMTktMTM6MTM6NDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjZDNDJBNEI2QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjZDNDJBNEI1QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzREVENkU1N0FDREVDNEJBNzkxNUM2M0NCN0RENzM0NyIgc3RSZWY6ZG9jdW1lbnRJRD0iM0RFRDZFNTdBQ0RFQzRCQTc5MTVDNjNDQjdERDczNDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB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"/>
                  <h1 align="center">
                    <span style="font-weight:bold; ">
                      <xsl:text>e-FATURA</xsl:text>
                    </span>
                  </h1>
                </td>
				  <td width='40%' valign='middle' align='right'><img style='max-width:320px; max-height:180px;' alt = 'Firma Logo' src = 'data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAABWCAYAAAA5dWTbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpGMUY3NEY1QjYyREUxMUVBQTcxM0EwNzAyN0Y5NUMzOCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpGMUY3NEY1QzYyREUxMUVBQTcxM0EwNzAyN0Y5NUMzOCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkYxRjc0RjU5NjJERTExRUFBNzEzQTA3MDI3Rjk1QzM4IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkYxRjc0RjVBNjJERTExRUFBNzEzQTA3MDI3Rjk1QzM4Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+gRl7LwAAJQBJREFUeNrsXQmc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'/></td> 
              </tr>
              <tr style="height:118px; " valign="top">
                <td width="40%" align="right" valign="bottom">
                  <table id="customerPartyTable" align="left" border="0" height="50%">
                    <tbody>
                      <tr style="height:71px; ">
                        <td>
                          <hr/>
                          <table align="center" border="0">
                            <tbody>
                              <tr>
                                <xsl:for-each select="//n1:Invoice">
                                  <xsl:for-each select="cac:AccountingCustomerParty">
                                    <xsl:for-each select="cac:Party">
                                      <td style="width:469px; " align="left">
                                        <span style="font-weight:bold; ">
                                          <xsl:text>SAYIN</xsl:text>
                                        </span>
                                      </td>
                                    </xsl:for-each>
                                  </xsl:for-each>
                                </xsl:for-each>
                              </tr>
                              <tr>
                                <xsl:choose>
                                  <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                    <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                      <xsl:call-template name="Party_Title">
                                        <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='EXPORT']">
                                    <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                      <xsl:call-template name="Party_Title">
                                        <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                      <xsl:call-template name="Party_Title">
                                        <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </tr>
                              <tr>
                                <xsl:choose>
                                  <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='TAXFREE']">
                                    <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                      <tr>
                                        <xsl:call-template name="Party_Adress">
                                          <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                        </xsl:call-template>
                                      </tr>
                                      <xsl:call-template name="Party_Other">
                                        <xsl:with-param name="PartyType">TAXFREE</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:when test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE' and text()='EXPORT']">
                                    <xsl:for-each select="n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                      <tr>
                                        <xsl:call-template name="Party_Adress">
                                          <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                        </xsl:call-template>
                                      </tr>
                                      <xsl:call-template name="Party_Other">
                                        <xsl:with-param name="PartyType">EXPORT</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <xsl:for-each select="n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                      <tr>
                                        <xsl:call-template name="Party_Adress">
                                          <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                        </xsl:call-template>
                                      </tr>
                                      <xsl:call-template name="Party_Other">
                                        <xsl:with-param name="PartyType">OTHER</xsl:with-param>
                                      </xsl:call-template>
                                    </xsl:for-each>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </tr>
                            </tbody>
                          </table>
                          <hr/>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <br/>
                </td>
                <td width="60%" align="center" valign="bottom" colspan="2">
                  <table border="1" id="despatchTable">
                    <tbody>
                      <tr>
                        <td style="width:120px;" align="left">
                          <span style="font-weight:bold; ">
                            <xsl:text>Özelleştirme No:</xsl:text>
                          </span>
                        </td>
                        <td style="width:140px;" align="left">
                          <xsl:for-each select="//n1:Invoice">
                            <xsl:for-each select="cbc:CustomizationID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </xsl:for-each>
                        </td>
                      </tr>
                      <tr style="height:13px;">
                        <td align="left">
                          <span style="font-weight:bold;">
                            <xsl:text>Senaryo:</xsl:text>
                          </span>
                        </td>
                        <td align="left">
                          <xsl:if test="//n1:Invoice/cbc:ProfileID = 'HKS'">
                            HAL FATURASI
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cbc:ProfileID != 'HKS'">
                            <xsl:value-of select="//n1:Invoice/cbc:ProfileID"/>
                          </xsl:if>
                        </td>
                      </tr>
                      <tr style="height:13px;">
                        <td align="left">
                          <span style="font-weight:bold;">
                            <xsl:text>Fatura Tipi:</xsl:text>
                          </span>
                        </td>
                        <td align="left">
                          <xsl:for-each select="//n1:Invoice">
                            <xsl:for-each select="cbc:InvoiceTypeCode">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </xsl:for-each>
                        </td>
                      </tr>
                      <tr style="height:13px;">
                        <td align="left">
                          <span style="font-weight:bold;">
                            <xsl:text>Fatura No:</xsl:text>
                          </span>
                        </td>
                        <td align="left">
                          <xsl:for-each select="//n1:Invoice">
                            <xsl:for-each select="cbc:ID">
                              <xsl:apply-templates/>
                            </xsl:for-each>
                          </xsl:for-each>
                        </td>
                      </tr>
                      <tr style="height:13px;">
                        <td align="left">
                          <span style="font-weight:bold;">
                            <xsl:text>Fatura Tarihi:</xsl:text>
                          </span>
                        </td>
                        <td align="left">
                          <xsl:for-each select="//n1:Invoice">
                            <xsl:for-each select="cbc:IssueDate">
                              <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
                            </xsl:for-each>
                            <xsl:text> </xsl:text>
                            <xsl:for-each select="cbc:IssueTime">
                              <xsl:value-of select="substring(.,1,5)"/>
                            </xsl:for-each>
                          </xsl:for-each>
                        </td>
                      </tr>
                      <xsl:for-each select="//n1:Invoice/cac:DespatchDocumentReference">
                        <xsl:if test="normalize-space(cbc:ID)">
                          <tr style="height:13px;">
                            <td align="left">
                              <span style="font-weight:bold;">
                                <xsl:text>İrsaliye No:</xsl:text>
                              </span>
                              <span>
                                <xsl:text>&#160;</xsl:text>
                              </span>
                            </td>
                            <td align="left">
                              <xsl:value-of select="cbc:ID"/>
                            </td>
                          </tr>
                        </xsl:if>
                        <xsl:if test="normalize-space(cbc:IssueDate)">
                          <tr style="height:13px;">
                            <td align="left">
                              <span style="font-weight:bold;">
                                <xsl:text>İrsaliye Tarihi:</xsl:text>
                              </span>
                            </td>
                            <td align="left">
                              <xsl:for-each select="cbc:IssueDate">
                                <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
                              </xsl:for-each>
                            </td>
                          </tr>
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:if test="normalize-space(//n1:Invoice/cac:OrderReference/cbc:ID)">
                        <tr style="height:13px">
                          <td align="left">
                            <span style="font-weight:bold;">
                              <xsl:text>Sipariş No:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="//n1:Invoice/cac:OrderReference">
                              <xsl:for-each select="cbc:ID">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                            </xsl:for-each>
                          </td>
                        </tr>
                      </xsl:if>
                      <xsl:if test="normalize-space(//n1:Invoice/cac:OrderReference/cbc:IssueDate)">
                        <tr style="height:13px">
                          <td align="left">
                            <span style="font-weight:bold;">
                              <xsl:text>Sipariş Tarihi:</xsl:text>
                            </span>
                          </td>
                          <td align="left">
                            <xsl:for-each select="//n1:Invoice/cac:OrderReference">
                              <xsl:for-each select="cbc:IssueDate">
                                <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
                              </xsl:for-each>
                            </xsl:for-each>
                          </td>
                        </tr>
                      </xsl:if>
                      <xsl:for-each select ="//n1:Invoice/cac:AdditionalDocumentReference">
                        <xsl:if test ="cbc:ID = 'faturaIptal' and cbc:DocumentType = '1'">
                          <tr condition="//n1:Invoice/cac:OrderReference">
                            <td align="left" id="lineTableTd">
                              <strong style="color: rgb(105, 105, 105); font-family: verdana, geneva, sans-serif; font-size: 10px;">İptal Tarihi:</strong>
                            </td>
                            <td id="lineTableTd">
                              <span style="color: rgb(105, 105, 105);">
                                <span style="font-size: 10px;">
                                  <span style="font-family: verdana,geneva,sans-serif;">
                                    <xsl:for-each select="cbc:IssueDate">
                                      <xsl:value-of select="substring(.,9,2)"	/>-<xsl:value-of select="substring(.,6,2)" />-<xsl:value-of select="substring(.,1,4)" />
                                    </xsl:for-each>
                                    <div id="iptal">İptal</div>
                                  </span>
                                </span>
                              </span>
                            </td>
                          </tr>
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:for-each select="n1:Invoice/cac:TaxRepresentativeParty/cac:PartyIdentification/cbc:ID[@schemeID='ARACIKURUMVKN']">
                        <tr>
                          <td style="width:105px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Arac&#305; Kurum VKN:</xsl:text>
                            </span>
                          </td>
                          <td style="width:110px;" align="left">
                            <xsl:value-of select="."/>
                          </td>
                        </tr>
                        <tr>
                          <td style="width:105px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Arac&#305; Kurum Unvan:</xsl:text>
                            </span>
                          </td>
                          <td style="width:110px;" align="left">
                            <xsl:value-of select="../../cac:PartyName/cbc:Name"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </td>
              </tr>
              <tr align="left">
                <table id="ettnTable">
                  <tr style="height:13px;">
                    <td align="left" valign="top">
                      <span style="font-weight:bold;">
                        <xsl:text>ETTN:</xsl:text>
                      </span>
                    </td>
                    <td align="left" width="240px">
                      <xsl:for-each select="//n1:Invoice">
                        <xsl:for-each select="cbc:UUID">
                          <xsl:apply-templates/>
                        </xsl:for-each>
                      </xsl:for-each>
                    </td>
                  </tr>
                </table>
              </tr>
              <xsl:if test="//n1:Invoice/cbc:InvoiceTypeCode = &apos;SGK&apos;">
                <tr>
                  <td width="60%" align="center" valign="bottom" colspan="2">
                    <table border="1" id="SGKTable">
                      <tbody>
                        <tr>
                          <td style="width:120px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Sağlık Fatura Tipi</xsl:text>
                            </span>
                          </td>
                          <td style="width:140px;" align="left">
                            <xsl:for-each select="//n1:Invoice">
                              <xsl:for-each select="cbc:AccountingCost">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                            </xsl:for-each>
                          </td>
                        </tr>
                        <tr>

                          <td style="width:120px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Mükellef Kodu</xsl:text>
                            </span>
                          </td>
                          <td style="width:140px;" align="left">

                            <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                              <xsl:if test="cbc:DocumentTypeCode= &apos;MUKELLEF_KODU&apos;">
                                <xsl:for-each select="cbc:DocumentType">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                              </xsl:if>
                            </xsl:for-each>
                          </td>
                        </tr>



                        <tr>

                          <td style="width:120px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Mükellef Adı</xsl:text>
                            </span>
                          </td>
                          <td style="width:140px;" align="left">

                            <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                              <xsl:if test="cbc:DocumentTypeCode= &apos;MUKELLEF_ADI&apos;">
                                <xsl:for-each select="cbc:DocumentType">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                              </xsl:if>
                            </xsl:for-each>
                          </td>
                        </tr>

                        <tr>

                          <td style="width:120px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Dosya No</xsl:text>
                            </span>
                          </td>
                          <td style="width:140px;" align="left">

                            <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                              <xsl:if test="cbc:DocumentTypeCode= &apos;DOSYA_NO&apos; or cbc:DocumentTypeCode= &apos;HARCAMA_REFERANS_NO&apos; ">
                                <xsl:for-each select="cbc:DocumentType">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                              </xsl:if>
                            </xsl:for-each>
                          </td>
                        </tr>

                        <tr>

                          <td style="width:120px;" align="left">
                            <span style="font-weight:bold; ">
                              <xsl:text>Dönem</xsl:text>
                            </span>
                          </td>
                          <td style="width:140px;" align="left">

                            <xsl:for-each select="//n1:Invoice/cac:InvoicePeriod">
                              <xsl:for-each select="cbc:StartDate">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                              <xsl:text> / </xsl:text>
                              <xsl:for-each select="cbc:EndDate">
                                <xsl:apply-templates/>
                              </xsl:for-each>
                            </xsl:for-each>

                            <xsl:for-each select="//n1:Invoice/cac:InvoicePeriod">
                              <xsl:if test="cbc:DocumentTypeCode= &apos;MUKELLEF_KODU&apos;">
                                <xsl:for-each select="cbc:DocumentType">
                                  <xsl:apply-templates/>
                                </xsl:for-each>
                              </xsl:if>
                            </xsl:for-each>
                          </td>
                        </tr>

                      </tbody>
                    </table>
                  </td>


                  <td style="width: 200px;">&#160;</td>
                  <td style="width: 242px;">&#160;</td>
                </tr>
              </xsl:if>
            </tbody>
          </table>
          <div id="lineTableAligner">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </div>
          <table border="1" id="lineTable" width="800">
            <tbody>
              <tr id="lineTableTr">
                <td id="lineTableTd" style="width:2%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>Sıra No</xsl:text>
                  </span>
                </td>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                    <td id="lineTableTd" style="width:5%"  align="center">
                      <span style="font-weight:bold;">
                        <xsl:text>Malzeme/Hizmet Kodu</xsl:text>
                        <br />
                        <br />
                        <xsl:text>Malzeme/Hizmet Açıklaması</xsl:text>
                      </span>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td id="lineTableTd" style="width:5%"  align="center">
                      <span style="font-weight:bold;">
                        <xsl:text>Malzeme/Hizmet Kodu</xsl:text>
                      </span>
                    </td>
                    <td id="lineTableTd" style="width:10%" align="center">
                      <span style="font-weight:bold;">
                        <xsl:text>Malzeme/Hizmet Açıklaması</xsl:text>
                      </span>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
                <td id="lineTableTd" style="width:2%" align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>Satır Açıklaması</xsl:text>
                  </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS'">
                  <td id="lineTableTd" style="width:8%"  align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Künye Numarası</xsl:text>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and //n1:Invoice/cbc:InvoiceTypeCode = 'SATIS'">
                  <td id="lineTableTd" style="width:8%"  align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Mal Sahibi Vkn/Tckn</xsl:text>
                    </span>
                  </td>
                  <td id="lineTableTd" style="width:8%"  align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Mal Sahibi Unvan/AdSoyad</xsl:text>
                    </span>
                  </td>
                </xsl:if>
                <td id="lineTableTd" style="width:8%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>Miktar</xsl:text>
                  </span>
                </td>
                <td id="lineTableTd" style="width:13%" align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>Birim Fiyat</xsl:text>
                  </span>
                </td>
                <td id="lineTableTd" style="width:9.5%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>İskonto Oranı</xsl:text>
                  </span>
                </td>
                <td id="lineTableTd" style="width:10%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>İskonto Tutarı</xsl:text>
                  </span>
                </td>
                <td id="lineTableTd" style="width:9%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>KDV Oranı</xsl:text>
                  </span>
                </td>
                <td id="lineTableTd" style="width:9%"  align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>KDV Tutarı</xsl:text>
                  </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID !='IHRACAT'">
                  <td id="lineTableTd" style="width:7%;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Diğer Vergiler</xsl:text>
                    </span>
                  </td>
                  <td id="lineTableTd" style="width:6%;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Vergi Muafiyet Sebebi</xsl:text>
                    </span>
                  </td>
                </xsl:if>
                <td id="lineTableTd" style="width:11%" align="center">
                  <span style="font-weight:bold;">
                    <xsl:text>Malzeme / Hizmet Tutarı</xsl:text>
                  </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Teslim Şartı</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Eşya Kap Cinsi</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Kap No</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Kap Adet</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Teslim / Bedel Ödeme Yeri</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>Gönderilme Şekli</xsl:text>
                    </span>
                  </td>
                  <td class="lineTableTd" style="width:10.6%; font-size:8px;" align="center">
                    <span style="font-weight:bold;">
                      <xsl:text>GTİP</xsl:text>
                    </span>
                  </td>
                </xsl:if>
              </tr>
              <xsl:if test="count(//n1:Invoice/cac:InvoiceLine) &gt;= 20">
                <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
                  <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:call-template name="geneliskonto" />
              </xsl:if>
              <xsl:if test="count(//n1:Invoice/cac:InvoiceLine) &lt; 20">
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[1]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[1]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="//n1:Invoice"/>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[2]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[2]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[1]/cbc:ID = 1">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[3]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[3]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[2]/cbc:ID = 2">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[4]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[4]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[3]/cbc:ID = 3">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[5]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[5]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[4]/cbc:ID = 4">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[6]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[6]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[5]/cbc:ID = 5">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[7]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[7]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[6]/cbc:ID = 6">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[8]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[8]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[7]/cbc:ID = 7">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[9]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[9]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[8]/cbc:ID = 8">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[10]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[10]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[9]/cbc:ID = 9">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[11]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[11]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[10]/cbc:ID = 10">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[12]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[12]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[11]/cbc:ID = 11">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[13]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[13]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[12]/cbc:ID = 12">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[14]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[14]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[13]/cbc:ID = 13">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[15]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[15]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[14]/cbc:ID = 14">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[16]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[16]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[15]/cbc:ID = 15">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[17]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[17]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[16]/cbc:ID = 16">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[18]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[18]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[17]/cbc:ID = 17">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[19]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[19]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[18]/cbc:ID = 18">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[20]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[20]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="//n1:Invoice/cac:InvoiceLine[19]/cbc:ID = 19">
                        <xsl:call-template name="geneliskonto" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:apply-templates select="//n1:Invoice"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[21]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[21]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="//n1:Invoice"/>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="//n1:Invoice/cac:InvoiceLine[22]">
                    <xsl:apply-templates select="//n1:Invoice/cac:InvoiceLine[22]"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="//n1:Invoice"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
            </tbody>
          </table>
        </xsl:for-each>
        <xsl:variable name="var_Masraf" select="count(//n1:Invoice/cac:AllowanceCharge[./cbc:ChargeIndicator = 'false'])"/>
        <!--<xsl:variable name="var_USD" select="count(//n1:Invoice/cac:AllowanceCharge/cbc:Amount[@currencyID='USD'])"/>-->
        <xsl:variable name="var_TRY" select="count(//n1:Invoice/cac:AllowanceCharge/cbc:Amount[@currencyID='TRY'])"/>


        <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and $var_Masraf > 0">
          <br />
          <br />
          <table width="800px">
            <tr>
              <td width="60%">
                <table>
                  <tr>
                    <td id="allowanceContainerTd" style="width:20%">
                      <span style="font-weight:bold;">
                        <xsl:text>Masraf Türü</xsl:text>
                      </span>
                    </td>
                    <td id="allowanceContainerTd" style="width:20%">
                      <span style="font-weight:bold;">
                        <xsl:text>Masraf Oranı%</xsl:text>
                      </span>
                    </td>
                    <td id="allowanceContainerTd">
                      <span style="font-weight:bold;">
                        <xsl:text>Masraf Tutarı</xsl:text>
                      </span>
                    </td>
                    <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                      <td id="allowanceContainerTd">
                        <span style="font-weight:bold;">
                          <xsl:text>Masraf Tutarı TL</xsl:text>
                        </span>
                      </td>
                    </xsl:if>
                  </tr>
                  
                    <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason[starts-with(., 'HKS') and not(contains(.,'KDV'))]">
                      <tr>
                      <td id="allowanceContainerTd" style="width:20%">
                        <xsl:value-of select="substring(../cbc:AllowanceChargeReason, 4)"/>
                      </td>
                      <td id="allowanceContainerTd" style="width:20%">
                        <xsl:value-of select="../cbc:MultiplierFactorNumeric"/>
                      </td>
                      <td id="allowanceContainerTd" style="width:10%">
                        <xsl:value-of select="../cbc:Amount"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test ="../cbc:Amount/@currencyID = 'TRY'">
                          TL
                        </xsl:if>
                        <xsl:if test ="../cbc:Amount/@currencyID != 'TRY'">
                          <xsl:value-of select="../cbc:Amount/@currencyID" />
                        </xsl:if>
                      </td>
                      <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                        <td id="allowanceContainerTd" style="width:20%">
                          <xsl:value-of select="format-number(../cbc:Amount * ../../cac:PricingExchangeRate/cbc:CalculationRate,'###.##0,00', 'european')"/>
                          <xsl:text>&#160;TL</xsl:text>
                        </td>
                      </xsl:if>
                      </tr>
                    </xsl:for-each>
                  
                </table>
              </td>
              <td>
                <table style="margin: 0 0 0 -3px">
                  <tr>
                    <td id="allowanceContainerTd" style="width:10%">
                      <span style="font-weight:bold;">
                        <xsl:text>Masraf Kdv Oranı %</xsl:text>
                      </span>
                    </td>
                    <td id="allowanceContainerTd" style="width:10%">
                      <span style="font-weight:bold;">
                        <xsl:text>Masraf Kdv Tutarı</xsl:text>
                      </span>
                    </td>
                    <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                      <td id="allowanceContainerTd" style="width:10%">
                        <span style="font-weight:bold;">
                          <xsl:text>Masraf Kdv Tutarı TL</xsl:text>
                        </span>
                      </td>
                    </xsl:if>
                  </tr>
                  <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason[starts-with(., 'HKS') and contains(.,'KDV')]">
                    <tr>
                      <td id="allowanceContainerTd" style="width:10%">
                        <xsl:value-of select="../cbc:MultiplierFactorNumeric"/>
                      </td>
                      <td id="allowanceContainerTd" style="width:10%">
                        <xsl:value-of select="../cbc:Amount"/>
                        <xsl:text> </xsl:text>
                        <xsl:if test ="../cbc:Amount/@currencyID = 'TRY' and $var_TRY = 0">
                          TL
                        </xsl:if>
                        <xsl:if test ="../cbc:Amount/@currencyID != 'TRY'">
                          <xsl:value-of select="../cbc:Amount/@currencyID" />
                        </xsl:if>
                      </td>
                      <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                        <td id="allowanceContainerTd" style="width:10%">
                          <xsl:value-of select="format-number(../cbc:Amount * ../../cac:PricingExchangeRate/cbc:CalculationRate,'###.##0,00', 'european')"/>
                          <xsl:text> TL</xsl:text>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </table>
              </td>
            </tr>
          </table>

          <br />
          <br />
        </xsl:if>
        <table id="budgetContainerTable" width="800px">
          <tr id="budgetContainerTr" align="right">
            <td id="budgetContainerDummyTd"/>
            <td id="lineTableBudgetTd" align="right" width="270px">
              <span style="font-weight:bold;">
                <xsl:text>Malzeme / Hizmet Toplam Tutarı</xsl:text>
              </span>
            </td>
            <td id="lineTableBudgetTd" style="width:81px; " align="right">
              <span>
                <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount, '###.##0,00', 'european')"/>
                <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID">
                  <xsl:text/>
                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID = 'TRY'">
                    <xsl:text>&#160;TL</xsl:text>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRY'">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID"/>
                  </xsl:if>
                </xsl:if>
              </span>
            </td>
          </tr>
          <tr id="budgetContainerTr" align="right">
            <td id="budgetContainerDummyTd"/>
            <td id="lineTableBudgetTd" align="right" width="270px">
              <span style="font-weight:bold;">
                <xsl:text>Toplam İskonto</xsl:text>
              </span>
            </td>
            <td id="lineTableBudgetTd" style="width:81px; " align="right">
              <span>
                <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, '###.##0,00', 'european')"/>
                <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID">
                  <xsl:text/>
                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID = 'TRY'">
                    <xsl:text>&#160;TL</xsl:text>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID != 'TRY'">
                    <xsl:text>&#160;</xsl:text>
                    <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID"/>
                  </xsl:if>
                </xsl:if>
              </span>
            </td>
          </tr>
          <xsl:if test="//n1:Invoice/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" align="right" width="270px">
                <span style="font-weight:bold;">
                  <xsl:text>Toplam Masraf</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:81px; " align="right">
                <span>
                  <xsl:if test="//n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = 'true' and //n1:Invoice/cbc:ProfileID !='HKS'">
                    <xsl:text> 
				 (% 
				 </xsl:text>
                    <xsl:value-of select="format-number((//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount*100) div //n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                    <xsl:text> 
				 ) 
				 </xsl:text>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cbc:InvoiceTypeCode ='KOMISYONCU'">
                    <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount"/>&#160;
                    <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                      <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount/@currencyID"/>
                    </xsl:if>
                    <xsl:if test="$var_Masraf > 0 and $var_TRY > 0">
                      TL
                    </xsl:if>
                  </xsl:if>
                </span>
              </td>
            </tr>
          </xsl:if>
          <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
            <xsl:choose>
              <xsl:when test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                <tr id="budgetContainerTr" align="right">
                  <td id="budgetContainerDummyTd"/>
                  <td id="lineTableBudgetTd" width="270px" align="right">
                    <span style="font-weight:bold;">
                      <xsl:choose>
                        <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                          <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Hesaplanan </xsl:text>
                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:if test ="cbc:Percent">
                        <xsl:text>(%</xsl:text>
                        <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </span>
                  </td>
                  <td id="lineTableBudgetTd" style="width:82px; " align="right">
                    <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                      <xsl:text/>
                      <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                      <xsl:if test="../../cbc:TaxAmount/@currencyID">
                        <xsl:text/>
                        <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                          <xsl:text>&#160;TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                        </xsl:if>
                      </xsl:if>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="cbc:Percent = 0.0000 or cbc:TaxAmount = 0">
                <tr id="budgetContainerTr" align="right">
                  <td id="budgetContainerDummyTd"/>
                  <td id="lineTableBudgetTd" width="270px" align="right">
                    <span style="font-weight:bold;">
                      <xsl:choose>
                        <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                          <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Hesaplanan </xsl:text>
                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:if test ="cbc:Percent">
                        <xsl:text>(%</xsl:text>
                        <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </span>
                  </td>
                  <td id="lineTableBudgetTd" style="width:82px; " align="right">
                    <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                      <xsl:text/>
                      <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                      <xsl:if test="../../cbc:TaxAmount/@currencyID">
                        <xsl:text/>
                        <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                          <xsl:text>&#160;TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                        </xsl:if>
                      </xsl:if>
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
            <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
              <tr id="budgetContainerTr" align="right">
                <td id="budgetContainerDummyTd"/>
                <td id="lineTableBudgetTd" width="270px" align="right">
                  <span style="font-weight:bold; ">
                    <xsl:choose>
                      <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                        <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>Tevkifat (</xsl:text>
                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                        <xsl:text>)</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test ="cbc:Percent">
                      <xsl:text>(%</xsl:text>
                      <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                      <xsl:text>)</xsl:text>
                    </xsl:if>
                  </span>
                </td>
                <td id="lineTableBudgetTd" style="width:82px; " align="right">
                  <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                    <xsl:text/>
                    <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                    <xsl:if test="../../cbc:TaxAmount/@currencyID">
                      <xsl:text/>
                      <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                        <xsl:text>&#160;TL</xsl:text>
                      </xsl:if>
                      <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd"  align="right" width="270px">
                <span style="font-weight:bold; ">
                  <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:82px; " align="right">
                <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                  <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                </xsl:if>
                <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                  <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount), '###.##0,00', 'european')"/>
                </xsl:if>
                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                  <xsl:text>&#160;TL</xsl:text>
                </xsl:if>
                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                </xsl:if>
              </td>
            </tr>
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd"  align="right" width="270px">
                <span style="font-weight:bold; ">
                  <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:82px; " align="right">
                <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                  <xsl:value-of select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                </xsl:if>
                <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                  <xsl:value-of select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount), '###.##0,00', 'european')"/>
                </xsl:if>
                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode = 'TRL' or n1:Invoice/cbc:DocumentCurrencyCode = 'TRY'">
                  <xsl:text>&#160;TL</xsl:text>
                </xsl:if>
                <xsl:if test="n1:Invoice/cbc:DocumentCurrencyCode != 'TRL' and n1:Invoice/cbc:DocumentCurrencyCode != 'TRY'">
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="n1:Invoice/cbc:DocumentCurrencyCode"/>
                </xsl:if>
              </td>
            </tr>
          </xsl:if>
          <tr id="budgetContainerTr" align="right">
            <td id="budgetContainerDummyTd"/>
            <td id="lineTableBudgetTd" width="270px" align="right">
              <span style="font-weight:bold; ">
                <xsl:text>Vergiler Dahil Toplam Tutar</xsl:text>
              </span>
            </td>
            <td id="lineTableBudgetTd" style="width:82px; " align="right">
              <xsl:for-each select="//n1:Invoice">
                <xsl:for-each select="cac:LegalMonetaryTotal">
                  <xsl:for-each select="cbc:TaxInclusiveAmount">
                    <xsl:value-of select="format-number(., '###.##0,00', 'european')"/>
                    <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID">
                      <xsl:text/>
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = 'TRY'">
                        <xsl:text>&#160;TL</xsl:text>
                      </xsl:if>
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != 'TRY'">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID"/>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:for-each>
            </td>
          </tr>
          <tr id="budgetContainerTr" align="right">
            <td id="budgetContainerDummyTd"/>
            <td id="lineTableBudgetTd" width="270px" align="right">
              <span style="font-weight:bold;">
                <xsl:text>Ödenecek Tutar</xsl:text>
              </span>
            </td>
            <td id="lineTableBudgetTd" style="width:82px; " align="right">
              <xsl:for-each select="//n1:Invoice">
                <xsl:for-each select="cac:LegalMonetaryTotal">
                  <xsl:for-each select="cbc:PayableAmount">
                    <xsl:value-of select="format-number(., '###.##0,00', 'european')"/>
                    <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID">
                      <xsl:text/>
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID = 'TRY'">
                        <xsl:text>&#160;TL</xsl:text>
                      </xsl:if>
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID != 'TRY'">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID"/>
                      </xsl:if>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:for-each>
            </td>
          </tr>
        </table>
        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != 'TRY'">
          <table id="budgetContainerTable" width="800px">
            <tr id="budgetContainerTr2" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" width="270px" align="right">
                <span style="font-weight:bold;">
                  <xsl:text>Döviz Kuru</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:82px; " align="right">
                <xsl:value-of select="format-number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, '###.##0,0000', 'european')"/>
                <xsl:text>&#160;TL</xsl:text>
              </td>
            </tr>
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" align="right" width="270px">
                <span style="font-weight:bold;">
                  <xsl:text>Malzeme / Hizmet Toplam Tutarı</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:81px; " align="right">
                <span>
                  <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                    <xsl:if test="cbc:DocumentType = 'LINEEXTENSIONAMOUNT'">
                      <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:text>&#160;TL</xsl:text>
                </span>
              </td>
            </tr>
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" align="right" width="270px">
                <span style="font-weight:bold;">
                  <xsl:text>Toplam İskonto</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:81px; " align="right">
                <span>
                  <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                    <xsl:if test="cbc:DocumentType = 'ALLOWANCETOTALAMOUNT'">
                      <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:text>&#160;TL</xsl:text>
                </span>
              </td>
            </tr>
            <xsl:if test="//n1:Invoice/cbc:InvoiceTypeCode ='KOMISYONCU'">
              <tr id="budgetContainerTr" align="right">
                <td id="budgetContainerDummyTd"/>
                <td id="lineTableBudgetTd" align="right" width="270px">
                  <span style="font-weight:bold;">
                    <xsl:text>Toplam Masraf</xsl:text>
                  </span>
                </td>
                <td id="lineTableBudgetTd" style="width:81px; " align="right">
                  <span>
                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                      <xsl:if test="cbc:DocumentType = &apos;{color:#ff0000}CHARGETOTALAMOUNT{color}&apos;">
                        <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                      </xsl:if>
                    </xsl:for-each>
                    <xsl:text> 
					 </xsl:text>
                    <xsl:if test="$var_Masraf > 0 and $var_TRY = 0">
                      <xsl:value-of select="format-number( number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount) * number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate), '###.##0,00', 'european')"/>TL
                    </xsl:if>
                    <xsl:if test="$var_Masraf > 0 and $var_TRY > 0">
                      <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount[@currencyID='TRY']"/>&#160;TL
                    </xsl:if>
                  </span>
                </td>
              </tr>
            </xsl:if>
            <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
              <xsl:choose>
                <xsl:when test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                  <tr id="budgetContainerTr" align="right">
                    <td id="budgetContainerDummyTd"/>
                    <td id="lineTableBudgetTd" width="270px" align="right">
                      <span style="font-weight:bold; ">
                        <xsl:choose>
                          <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                            <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>Hesaplanan </xsl:text>
                            <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="(cbc:Percent='')">
                          <xsl:text/>
                        </xsl:if>
                        <xsl:if test="cbc:Percent !=''">
                          <xsl:text>(%</xsl:text>
                          <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                          <xsl:text>)</xsl:text>
                        </xsl:if>
                      </span>
                    </td>
                    <td id="lineTableBudgetTd" style="width:82px; " align="right">
                      <xsl:text/>
                      <xsl:variable name="var_Percent" select="cbc:Percent"/>
                      <xsl:variable name="var_TaxTypeCode" select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                      <xsl:variable name="var_TaxName" select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                      <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                        <xsl:if test="(cbc:DocumentTypeCode = $var_TaxTypeCode)" >
                          <xsl:choose>
                            <xsl:when test="(cbc:DocumentType = $var_Percent)">
                              <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:if test="not($var_Percent) and not(cbc:DocumentType)">
                                <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                              </xsl:if>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:if>
                      </xsl:for-each>
                      <xsl:text>&#160;TL</xsl:text>
                    </td>
                  </tr>
                </xsl:when>
                <xsl:when test="cbc:Percent = 0.0000 or cbc:TaxAmount = 0">
                  <tr id="budgetContainerTr" align="right">
                    <td id="budgetContainerDummyTd"/>
                    <td id="lineTableBudgetTd" width="270px" align="right">
                      <span style="font-weight:bold; ">
                        <xsl:choose>
                          <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                            <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>Hesaplanan </xsl:text>
                            <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="(cbc:Percent='')">
                          <xsl:text/>
                        </xsl:if>
                        <xsl:if test="cbc:Percent !=''">
                          <xsl:text>(%</xsl:text>
                          <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                          <xsl:text>)</xsl:text>
                        </xsl:if>
                      </span>
                    </td>
                    <td id="lineTableBudgetTd" style="width:82px; " align="right">
                      <xsl:text>0,00 TL</xsl:text>
                    </td>
                  </tr>
                </xsl:when>
              </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
              <xsl:if test="not(cbc:TaxAmount = 0)">
                <tr id="budgetContainerTr" align="right">
                  <td id="budgetContainerDummyTd"/>
                  <td id="lineTableBudgetTd" width="270px" align="right">
                    <span style="font-weight:bold; ">
                      <xsl:choose>
                        <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                          <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>Tevkifat (</xsl:text>
                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                          <xsl:text>-</xsl:text>
                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                          <xsl:text>)</xsl:text>
                        </xsl:otherwise>
                      </xsl:choose>
                      <xsl:if test="(cbc:Percent='')">
                        <xsl:text/>
                      </xsl:if>
                      <xsl:if test="cbc:Percent !=''">
                        <xsl:text>(%</xsl:text>
                        <xsl:value-of select="format-number(cbc:Percent, '###.##0,00', 'european')"/>
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </span>
                  </td>
                  <td id="lineTableBudgetTd" style="width:82px; " align="right">
                    <xsl:text/>
                    <xsl:variable name="var_Percent" select="cbc:Percent"/>
                    <xsl:variable name="var_TaxTypeCode" select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                    <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                      <xsl:if test="cbc:DocumentTypeCode = $var_TaxTypeCode">
                        <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                      </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#160;TL</xsl:text>
                  </td>
                </tr>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
              <tr id="budgetContainerTr" align="right">
                <td id="budgetContainerDummyTd"/>
                <td id="lineTableBudgetTd"  align="right" width="270px">
                  <span style="font-weight:bold; ">
                    <xsl:text>Tevkifata Tabi İşlem Tutarı</xsl:text>
                  </span>
                </td>
                <td id="lineTableBudgetTd" style="width:82px; " align="right">
                  <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                    <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]/cbc:LineExtensionAmount) * number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate), '###.##0,00', 'european')"/>
                  </xsl:if>
                  <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                    <xsl:value-of select="format-number(sum(n1:Invoice/cac:InvoiceLine[cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:LineExtensionAmount) * number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate), '###.##0,00', 'european')"/>
                  </xsl:if>
                  <xsl:text>&#160;TL</xsl:text>
                </td>
              </tr>
              <tr id="budgetContainerTr" align="right">
                <td id="budgetContainerDummyTd"/>
                <td id="lineTableBudgetTd"  align="right" width="270px">
                  <span style="font-weight:bold; ">
                    <xsl:text>Tevkifata Tabi İşlem Üzerinden Hes. KDV</xsl:text>
                  </span>
                </td>
                <td id="lineTableBudgetTd" style="width:82px; " align="right">
                  <xsl:if test = "n1:Invoice/cac:InvoiceLine[cac:WithholdingTaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme]">
                    <xsl:value-of select="format-number(sum(n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme]/cbc:TaxableAmount) * number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate), '###.##0,00', 'european')"/>
                  </xsl:if>
                  <xsl:if test = "//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=&apos;9015&apos;">
                    <xsl:value-of select="format-number(sum(n1:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode=9015]/cbc:TaxableAmount) * number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate), '###.##0,00', 'european')"/>
                  </xsl:if>
                  <xsl:text>&#160;TL</xsl:text>
                </td>
              </tr>
            </xsl:if>
            <tr id="budgetContainerTr" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" width="270px" align="right">
                <span style="font-weight:bold;">
                  <xsl:text>Vergiler Dahil Toplam Tutar</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:82px; " align="right">
                <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                  <xsl:if test="cbc:DocumentType = 'TAXINCLUSIVEAMOUNT'">
                    <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                  </xsl:if>
                </xsl:for-each>
                <xsl:text>&#160;TL</xsl:text>
              </td>
            </tr>
            <tr id="budgetContainerTr2" align="right">
              <td id="budgetContainerDummyTd"/>
              <td id="lineTableBudgetTd" width="270px" align="right">
                <span style="font-weight:bold;">
                  <xsl:text>Ödenecek Tutar</xsl:text>
                </span>
              </td>
              <td id="lineTableBudgetTd" style="width:82px; " align="right">
                <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                  <xsl:if test="cbc:DocumentType = 'PAYABLEAMOUNT'">
                    <xsl:value-of select="format-number(cbc:ID, '###.##0,00', 'european')"/>
                  </xsl:if>
                </xsl:for-each>
                <xsl:text>&#160;TL</xsl:text>
              </td>
            </tr>
          </table>
        </xsl:if>
        <br/>
        <xsl:if test="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode='OKCBF'">
          <table border="1" id="lineTable" width="800">
            <thead>
              <tr>
                <th colspan="6">ÖKC Bilgileri</th>
              </tr>
            </thead>
            <tbody>
              <tr id="okcbfHeadTr" style="font-weight:bold;">
                <td style="width:20%">
                  <xsl:text>Fiş Numarası</xsl:text>
                </td>
                <td style="width:10%" align="center">
                  <xsl:text>Fiş Tarihi</xsl:text>
                </td>
                <td style="width:10%" align="center">
                  <xsl:text>Fiş Saati</xsl:text>
                </td>
                <td style="width:40%" align="center">
                  <xsl:text>Fiş Tipi</xsl:text>
                </td>
                <td style="width:10%" align="center">
                  <xsl:text>Z Rapor No</xsl:text>
                </td>
                <td style="width:10%" align="center">
                  <xsl:text>ÖKC Seri No</xsl:text>
                </td>
              </tr>
            </tbody>
            <xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode[text()='OKCBF']">
              <tr>
                <td style="width:20%">
                  <xsl:value-of select="../cbc:ID"/>
                </td>
                <td style="width:10%" align="center">
                  <xsl:value-of select="../cbc:IssueDate"/>
                </td>
                <td style="width:10%" align="center">
                  <xsl:value-of select="substring(../cac:ValidityPeriod/cbc:StartTime,1,5)"/>
                </td>
                <td style="width:40%" align="center">
                  <xsl:choose>
                    <xsl:when test="../cbc:DocumentDescription='AVANS'">
                      <xsl:text>Ön Tahsilat(Avans) Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='YEMEK_FIS'">
                      <xsl:text>Yemek Fişi/Kartı ile Yapılan Tahsilat Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='E-FATURA'">
                      <xsl:text>E-Fatura Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='E-FATURA_IRSALIYE'">
                      <xsl:text>İrsaliye Yerine Geçen E-Fatura Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='E-ARSIV'">
                      <xsl:text>E-Arşiv Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='E-ARSIV_IRSALIYE'">
                      <xsl:text>İrsaliye Yerine Geçen E-Arşiv Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='FATURA'">
                      <xsl:text>Faturalı Satış Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='OTOPARK'">
                      <xsl:text>Otopark Giriş Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='FATURA_TAHSILAT'">
                      <xsl:text>Fatura Tahsilat Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:when test="../cbc:DocumentDescription='FATURA_TAHSILAT_KOMISYONLU'">
                      <xsl:text>Komisyonlu Fatura Tahsilat Bilgi Fişi</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td style="width:10%" align="center">
                  <xsl:value-of select="../cac:Attachment/cac:ExternalReference/cbc:URI"/>
                </td>
                <td style="width:10%" align="center">
                  <xsl:value-of select="../cac:IssuerParty/cbc:EndpointID"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
          <br/>
        </xsl:if>
        <br/>
        <table id="notesTable" width="800" align="left" height="120">
          <tbody>
            <tr align="left">
              <td id="notesTableTd">
                <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote">
                  <b>&#160;&#160;&#160;&#160;&#160; Ödeme Notu:</b>
                  <xsl:value-of select="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote"/>
                  <br/>
                </xsl:if>
                <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                  <xsl:if test="normalize-space(cac:TaxCategory/cbc:TaxExemptionReason)">
                    <b>&#160;&#160;&#160;&#160;&#160; Vergi muafiyet sebebi:</b>
                    <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                    <br/>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
                  <b>&#160;&#160;&#160;&#160;&#160; Hesap Açıklaması:</b>
                  <xsl:value-of select="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote"/>
                  <br/>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cac:PaymentTerms/cbc:Note">
                  <b>&#160;&#160;&#160;&#160;&#160; Ödeme Koşulu:</b>
                  <xsl:value-of select="//n1:Invoice/cac:PaymentTerms/cbc:Note"/>
                  <br/>
                </xsl:if>
                <br/>
                <xsl:if test="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID='PARTYTYPE']='TAXFREE' and //n1:Invoice/cac:TaxRepresentativeParty/cac:PartyTaxScheme/cbc:ExemptionReasonCode">
                  <b>&#160;&#160;&#160;&#160;&#160; VAT OFF - NO CASH REFUND </b>
                </xsl:if>
                <br/>
                <xsl:if test="//n1:Invoice/cbc:Note">
                  <b>&#160;&#160;&#160;&#160;&#160; Genel Açıklamalar</b>
                  <br/>
                  <xsl:for-each select="//n1:Invoice/cbc:Note">
                    <b>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</b>
                    <xsl:value-of select="."/>
                    <br/>
                  </xsl:for-each>
                  <p id="firmNotes"></p>
                </xsl:if>
                <br/>
                <xsl:if test="not(//n1:Invoice/cac:DespatchDocumentReference)">
                  <div style="text-align:center">İrsaliye yerine geçer.</div>
                </xsl:if>
              </td>
            </tr>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="dateFormatter">
    <xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/>
  </xsl:template>
  <xsl:template name="geneliskonto">
    <xsl:choose>
      <xsl:when test="//n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = 'true'">
        <tr id="lineTableTr" >
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <xsl:choose>
            <xsl:when test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="left">
                <span>
                  <table border="0">
                    <tbody>
                      <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                        <tr>
                          <td>
                            <xsl:text>&#160;&#160;&#160;&#160;&#160;</xsl:text>
                            <span style="font-size:8px;">
                              <b>
                                <xsl:text>İndirim</xsl:text>
                              </b>
                            </span>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </span>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="left">
                <span>
                  <table border="0" align="left">
                    <tbody>
                      <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                        <xsl:if test="./cbc:ChargeIndicator='true'">
                        <tr>
                          <td>
                            <span style="font-size:8px;">
                              <b>
                                <xsl:text>İndirim</xsl:text>
                              </b>
                            </span>
                          </td>
                        </tr>
                        </xsl:if>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
            </xsl:otherwise>
          </xsl:choose>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS'">
            <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- KUNYE-->
              </span>
            </td>
          </xsl:if>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and //n1:Invoice/cbc:InvoiceTypeCode = 'SATIS'">
            <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- VKN-->
              </span>
            </td>
            <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- UNVAN-->
              </span>
            </td>
          </xsl:if>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <table border="0">
                <tbody>
                  <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                    <xsl:if test="./cbc:ChargeIndicator='true'">
                      <tr>
                        <td align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:choose>
                                <xsl:when test="normalize-space(./cbc:MultiplierFactorNumeric)">
                                  <xsl:text>%</xsl:text>
                                  <xsl:value-of select="format-number(./cbc:MultiplierFactorNumeric*100, '###.##0,00', 'european')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text>%0,00</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <table border="0" align="right">
                <tbody>
                  <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                    <xsl:if test="./cbc:ChargeIndicator='true'">
                      <tr>
                        <td align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:value-of select="format-number(cbc:Amount, '###.##0,00', 'european')"/>
                              <xsl:if test="cbc:Amount/@currencyID">
                                <xsl:text/>
                                <xsl:if test="cbc:Amount/@currencyID = 'TRY'">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="cbc:Amount/@currencyID != 'TRY'">
                                  <xsl:value-of select="cbc:Amount/@currencyID"/>
                                </xsl:if>
                              </xsl:if>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <xsl:choose>
            <xsl:when test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
                <span>
                  <xsl:text>&#160;</xsl:text>
                </span>
              </td>
            </xsl:otherwise>
          </xsl:choose>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="//n1:Invoice"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="//n1:Invoice/cac:InvoiceLine">
    <tr id="lineTableTr" valign="top">
      <xsl:choose>
        <xsl:when test="./cac:AllowanceCharge">
          <td id="lineTableTd">
            <table border="0">
              <tbody>
                <tr>
                  <td>
                    <xsl:value-of select="./cbc:ID"/>
                  </td>
                </tr>
                <xsl:for-each select="cac:AllowanceCharge">
                  <tr>
                    <td>
                      <xsl:text>&#160;</xsl:text>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </td>
          <xsl:choose>
            <xsl:when test="../cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd" style="width:5%"  align="center">
                <table border="0">
                  <tbody>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Name)">
                      <tr>
                        <td>
                          <span>
                            <xsl:value-of select="./cac:Item/cbc:Name"/>
                          </span>
                        </td>
                        <td>
                          <xsl:text>&#160;</xsl:text>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Description)">
                      <tr>
                        <td>
                          <span>
                            <xsl:choose>
                              <xsl:when test="./cac:Item/cbc:Description">
                                <xsl:value-of select="./cac:Item/cbc:Description" />
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:text>&#160;</xsl:text>
                              </xsl:otherwise>
                            </xsl:choose>
                          </span>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td>
                          <span>
                            <b>
                              <xsl:text>İndirim</xsl:text>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd">
                <table border="0">
                  <tbody>
                    <tr>
                      <td>
                        <span>
                          <xsl:value-of select="./cac:Item/cbc:Name"/>
                        </span>
                      </td>
                    </tr>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td>
                          <b>
                            <xsl:text>İndirim</xsl:text>
                          </b>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
              <td id="lineTableTd">
                <table border="0">
                  <tbody>
                    <tr>
                      <td>
                        <span>
                          <xsl:choose>
                            <xsl:when test="./cac:Item/cbc:Description">
                              <xsl:value-of select="./cac:Item/cbc:Description" />
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text>&#160;&#160;&#160;</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                        </span>
                      </td>
                    </tr>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td>
                          <span>
                            <b>
                              <xsl:text>&#160;</xsl:text>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:otherwise>
          </xsl:choose>
          <td id="lineTableTd">
            <table border="0">
              <tbody>
                <tr>
                  <td>
                    <xsl:for-each select="./cbc:Note">
                      <span>
                        <xsl:value-of select="."/>
                      </span>
                      <br/>
                    </xsl:for-each>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS'">
            <td id="lineTableTd">
              <span>
                <xsl:value-of select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID[@schemeID='KUNYENO']"/>
              </span>
            </td>
          </xsl:if>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and //n1:Invoice/cbc:InvoiceTypeCode = 'SATIS'">
            <td id="lineTableTd">
              <span>
                <xsl:value-of select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID[@schemeID='MALSAHIBIVKNTCKN']"/>
              </span>
            </td>
            <td id="lineTableTd">
              <span>
                <xsl:value-of select="./cac:Item/cac:AdditionalItemIdentification/cbc:ID[@schemeID='MALSAHIBIADSOYADUNVAN']"/>
              </span>
            </td>
          </xsl:if>
          <td id="lineTableTd" align="right">
            <table border="0" width="100%">
              <tbody>
                <tr>
                  <td align="right">
                    <span>
                      <xsl:call-template name="Tmp_Quantity" />
                      <xsl:text>&#160;</xsl:text>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td id="lineTableTd" align="right">
            <table border="0">
              <tbody>
                <tr>
                  <td align="right">
                    <span>
                      <xsl:text>&#160;</xsl:text>
                      <xsl:value-of select="format-number(./cac:Price/cbc:PriceAmount, '###.##0,0000####', 'european')"/>
                      <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID">
                        <xsl:text/>
                        <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID = &quot;TRY&quot;">
                          <xsl:text>TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID != &quot;TRY&quot;">
                          <xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID"/>
                        </xsl:if>
                      </xsl:if>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <xsl:choose>
            <xsl:when test="../cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd" align="center">
                <table border="0">
                  <tbody>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Name)">
                      <tr>
                        <td>
                          <xsl:text>&#160;</xsl:text>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Description)">
                      <tr>
                        <td>
                          <xsl:text>&#160;</xsl:text>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:text>%</xsl:text>
                              <xsl:value-of select="format-number(./cbc:MultiplierFactorNumeric*100, '###.##0,00', 'european')"/>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd" align="right">
                <table border="0" width="100%">
                  <tbody>
                    <tr>
                      <td>
                        <xsl:text>&#160;</xsl:text>
                      </td>
                    </tr>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:text>%</xsl:text>
                              <xsl:value-of select="format-number(./cbc:MultiplierFactorNumeric*100, '###.##0,00', 'european')"/>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="../cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd" align="center">
                <table border="0">
                  <tbody>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Name)">
                      <tr>
                        <td>
                          <xsl:text>&#160;</xsl:text>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="normalize-space(./cac:Item/cbc:Description)">
                      <tr>
                        <td>
                          <td>
                            <xsl:text>&#160;</xsl:text>
                          </td>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td  align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:value-of select="format-number(./cbc:Amount, '###.##0,00', 'european')"/>
                              <xsl:if test="./cbc:Amount/@currencyID">
                                <xsl:text/>
                                <xsl:if test="./cbc:Amount/@currencyID = 'TRY'">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cbc:Amount/@currencyID != 'TRY'">
                                  <xsl:value-of select="./cbc:Amount/@currencyID"/>
                                </xsl:if>
                              </xsl:if>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd" align="right">
                <table border="0" width="100%">
                  <tbody>
                    <tr>
                      <td>
                        <xsl:text>&#160;</xsl:text>
                      </td>
                    </tr>
                    <xsl:for-each select="cac:AllowanceCharge">
                      <tr>
                        <td  align="right">
                          <span style="font-size:8px;">
                            <b>
                              <xsl:value-of select="format-number(./cbc:Amount, '###.##0,00', 'european')"/>
                              <xsl:if test="./cbc:Amount/@currencyID">
                                <xsl:text/>
                                <xsl:if test="./cbc:Amount/@currencyID = 'TRY'">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cbc:Amount/@currencyID != 'TRY'">
                                  <xsl:value-of select="./cbc:Amount/@currencyID"/>
                                </xsl:if>
                              </xsl:if>
                            </b>
                          </span>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </td>
            </xsl:otherwise>
          </xsl:choose>
          <td id="lineTableTd" align="right">
            <table border="0" width="100%">
              <tbody>
                <tr>
                  <td align="right">
                    <span>
                      <xsl:text>&#160;</xsl:text>
                      <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                        <xsl:if test="cbc:TaxTypeCode='0015' ">
                          <xsl:text/>
                          <xsl:if test="../../cbc:Percent">
                            <xsl:text> %</xsl:text>
                            <xsl:value-of select="format-number(../../cbc:Percent, '###.##0,00', 'european')" />
                          </xsl:if>
                        </xsl:if>
                      </xsl:for-each>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td id="lineTableTd" align="right">
            <table border="0" width="100%">
              <tbody>
                <tr>
                  <td  align="right">
                    <span>
                      <xsl:text>&#160;</xsl:text>
                      <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                        <xsl:if test="cbc:TaxTypeCode='0015' ">
                          <xsl:text/>
                          <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                          <xsl:if test="../../cbc:TaxAmount/@currencyID">
                            <xsl:text/>
                            <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                              <xsl:text>TL</xsl:text>
                            </xsl:if>
                            <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                              <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                            </xsl:if>
                          </xsl:if>
                        </xsl:if>
                      </xsl:for-each>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <xsl:if test="../cbc:ProfileID != 'IHRACAT'">
            <td id="lineTableTd" align="left">
              <table border="0" width="100%">
                <tbody>
                  <xsl:if test="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme and ./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode!='0015'">
                    <tr>
                      <td align="left">
                        <span>
                          <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode!='0015' ">
                              <xsl:text> (</xsl:text>
                              <xsl:value-of select="cbc:Name"/>
                              <xsl:text>)</xsl:text>
                              <xsl:if test="../../cbc:Percent">
                                <xsl:text> (%</xsl:text>
                                <xsl:value-of select="format-number(../../cbc:Percent, '###.##0,00', 'european')"/>
                                <xsl:text>)=</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                              <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                <xsl:text/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                                  <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                </xsl:if>
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </span>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:for-each select="./cac:WithholdingTaxTotal/cac:TaxSubtotal">
                    <xsl:if test="not(cbc:TaxAmount = 0)">
                      <tr>
                        <td  align="left">
                          <xsl:choose>
                            <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                              <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text>Tevkifat (</xsl:text>
                              <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                              <xsl:text>-</xsl:text>
                              <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                              <xsl:text>)</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:if test="cbc:Percent !=''">
                            <xsl:text>(%</xsl:text>
                            <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                            <xsl:text>)= </xsl:text>
                          </xsl:if>
                          <xsl:value-of select="format-number(../cbc:TaxAmount, '###.##0,00', 'european')"/>
                          <xsl:if test="../cbc:TaxAmount/@currencyID">
                            <xsl:if test="../cbc:TaxAmount/@currencyID = 'TRY'">
                              <xsl:text>TL</xsl:text>
                            </xsl:if>
                            <xsl:if test="../cbc:TaxAmount/@currencyID != 'TRY'">
                              <xsl:value-of select="../cbc:TaxAmount/@currencyID"/>
                            </xsl:if>
                          </xsl:if>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </td>
            <td id="lineTableTd">
              <table border="0" width="100%">
                <tbody>
                  <tr>
                    <td>
                      <span>
                        <xsl:if test="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason">
                          <xsl:value-of select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason"/>
                        </xsl:if>
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </xsl:if>
          <td id="lineTableTd" align="right">
            <table border="0" width="100%">
              <tbody>
                <tr>
                  <td align="right">
                    <span>
                      <xsl:text>&#160;</xsl:text>
                      <xsl:value-of select="format-number(./cbc:LineExtensionAmount, '###.##0,00', 'european')"/>
                      <xsl:if test="./cbc:LineExtensionAmount/@currencyID">
                        <xsl:text/>
                        <xsl:if test="./cbc:LineExtensionAmount/@currencyID = 'TRY'">
                          <xsl:text>TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="./cbc:LineExtensionAmount/@currencyID != 'TRY'">
                          <xsl:value-of select="./cbc:LineExtensionAmount/@currencyID"/>
                        </xsl:if>
                      </xsl:if>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
          <xsl:if test="../cbc:ProfileID='IHRACAT'">
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                <xsl:text>&#160;</xsl:text>
                <xsl:call-template name="Packaging">
                  <xsl:with-param name="PackagingType">
                    <xsl:value-of select="."/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                <xsl:text>&#160;</xsl:text>
                <xsl:call-template name="TransportMode">
                  <xsl:with-param name="TransportModeType">
                    <xsl:value-of select="."/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <td id="lineTableTd">
            <span>
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="./cbc:ID"/>
            </span>
          </td>
          <xsl:choose>
            <xsl:when test="../cbc:ProfileID='IHRACAT'">
              <td id="lineTableTd">
                <span>
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="./cac:Item/cbc:Name"/>
                </span>
                <br/>
                <span>
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="./cac:Item/cbc:Description"/>
                </span>
              </td>
            </xsl:when>
            <xsl:otherwise>
              <td id="lineTableTd">
                <span>
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="./cac:Item/cbc:Name"/>
                </span>
              </td>
              <td id="lineTableTd">
                <span>
                  <xsl:text>&#160;</xsl:text>
                  <xsl:value-of select="./cac:Item/cbc:Description"/>
                </span>
              </td>
            </xsl:otherwise>
          </xsl:choose>
          <td id="lineTableTd">
            <xsl:for-each select="./cbc:Note">
              <span>
                <xsl:text>&#160;</xsl:text>
                <xsl:value-of select="."/>
              </span>
              <br/>
            </xsl:for-each>
          </td>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS'">
            <td id="lineTableTd">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- KUNYE NO -->
                <xsl:for-each select="./cac:Item/cac:AdditionalItemIdentification">
                  <xsl:if test="cbc:ID/@schemeID = 'KUNYENO'">
                    <xsl:value-of select="cbc:ID"/>
                  </xsl:if>
                </xsl:for-each>
              </span>
            </td>
          </xsl:if>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and //n1:Invoice/cbc:InvoiceTypeCode = 'SATIS'">
            <td id="lineTableTd">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- MALSAHIBIVKNTCKN -->
                <xsl:for-each select="./cac:Item/cac:AdditionalItemIdentification">
                  <xsl:if test="cbc:ID/@schemeID = 'MALSAHIBIVKNTCKN'">
                    <xsl:value-of select="cbc:ID"/>
                  </xsl:if>
                </xsl:for-each>
              </span>
            </td>
            <td id="lineTableTd">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!-- MALSAHIBIADSOYADUNVAN NO -->
                <xsl:for-each select="./cac:Item/cac:AdditionalItemIdentification">
                  <xsl:if test="cbc:ID/@schemeID = 'MALSAHIBIADSOYADUNVAN'">
                    <xsl:value-of select="cbc:ID"/>
                  </xsl:if>
                </xsl:for-each>
              </span>
            </td>
          </xsl:if>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:call-template name="Tmp_Quantity" />
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="format-number(./cac:Price/cbc:PriceAmount, '###.##0,0000####', 'european')"/>
              <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID">
                <xsl:text/>
                <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID = &quot;TRY&quot;">
                  <xsl:text>TL</xsl:text>
                </xsl:if>
                <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID != &quot;TRY&quot;">
                  <xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID"/>
                </xsl:if>
              </xsl:if>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                <xsl:if test="cbc:TaxTypeCode='0015' ">
                  <xsl:text/>
                  <xsl:if test="../../cbc:Percent">
                    <xsl:text> %</xsl:text>
                    <xsl:value-of select="format-number(../../cbc:Percent, '###.##0,00', 'european')" />
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                <xsl:if test="cbc:TaxTypeCode='0015' ">
                  <xsl:text/>
                  <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                  <xsl:if test="../../cbc:TaxAmount/@currencyID">
                    <xsl:text/>
                    <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                      <xsl:text>TL</xsl:text>
                      <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                    <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                      <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                      <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
            </span>
          </td>
          <xsl:if test="../cbc:ProfileID != 'IHRACAT'">
            <td id="lineTableTd" align="left">
              <table border="0" width="100%">
                <tbody>
                  <xsl:if test="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme and ./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode!='0015'">
                    <tr>
                      <td align="left">
                        <span>
                          <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode!='0015' ">
                              <xsl:text> (</xsl:text>
                              <xsl:value-of select="cbc:Name"/>
                              <xsl:text>)</xsl:text>
                              <xsl:if test="../../cbc:Percent">
                                <xsl:text> (%</xsl:text>
                                <xsl:value-of select="format-number(../../cbc:Percent, '###.##0,00', 'european')"/>
                                <xsl:text>)=</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="format-number(../../cbc:TaxAmount, '###.##0,00', 'european')"/>
                              <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                <xsl:text/>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID = 'TRY'">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID != 'TRY'">
                                  <xsl:value-of select="../../cbc:TaxAmount/@currencyID"/>
                                </xsl:if>
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </span>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:for-each select="./cac:WithholdingTaxTotal/cac:TaxSubtotal">
                    <xsl:if test="not(cbc:TaxAmount = 0)">
                      <tr>
                        <td  align="left">
                          <xsl:choose>
                            <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=''">
                              <xsl:text>Diğer Vergiler Toplamı </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text>Tevkifat (</xsl:text>
                              <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                              <xsl:text>-</xsl:text>
                              <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name"/>
                              <xsl:text>)</xsl:text>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:if test="cbc:Percent !=''">
                            <xsl:text>(%</xsl:text>
                            <xsl:value-of select=" format-number(cbc:Percent, '###.##0,00', 'european')"/>
                            <xsl:text>)= </xsl:text>
                          </xsl:if>
                          <xsl:value-of select="format-number(../cbc:TaxAmount, '###.##0,00', 'european')"/>
                          <xsl:if test="../cbc:TaxAmount/@currencyID">
                            <xsl:if test="../cbc:TaxAmount/@currencyID = 'TRY'">
                              <xsl:text>TL</xsl:text>
                            </xsl:if>
                            <xsl:if test="../cbc:TaxAmount/@currencyID != 'TRY'">
                              <xsl:value-of select="../cbc:TaxAmount/@currencyID"/>
                            </xsl:if>
                          </xsl:if>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </td>
            <td id="lineTableTd">
              <span>
                <xsl:if test="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason">
                  <xsl:value-of select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason"/>
                </xsl:if>
              </span>
            </td>
          </xsl:if>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:value-of select="format-number(./cbc:LineExtensionAmount, '###.##0,00', 'european')"/>
              <xsl:if test="./cbc:LineExtensionAmount/@currencyID">
                <xsl:text/>
                <xsl:if test="./cbc:LineExtensionAmount/@currencyID = 'TRY' ">
                  <xsl:text>TL</xsl:text>
                  <xsl:text>&#160;</xsl:text>
                </xsl:if>
                <xsl:if test="./cbc:LineExtensionAmount/@currencyID != 'TRY'">
                  <xsl:value-of select="./cbc:LineExtensionAmount/@currencyID"/>
                  <xsl:text>&#160;</xsl:text>
                </xsl:if>
              </xsl:if>
            </span>
          </td>
          <xsl:if test="../cbc:ProfileID='IHRACAT'">
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID='INCOTERMS']">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode">
                <xsl:text>&#160;</xsl:text>
                <xsl:call-template name="Packaging">
                  <xsl:with-param name="PackagingType">
                    <xsl:value-of select="."/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:DeliveryAddress">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode">
                <xsl:text>&#160;</xsl:text>
                <xsl:call-template name="TransportMode">
                  <xsl:with-param name="TransportModeType">
                    <xsl:value-of select="."/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
            </td>
            <td class="lineTableTd" align="right">
              <xsl:text>&#160;</xsl:text>
              <xsl:for-each select="cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID">
                <xsl:text>&#160;</xsl:text>
                <xsl:apply-templates/>
              </xsl:for-each>
            </td>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>
  <xsl:template match="//n1:Invoice">
    <tr id="lineTableTr">
      <td id="lineTableTd">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <xsl:choose>
        <xsl:when test="cbc:ProfileID='IHRACAT'">
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
        </xsl:when>
        <xsl:otherwise>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS'">
            <td id="lineTableTd" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!--KUNYE -->
              </span>
            </td>
          </xsl:if>
          <xsl:if test="//n1:Invoice/cbc:ProfileID ='HKS' and //n1:Invoice/cbc:InvoiceTypeCode = 'SATIS'">
            <td id="lineTableTd" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!--VKN -->
              </span>
            </td>
            <td id="lineTableTd" align="right">
              <span>
                <xsl:text>&#160;</xsl:text>
                <!--UNVAN -->
              </span>
            </td>
          </xsl:if>
          <td id="lineTableTd" align="right">
            <span>
              <xsl:text>&#160;</xsl:text>
            </span>
          </td>
        </xsl:otherwise>
      </xsl:choose>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <xsl:if test="//n1:Invoice/cbc:ProfileID='IHRACAT'">
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
        <td class="lineTableTd" align="right">
          <xsl:text>&#160;</xsl:text>
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  <xsl:template name="Party_Title" >
    <xsl:param name="PartyType" />
    <td style="width:469px; " align="left">
      <xsl:if test="cac:PartyName">
        <xsl:value-of select="cac:PartyName/cbc:Name"/>
        <br/>
      </xsl:if>
      <xsl:for-each select="cac:Person">
        <xsl:for-each select="cbc:Title">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:FirstName">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:MiddleName">
          <xsl:apply-templates/>
          <xsl:text>&#160; </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:FamilyName">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:NameSuffix">
          <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:if test="$PartyType='TAXFREE'">
          <br/>
          <xsl:text>Pasaport No: </xsl:text>
          <xsl:value-of select="cac:IdentityDocumentReference/cbc:ID"/>
          <br/>
          <xsl:text>&#220;lkesi: </xsl:text>
          <xsl:for-each select="cbc:NationalityID">
            <xsl:call-template name="Country">
              <xsl:with-param name="CountryType">
                <xsl:value-of select="."/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  <xsl:template name="Party_Adress" >
    <xsl:param name="PartyType" />
    <td style="width:469px; " align="left">
      <xsl:for-each select="cac:PostalAddress">
        <xsl:for-each select="cbc:StreetName">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:BuildingName">
          <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:for-each select="cbc:BuildingNumber">
          <xsl:text> No:</xsl:text>
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <br/>
        <xsl:for-each select="cbc:Room">
          <xsl:text>Kapı No:</xsl:text>
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <br/>
        <xsl:for-each select="cbc:PostalZone">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:CitySubdivisionName">
          <xsl:apply-templates/>
          <xsl:text>/ </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="cbc:CityName">
          <xsl:apply-templates/>
          <xsl:text>&#160;</xsl:text>
        </xsl:for-each>
        <xsl:if test="$PartyType!='OTHER'">
          <br/>
          <xsl:value-of select="cac:Country/cbc:Name"/>
          <br/>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  <xsl:template name="Country">
    <xsl:param name="CountryType" />
    <xsl:choose>
      <xsl:when test="$CountryType='AF'">Afganistan</xsl:when>
      <xsl:when test="$CountryType='DE'">Almanya</xsl:when>
      <xsl:when test="$CountryType='AD'">Andorra</xsl:when>
      <xsl:when test="$CountryType='AO'">Angola</xsl:when>
      <xsl:when test="$CountryType='AG'">Antigua ve Barbuda</xsl:when>
      <xsl:when test="$CountryType='AR'">Arjantin</xsl:when>
      <xsl:when test="$CountryType='AL'">Arnavutluk</xsl:when>
      <xsl:when test="$CountryType='AW'">Aruba</xsl:when>
      <xsl:when test="$CountryType='AU'">Avustralya</xsl:when>
      <xsl:when test="$CountryType='AT'">Avusturya</xsl:when>
      <xsl:when test="$CountryType='AZ'">Azerbaycan</xsl:when>
      <xsl:when test="$CountryType='BS'">Bahamalar</xsl:when>
      <xsl:when test="$CountryType='BH'">Bahreyn</xsl:when>
      <xsl:when test="$CountryType='BD'">Bangladeş</xsl:when>
      <xsl:when test="$CountryType='BB'">Barbados</xsl:when>
      <xsl:when test="$CountryType='EH'">Batı Sahra (MA)</xsl:when>
      <xsl:when test="$CountryType='BE'">Belçika</xsl:when>
      <xsl:when test="$CountryType='BZ'">Belize</xsl:when>
      <xsl:when test="$CountryType='BJ'">Benin</xsl:when>
      <xsl:when test="$CountryType='BM'">Bermuda</xsl:when>
      <xsl:when test="$CountryType='BY'">Beyaz Rusya</xsl:when>
      <xsl:when test="$CountryType='BT'">Bhutan</xsl:when>
      <xsl:when test="$CountryType='AE'">Birleşik Arap Emirlikleri</xsl:when>
      <xsl:when test="$CountryType='US'">Birleşik Devletler</xsl:when>
      <xsl:when test="$CountryType='GB'">Birleşik Krallık</xsl:when>
      <xsl:when test="$CountryType='BO'">Bolivya</xsl:when>
      <xsl:when test="$CountryType='BA'">Bosna-Hersek</xsl:when>
      <xsl:when test="$CountryType='BW'">Botsvana</xsl:when>
      <xsl:when test="$CountryType='BR'">Brezilya</xsl:when>
      <xsl:when test="$CountryType='BN'">Bruney</xsl:when>
      <xsl:when test="$CountryType='BG'">Bulgaristan</xsl:when>
      <xsl:when test="$CountryType='BF'">Burkina Faso</xsl:when>
      <xsl:when test="$CountryType='BI'">Burundi</xsl:when>
      <xsl:when test="$CountryType='TD'">Çad</xsl:when>
      <xsl:when test="$CountryType='KY'">Cayman Adaları</xsl:when>
      <xsl:when test="$CountryType='GI'">Cebelitarık (GB)</xsl:when>
      <xsl:when test="$CountryType='CZ'">Çek Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='DZ'">Cezayir</xsl:when>
      <xsl:when test="$CountryType='DJ'">Cibuti</xsl:when>
      <xsl:when test="$CountryType='CN'">Çin</xsl:when>
      <xsl:when test="$CountryType='DK'">Danimarka</xsl:when>
      <xsl:when test="$CountryType='CD'">Demokratik Kongo Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='TL'">Doğu Timor</xsl:when>
      <xsl:when test="$CountryType='DO'">Dominik Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='DM'">Dominika</xsl:when>
      <xsl:when test="$CountryType='EC'">Ekvador</xsl:when>
      <xsl:when test="$CountryType='GQ'">Ekvator Ginesi</xsl:when>
      <xsl:when test="$CountryType='SV'">El Salvador</xsl:when>
      <xsl:when test="$CountryType='ID'">Endonezya</xsl:when>
      <xsl:when test="$CountryType='ER'">Eritre</xsl:when>
      <xsl:when test="$CountryType='AM'">Ermenistan</xsl:when>
      <xsl:when test="$CountryType='MF'">Ermiş Martin (FR)</xsl:when>
      <xsl:when test="$CountryType='EE'">Estonya</xsl:when>
      <xsl:when test="$CountryType='ET'">Etiyopya</xsl:when>
      <xsl:when test="$CountryType='FK'">Falkland Adaları</xsl:when>
      <xsl:when test="$CountryType='FO'">Faroe Adaları (DK)</xsl:when>
      <xsl:when test="$CountryType='MA'">Fas</xsl:when>
      <xsl:when test="$CountryType='FJ'">Fiji</xsl:when>
      <xsl:when test="$CountryType='CI'">Fildişi Sahili</xsl:when>
      <xsl:when test="$CountryType='PH'">Filipinler</xsl:when>
      <xsl:when test="$CountryType='FI'">Finlandiya</xsl:when>
      <xsl:when test="$CountryType='FR'">Fransa</xsl:when>
      <xsl:when test="$CountryType='GF'">Fransız Guyanası (FR)</xsl:when>
      <xsl:when test="$CountryType='PF'">Fransız Polinezyası (FR)</xsl:when>
      <xsl:when test="$CountryType='GA'">Gabon</xsl:when>
      <xsl:when test="$CountryType='GM'">Gambiya</xsl:when>
      <xsl:when test="$CountryType='GH'">Gana</xsl:when>
      <xsl:when test="$CountryType='GN'">Gine</xsl:when>
      <xsl:when test="$CountryType='GW'">Gine Bissau</xsl:when>
      <xsl:when test="$CountryType='GD'">Grenada</xsl:when>
      <xsl:when test="$CountryType='GL'">Grönland (DK)</xsl:when>
      <xsl:when test="$CountryType='GP'">Guadeloupe (FR)</xsl:when>
      <xsl:when test="$CountryType='GT'">Guatemala</xsl:when>
      <xsl:when test="$CountryType='GG'">Guernsey (GB)</xsl:when>
      <xsl:when test="$CountryType='ZA'">Güney Afrika</xsl:when>
      <xsl:when test="$CountryType='KR'">Güney Kore</xsl:when>
      <xsl:when test="$CountryType='GE'">Gürcistan</xsl:when>
      <xsl:when test="$CountryType='GY'">Guyana</xsl:when>
      <xsl:when test="$CountryType='HT'">Haiti</xsl:when>
      <xsl:when test="$CountryType='IN'">Hindistan</xsl:when>
      <xsl:when test="$CountryType='HR'">Hırvatistan</xsl:when>
      <xsl:when test="$CountryType='NL'">Hollanda</xsl:when>
      <xsl:when test="$CountryType='HN'">Honduras</xsl:when>
      <xsl:when test="$CountryType='HK'">Hong Kong (CN)</xsl:when>
      <xsl:when test="$CountryType='VG'">İngiliz Virjin Adaları</xsl:when>
      <xsl:when test="$CountryType='IQ'">Irak</xsl:when>
      <xsl:when test="$CountryType='IR'">İran</xsl:when>
      <xsl:when test="$CountryType='IE'">İrlanda</xsl:when>
      <xsl:when test="$CountryType='ES'">İspanya</xsl:when>
      <xsl:when test="$CountryType='IL'">İsrail</xsl:when>
      <xsl:when test="$CountryType='SE'">İsveç</xsl:when>
      <xsl:when test="$CountryType='CH'">İsviçre</xsl:when>
      <xsl:when test="$CountryType='IT'">İtalya</xsl:when>
      <xsl:when test="$CountryType='IS'">İzlanda</xsl:when>
      <xsl:when test="$CountryType='JM'">Jamaika</xsl:when>
      <xsl:when test="$CountryType='JP'">Japonya</xsl:when>
      <xsl:when test="$CountryType='JE'">Jersey (GB)</xsl:when>
      <xsl:when test="$CountryType='KH'">Kamboçya</xsl:when>
      <xsl:when test="$CountryType='CM'">Kamerun</xsl:when>
      <xsl:when test="$CountryType='CA'">Kanada</xsl:when>
      <xsl:when test="$CountryType='ME'">Karadağ</xsl:when>
      <xsl:when test="$CountryType='QA'">Katar</xsl:when>
      <xsl:when test="$CountryType='KZ'">Kazakistan</xsl:when>
      <xsl:when test="$CountryType='KE'">Kenya</xsl:when>
      <xsl:when test="$CountryType='CY'">Kıbrıs</xsl:when>
      <xsl:when test="$CountryType='KG'">Kırgızistan</xsl:when>
      <xsl:when test="$CountryType='KI'">Kiribati</xsl:when>
      <xsl:when test="$CountryType='CO'">Kolombiya</xsl:when>
      <xsl:when test="$CountryType='KM'">Komorlar</xsl:when>
      <xsl:when test="$CountryType='CG'">Kongo Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='KV'">Kosova (RS)</xsl:when>
      <xsl:when test="$CountryType='CR'">Kosta Rika</xsl:when>
      <xsl:when test="$CountryType='CU'">Küba</xsl:when>
      <xsl:when test="$CountryType='KW'">Kuveyt</xsl:when>
      <xsl:when test="$CountryType='KP'">Kuzey Kore</xsl:when>
      <xsl:when test="$CountryType='LA'">Laos</xsl:when>
      <xsl:when test="$CountryType='LS'">Lesoto</xsl:when>
      <xsl:when test="$CountryType='LV'">Letonya</xsl:when>
      <xsl:when test="$CountryType='LR'">Liberya</xsl:when>
      <xsl:when test="$CountryType='LY'">Libya</xsl:when>
      <xsl:when test="$CountryType='LI'">Lihtenştayn</xsl:when>
      <xsl:when test="$CountryType='LT'">Litvanya</xsl:when>
      <xsl:when test="$CountryType='LB'">Lübnan</xsl:when>
      <xsl:when test="$CountryType='LU'">Lüksemburg</xsl:when>
      <xsl:when test="$CountryType='HU'">Macaristan</xsl:when>
      <xsl:when test="$CountryType='MG'">Madagaskar</xsl:when>
      <xsl:when test="$CountryType='MO'">Makao (CN)</xsl:when>
      <xsl:when test="$CountryType='MK'">Makedonya</xsl:when>
      <xsl:when test="$CountryType='MW'">Malavi</xsl:when>
      <xsl:when test="$CountryType='MV'">Maldivler</xsl:when>
      <xsl:when test="$CountryType='MY'">Malezya</xsl:when>
      <xsl:when test="$CountryType='ML'">Mali</xsl:when>
      <xsl:when test="$CountryType='MT'">Malta</xsl:when>
      <xsl:when test="$CountryType='IM'">Man Adası (GB)</xsl:when>
      <xsl:when test="$CountryType='MH'">Marshall Adaları</xsl:when>
      <xsl:when test="$CountryType='MQ'">Martinique (FR)</xsl:when>
      <xsl:when test="$CountryType='MU'">Mauritius</xsl:when>
      <xsl:when test="$CountryType='YT'">Mayotte (FR)</xsl:when>
      <xsl:when test="$CountryType='MX'">Meksika</xsl:when>
      <xsl:when test="$CountryType='FM'">Mikronezya</xsl:when>
      <xsl:when test="$CountryType='EG'">Mısır</xsl:when>
      <xsl:when test="$CountryType='MN'">Moğolistan</xsl:when>
      <xsl:when test="$CountryType='MD'">Moldova</xsl:when>
      <xsl:when test="$CountryType='MC'">Monako</xsl:when>
      <xsl:when test="$CountryType='MR'">Moritanya</xsl:when>
      <xsl:when test="$CountryType='MZ'">Mozambik</xsl:when>
      <xsl:when test="$CountryType='MM'">Myanmar</xsl:when>
      <xsl:when test="$CountryType='NA'">Namibya</xsl:when>
      <xsl:when test="$CountryType='NR'">Nauru</xsl:when>
      <xsl:when test="$CountryType='NP'">Nepal</xsl:when>
      <xsl:when test="$CountryType='NE'">Nijer</xsl:when>
      <xsl:when test="$CountryType='NG'">Nijerya</xsl:when>
      <xsl:when test="$CountryType='NI'">Nikaragua</xsl:when>
      <xsl:when test="$CountryType='NO'">Norveç</xsl:when>
      <xsl:when test="$CountryType='CF'">Orta Afrika Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='UZ'">Özbekistan</xsl:when>
      <xsl:when test="$CountryType='PK'">Pakistan</xsl:when>
      <xsl:when test="$CountryType='PW'">Palau</xsl:when>
      <xsl:when test="$CountryType='PA'">Panama</xsl:when>
      <xsl:when test="$CountryType='PG'">Papua Yeni Gine</xsl:when>
      <xsl:when test="$CountryType='PY'">Paraguay</xsl:when>
      <xsl:when test="$CountryType='PE'">Peru</xsl:when>
      <xsl:when test="$CountryType='PL'">Polonya</xsl:when>
      <xsl:when test="$CountryType='PT'">Portekiz</xsl:when>
      <xsl:when test="$CountryType='PR'">Porto Riko (US)</xsl:when>
      <xsl:when test="$CountryType='RE'">Réunion (FR)</xsl:when>
      <xsl:when test="$CountryType='RO'">Romanya</xsl:when>
      <xsl:when test="$CountryType='RW'">Ruanda</xsl:when>
      <xsl:when test="$CountryType='RU'">Rusya</xsl:when>
      <xsl:when test="$CountryType='BL'">Saint Barthélemy (FR)</xsl:when>
      <xsl:when test="$CountryType='KN'">Saint Kitts ve Nevis</xsl:when>
      <xsl:when test="$CountryType='LC'">Saint Lucia</xsl:when>
      <xsl:when test="$CountryType='PM'">Saint Pierre ve Miquelon (FR)</xsl:when>
      <xsl:when test="$CountryType='VC'">Saint Vincent ve Grenadinler</xsl:when>
      <xsl:when test="$CountryType='WS'">Samoa</xsl:when>
      <xsl:when test="$CountryType='SM'">San Marino</xsl:when>
      <xsl:when test="$CountryType='ST'">São Tomé ve Príncipe</xsl:when>
      <xsl:when test="$CountryType='SN'">Senegal</xsl:when>
      <xsl:when test="$CountryType='SC'">Seyşeller</xsl:when>
      <xsl:when test="$CountryType='SL'">Sierra Leone</xsl:when>
      <xsl:when test="$CountryType='CL'">Şili</xsl:when>
      <xsl:when test="$CountryType='SG'">Singapur</xsl:when>
      <xsl:when test="$CountryType='RS'">Sırbistan</xsl:when>
      <xsl:when test="$CountryType='SK'">Slovakya Cumhuriyeti</xsl:when>
      <xsl:when test="$CountryType='SI'">Slovenya</xsl:when>
      <xsl:when test="$CountryType='SB'">Solomon Adaları</xsl:when>
      <xsl:when test="$CountryType='SO'">Somali</xsl:when>
      <xsl:when test="$CountryType='SS'">South Sudan</xsl:when>
      <xsl:when test="$CountryType='SJ'">Spitsbergen (NO)</xsl:when>
      <xsl:when test="$CountryType='LK'">Sri Lanka</xsl:when>
      <xsl:when test="$CountryType='SD'">Sudan</xsl:when>
      <xsl:when test="$CountryType='SR'">Surinam</xsl:when>
      <xsl:when test="$CountryType='SY'">Suriye</xsl:when>
      <xsl:when test="$CountryType='SA'">Suudi Arabistan</xsl:when>
      <xsl:when test="$CountryType='SZ'">Svaziland</xsl:when>
      <xsl:when test="$CountryType='TJ'">Tacikistan</xsl:when>
      <xsl:when test="$CountryType='TZ'">Tanzanya</xsl:when>
      <xsl:when test="$CountryType='TH'">Tayland</xsl:when>
      <xsl:when test="$CountryType='TW'">Tayvan</xsl:when>
      <xsl:when test="$CountryType='TG'">Togo</xsl:when>
      <xsl:when test="$CountryType='TO'">Tonga</xsl:when>
      <xsl:when test="$CountryType='TT'">Trinidad ve Tobago</xsl:when>
      <xsl:when test="$CountryType='TN'">Tunus</xsl:when>
      <xsl:when test="$CountryType='TR'">Türkiye</xsl:when>
      <xsl:when test="$CountryType='TM'">Türkmenistan</xsl:when>
      <xsl:when test="$CountryType='TC'">Turks ve Caicos</xsl:when>
      <xsl:when test="$CountryType='TV'">Tuvalu</xsl:when>
      <xsl:when test="$CountryType='UG'">Uganda</xsl:when>
      <xsl:when test="$CountryType='UA'">Ukrayna</xsl:when>
      <xsl:when test="$CountryType='OM'">Umman</xsl:when>
      <xsl:when test="$CountryType='JO'">Ürdün</xsl:when>
      <xsl:when test="$CountryType='UY'">Uruguay</xsl:when>
      <xsl:when test="$CountryType='VU'">Vanuatu</xsl:when>
      <xsl:when test="$CountryType='VA'">Vatikan</xsl:when>
      <xsl:when test="$CountryType='VE'">Venezuela</xsl:when>
      <xsl:when test="$CountryType='VN'">Vietnam</xsl:when>
      <xsl:when test="$CountryType='WF'">Wallis ve Futuna (FR)</xsl:when>
      <xsl:when test="$CountryType='YE'">Yemen</xsl:when>
      <xsl:when test="$CountryType='NC'">Yeni Kaledonya (FR)</xsl:when>
      <xsl:when test="$CountryType='NZ'">Yeni Zelanda</xsl:when>
      <xsl:when test="$CountryType='CV'">Yeşil Burun Adaları</xsl:when>
      <xsl:when test="$CountryType='GR'">Yunanistan</xsl:when>
      <xsl:when test="$CountryType='ZM'">Zambiya</xsl:when>
      <xsl:when test="$CountryType='ZW'">Zimbabve</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$CountryType"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name='Party_Other'>
    <xsl:param name="PartyType" />
    <xsl:for-each select="cbc:WebsiteURI">
      <tr align="left">
        <td>
          <xsl:text>Web Sitesi: </xsl:text>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="cac:Contact/cbc:ElectronicMail">
      <tr align="left">
        <td>
          <xsl:text>E-Posta: </xsl:text>
          <xsl:value-of select="."/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="cac:Contact">
      <xsl:if test="cbc:Telephone or cbc:Telefax">
        <tr align="left">
          <td style="width:469px; " align="left">
            <xsl:for-each select="cbc:Telephone">
              <xsl:text>Tel: </xsl:text>
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:for-each select="cbc:Telefax">
              <xsl:text> Fax: </xsl:text>
              <xsl:apply-templates/>
            </xsl:for-each>
            <xsl:text>&#160;</xsl:text>
          </td>
        </tr>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="$PartyType!='TAXFREE' and $PartyType!='EXPORT'">
      <xsl:for-each select="cac:PartyTaxScheme/cac:TaxScheme/cbc:Name">
        <tr align="left">
          <td>
            <xsl:text>Vergi Dairesi: </xsl:text>
            <xsl:apply-templates/>
          </td>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="cac:PartyIdentification">
        <tr align="left">
          <td>
            <xsl:value-of select="cbc:ID/@schemeID"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="cbc:ID"/>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
  <xsl:template name="TransportMode">
    <xsl:param name="TransportModeType" />
    <xsl:choose>
      <xsl:when test="$TransportModeType=1">Denizyolu</xsl:when>
      <xsl:when test="$TransportModeType=2">Demiryolu</xsl:when>
      <xsl:when test="$TransportModeType=3">Karayolu</xsl:when>
      <xsl:when test="$TransportModeType=4">Havayolu</xsl:when>
      <xsl:when test="$TransportModeType=5">Posta</xsl:when>
      <xsl:when test="$TransportModeType=6">Çok araçlı</xsl:when>
      <xsl:when test="$TransportModeType=7">Sabit taşıma tesisleri</xsl:when>
      <xsl:when test="$TransportModeType=8">İç su taşımacılığı</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$TransportModeType"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="Packaging">
    <xsl:param name="PackagingType" />
    <xsl:choose>
      <xsl:when test="$PackagingType='1A'">Drum, steel</xsl:when>
      <xsl:when test="$PackagingType='1B'">Drum, aluminium</xsl:when>
      <xsl:when test="$PackagingType='1D'">Drum, plywood</xsl:when>
      <xsl:when test="$PackagingType='1F'">Container, flexible</xsl:when>
      <xsl:when test="$PackagingType='1G'">Drum, fibre</xsl:when>
      <xsl:when test="$PackagingType='1W'">Drum, wooden</xsl:when>
      <xsl:when test="$PackagingType='2C'">Barrel, wooden</xsl:when>
      <xsl:when test="$PackagingType='3A'">Jerrican, steel</xsl:when>
      <xsl:when test="$PackagingType='3H'">Jerrican, plastic</xsl:when>
      <xsl:when test="$PackagingType='43'">Bag, super bulk</xsl:when>
      <xsl:when test="$PackagingType='44'">Bag, polybag</xsl:when>
      <xsl:when test="$PackagingType='4A'">Box, steel</xsl:when>
      <xsl:when test="$PackagingType='4B'">Box, aluminium</xsl:when>
      <xsl:when test="$PackagingType='4C'">Box, natural wood</xsl:when>
      <xsl:when test="$PackagingType='4D'">Box, plywood</xsl:when>
      <xsl:when test="$PackagingType='4F'">Box, reconstituted wood</xsl:when>
      <xsl:when test="$PackagingType='4G'">Box, fibreboard</xsl:when>
      <xsl:when test="$PackagingType='4H'">Box, plastic</xsl:when>
      <xsl:when test="$PackagingType='5H'">Bag, woven plastic</xsl:when>
      <xsl:when test="$PackagingType='5L'">Bag, textile</xsl:when>
      <xsl:when test="$PackagingType='5M'">Bag, paper</xsl:when>
      <xsl:when test="$PackagingType='6H'">Composite packaging, plastic receptacle</xsl:when>
      <xsl:when test="$PackagingType='6P'">Composite packaging, glass receptacle</xsl:when>
      <xsl:when test="$PackagingType='7A'">Case, car</xsl:when>
      <xsl:when test="$PackagingType='7B'">Case, wooden</xsl:when>
      <xsl:when test="$PackagingType='8A'">Pallet, wooden</xsl:when>
      <xsl:when test="$PackagingType='8B'">Crate, wooden</xsl:when>
      <xsl:when test="$PackagingType='8C'">Bundle, wooden</xsl:when>
      <xsl:when test="$PackagingType='AA'">Intermediate bulk container, rigid plastic</xsl:when>
      <xsl:when test="$PackagingType='AB'">Receptacle, fibre</xsl:when>
      <xsl:when test="$PackagingType='AC'">Receptacle, paper</xsl:when>
      <xsl:when test="$PackagingType='AD'">Receptacle, wooden</xsl:when>
      <xsl:when test="$PackagingType='AE'">Aerosol</xsl:when>
      <xsl:when test="$PackagingType='AF'">Pallet, modular, collars 80cms * 60cms</xsl:when>
      <xsl:when test="$PackagingType='AG'">Pallet, shrinkwrapped</xsl:when>
      <xsl:when test="$PackagingType='AH'">Pallet, 100cms * 110cms</xsl:when>
      <xsl:when test="$PackagingType='AI'">Clamshell</xsl:when>
      <xsl:when test="$PackagingType='AJ'">Cone</xsl:when>
      <xsl:when test="$PackagingType='AL'">Ball</xsl:when>
      <xsl:when test="$PackagingType='AM'">Ampoule, non-protected</xsl:when>
      <xsl:when test="$PackagingType='AP'">Ampoule, protected</xsl:when>
      <xsl:when test="$PackagingType='AT'">Atomizer</xsl:when>
      <xsl:when test="$PackagingType='AV'">Capsule</xsl:when>
      <xsl:when test="$PackagingType='B4'">Belt</xsl:when>
      <xsl:when test="$PackagingType='BA'">Barrel</xsl:when>
      <xsl:when test="$PackagingType='BB'">Bobbin</xsl:when>
      <xsl:when test="$PackagingType='BC'">Bottlecrate / bottlerack</xsl:when>
      <xsl:when test="$PackagingType='BD'">Board</xsl:when>
      <xsl:when test="$PackagingType='BE'">Bundle</xsl:when>
      <xsl:when test="$PackagingType='BF'">Balloon, non-protected</xsl:when>
      <xsl:when test="$PackagingType='BG'">Bag</xsl:when>
      <xsl:when test="$PackagingType='BH'">Bunch</xsl:when>
      <xsl:when test="$PackagingType='BI'">Bin</xsl:when>
      <xsl:when test="$PackagingType='BJ'">Bucket</xsl:when>
      <xsl:when test="$PackagingType='BK'">Basket</xsl:when>
      <xsl:when test="$PackagingType='BL'">Bale, compressed</xsl:when>
      <xsl:when test="$PackagingType='BM'">Basin</xsl:when>
      <xsl:when test="$PackagingType='BN'">Bale, non-compressed</xsl:when>
      <xsl:when test="$PackagingType='BO'">Bottle, non-protected, cylindrical</xsl:when>
      <xsl:when test="$PackagingType='BP'">Balloon, protected</xsl:when>
      <xsl:when test="$PackagingType='BQ'">Bottle, protected cylindrical</xsl:when>
      <xsl:when test="$PackagingType='BR'">Bar</xsl:when>
      <xsl:when test="$PackagingType='BS'">Bottle, non-protected, bulbous</xsl:when>
      <xsl:when test="$PackagingType='BT'">Bolt</xsl:when>
      <xsl:when test="$PackagingType='BU'">Butt</xsl:when>
      <xsl:when test="$PackagingType='BV'">Bottle, protected bulbous</xsl:when>
      <xsl:when test="$PackagingType='BW'">Box, for liquids</xsl:when>
      <xsl:when test="$PackagingType='BX'">Box</xsl:when>
      <xsl:when test="$PackagingType='BY'">Board, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='BZ'">Bars, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='CA'">Can, rectangular</xsl:when>
      <xsl:when test="$PackagingType='CB'">Crate, beer</xsl:when>
      <xsl:when test="$PackagingType='CC'">Churn</xsl:when>
      <xsl:when test="$PackagingType='CD'">Can, with handle and spout</xsl:when>
      <xsl:when test="$PackagingType='CE'">Creel</xsl:when>
      <xsl:when test="$PackagingType='CF'">Coffer</xsl:when>
      <xsl:when test="$PackagingType='CG'">Cage</xsl:when>
      <xsl:when test="$PackagingType='CH'">Chest</xsl:when>
      <xsl:when test="$PackagingType='CI'">Canister</xsl:when>
      <xsl:when test="$PackagingType='CJ'">Coffin</xsl:when>
      <xsl:when test="$PackagingType='CK'">Cask</xsl:when>
      <xsl:when test="$PackagingType='CL'">Coil</xsl:when>
      <xsl:when test="$PackagingType='CM'">Card</xsl:when>
      <xsl:when test="$PackagingType='CN'">Container, not otherwise specified as transport equipment</xsl:when>
      <xsl:when test="$PackagingType='CO'">Carboy, non-protected</xsl:when>
      <xsl:when test="$PackagingType='CP'">Carboy, protected</xsl:when>
      <xsl:when test="$PackagingType='CQ'">Cartridge</xsl:when>
      <xsl:when test="$PackagingType='CR'">Crate</xsl:when>
      <xsl:when test="$PackagingType='CS'">Case</xsl:when>
      <xsl:when test="$PackagingType='CT'">Carton</xsl:when>
      <xsl:when test="$PackagingType='CU'">Cup</xsl:when>
      <xsl:when test="$PackagingType='CV'">Cover</xsl:when>
      <xsl:when test="$PackagingType='CW'">Cage, roll</xsl:when>
      <xsl:when test="$PackagingType='CX'">Can, cylindrical</xsl:when>
      <xsl:when test="$PackagingType='CY'">Cylinder</xsl:when>
      <xsl:when test="$PackagingType='CZ'">Canvas</xsl:when>
      <xsl:when test="$PackagingType='DA'">Crate, multiple layer, plastic</xsl:when>
      <xsl:when test="$PackagingType='DB'">Crate, multiple layer, wooden</xsl:when>
      <xsl:when test="$PackagingType='DC'">Crate, multiple layer, cardboard</xsl:when>
      <xsl:when test="$PackagingType='DG'">Cage, Commonwealth Handling Equipment Pool (CHEP)</xsl:when>
      <xsl:when test="$PackagingType='DH'">Box, Commonwealth Handling Equipment Pool (CHEP), Eurobox</xsl:when>
      <xsl:when test="$PackagingType='DI'">Drum, iron</xsl:when>
      <xsl:when test="$PackagingType='DJ'">Demijohn, non-protected</xsl:when>
      <xsl:when test="$PackagingType='DK'">Crate, bulk, cardboard</xsl:when>
      <xsl:when test="$PackagingType='DL'">Crate, bulk, plastic</xsl:when>
      <xsl:when test="$PackagingType='DM'">Crate, bulk, wooden</xsl:when>
      <xsl:when test="$PackagingType='DN'">Dispenser</xsl:when>
      <xsl:when test="$PackagingType='DP'">Demijohn, protected</xsl:when>
      <xsl:when test="$PackagingType='DR'">Drum</xsl:when>
      <xsl:when test="$PackagingType='DS'">Tray, one layer no cover, plastic</xsl:when>
      <xsl:when test="$PackagingType='DT'">Tray, one layer no cover, wooden</xsl:when>
      <xsl:when test="$PackagingType='DU'">Tray, one layer no cover, polystyrene</xsl:when>
      <xsl:when test="$PackagingType='DV'">Tray, one layer no cover, cardboard</xsl:when>
      <xsl:when test="$PackagingType='DW'">Tray, two layers no cover, plastic tray</xsl:when>
      <xsl:when test="$PackagingType='DX'">Tray, two layers no cover, wooden</xsl:when>
      <xsl:when test="$PackagingType='DY'">Tray, two layers no cover, cardboard</xsl:when>
      <xsl:when test="$PackagingType='EC'">Bag, plastic</xsl:when>
      <xsl:when test="$PackagingType='ED'">Case, with pallet base</xsl:when>
      <xsl:when test="$PackagingType='EE'">Case, with pallet base, wooden</xsl:when>
      <xsl:when test="$PackagingType='EF'">Case, with pallet base, cardboard</xsl:when>
      <xsl:when test="$PackagingType='EG'">Case, with pallet base, plastic</xsl:when>
      <xsl:when test="$PackagingType='EH'">Case, with pallet base, metal</xsl:when>
      <xsl:when test="$PackagingType='EI'">Case, isothermic</xsl:when>
      <xsl:when test="$PackagingType='EN'">Envelope</xsl:when>
      <xsl:when test="$PackagingType='FB'">Flexibag</xsl:when>
      <xsl:when test="$PackagingType='FC'">Crate, fruit</xsl:when>
      <xsl:when test="$PackagingType='FD'">Crate, framed</xsl:when>
      <xsl:when test="$PackagingType='FE'">Flexitank</xsl:when>
      <xsl:when test="$PackagingType='FI'">Firkin</xsl:when>
      <xsl:when test="$PackagingType='FL'">Flask</xsl:when>
      <xsl:when test="$PackagingType='FO'">Footlocker</xsl:when>
      <xsl:when test="$PackagingType='FP'">Filmpack</xsl:when>
      <xsl:when test="$PackagingType='FR'">Frame</xsl:when>
      <xsl:when test="$PackagingType='FT'">Foodtainer</xsl:when>
      <xsl:when test="$PackagingType='FW'">Cart, flatbed</xsl:when>
      <xsl:when test="$PackagingType='FX'">Bag, flexible container</xsl:when>
      <xsl:when test="$PackagingType='GB'">Bottle, gas</xsl:when>
      <xsl:when test="$PackagingType='GI'">Girder</xsl:when>
      <xsl:when test="$PackagingType='GL'">Container, gallon</xsl:when>
      <xsl:when test="$PackagingType='GR'">Receptacle, glass</xsl:when>
      <xsl:when test="$PackagingType='GU'">Tray, containing horizontally stacked flat items</xsl:when>
      <xsl:when test="$PackagingType='GY'">Bag, gunny</xsl:when>
      <xsl:when test="$PackagingType='GZ'">Girders, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='HA'">Basket, with handle, plastic</xsl:when>
      <xsl:when test="$PackagingType='HB'">Basket, with handle, wooden</xsl:when>
      <xsl:when test="$PackagingType='HC'">Basket, with handle, cardboard</xsl:when>
      <xsl:when test="$PackagingType='HG'">Hogshead</xsl:when>
      <xsl:when test="$PackagingType='HN'">Hanger</xsl:when>
      <xsl:when test="$PackagingType='HR'">Hamper</xsl:when>
      <xsl:when test="$PackagingType='IA'">Package, display, wooden</xsl:when>
      <xsl:when test="$PackagingType='IB'">Package, display, cardboard</xsl:when>
      <xsl:when test="$PackagingType='IC'">Package, display, plastic</xsl:when>
      <xsl:when test="$PackagingType='ID'">Package, display, metal</xsl:when>
      <xsl:when test="$PackagingType='IE'">Package, show</xsl:when>
      <xsl:when test="$PackagingType='IF'">Package, flow</xsl:when>
      <xsl:when test="$PackagingType='IG'">Package, paper wrapped</xsl:when>
      <xsl:when test="$PackagingType='IH'">Drum, plastic</xsl:when>
      <xsl:when test="$PackagingType='IK'">Package, cardboard, with bottle grip-holes</xsl:when>
      <xsl:when test="$PackagingType='IL'">Tray, rigid, lidded stackable (CEN TS 14482:2002)</xsl:when>
      <xsl:when test="$PackagingType='IN'">Ingot</xsl:when>
      <xsl:when test="$PackagingType='IZ'">Ingots, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='JB'">Bag, jumbo</xsl:when>
      <xsl:when test="$PackagingType='JC'">Jerrican, rectangular</xsl:when>
      <xsl:when test="$PackagingType='JG'">Jug</xsl:when>
      <xsl:when test="$PackagingType='JR'">Jar</xsl:when>
      <xsl:when test="$PackagingType='JT'">Jutebag</xsl:when>
      <xsl:when test="$PackagingType='JY'">Jerrican, cylindrical</xsl:when>
      <xsl:when test="$PackagingType='KG'">Keg</xsl:when>
      <xsl:when test="$PackagingType='KI'">Kit</xsl:when>
      <xsl:when test="$PackagingType='LE'">Luggage</xsl:when>
      <xsl:when test="$PackagingType='LG'">Log</xsl:when>
      <xsl:when test="$PackagingType='LT'">Lot</xsl:when>
      <xsl:when test="$PackagingType='LU'">Lug</xsl:when>
      <xsl:when test="$PackagingType='LV'">Liftvan</xsl:when>
      <xsl:when test="$PackagingType='LZ'">Logs, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='MA'">Crate, metal</xsl:when>
      <xsl:when test="$PackagingType='MB'">Bag, multiply</xsl:when>
      <xsl:when test="$PackagingType='MC'">Crate, milk</xsl:when>
      <xsl:when test="$PackagingType='ME'">Container, metal</xsl:when>
      <xsl:when test="$PackagingType='MR'">Receptacle, metal</xsl:when>
      <xsl:when test="$PackagingType='MS'">Sack, multi-wall</xsl:when>
      <xsl:when test="$PackagingType='MT'">Mat</xsl:when>
      <xsl:when test="$PackagingType='MW'">Receptacle, plastic wrapped</xsl:when>
      <xsl:when test="$PackagingType='MX'">Matchbox</xsl:when>
      <xsl:when test="$PackagingType='NA'">Not available</xsl:when>
      <xsl:when test="$PackagingType='NE'">Unpacked or unpackaged</xsl:when>
      <xsl:when test="$PackagingType='NF'">Unpacked or unpackaged, single unit</xsl:when>
      <xsl:when test="$PackagingType='NG'">Unpacked or unpackaged, multiple units</xsl:when>
      <xsl:when test="$PackagingType='NS'">Nest</xsl:when>
      <xsl:when test="$PackagingType='NT'">Net</xsl:when>
      <xsl:when test="$PackagingType='NU'">Net, tube, plastic</xsl:when>
      <xsl:when test="$PackagingType='NV'">Net, tube, textile</xsl:when>
      <xsl:when test="$PackagingType='OA'">Pallet, CHEP 40 cm x 60 cm</xsl:when>
      <xsl:when test="$PackagingType='OB'">Pallet, CHEP 80 cm x 120 cm</xsl:when>
      <xsl:when test="$PackagingType='OC'">Pallet, CHEP 100 cm x 120 cm</xsl:when>
      <xsl:when test="$PackagingType='OD'">Pallet, AS 4068-1993</xsl:when>
      <xsl:when test="$PackagingType='OE'">Pallet, ISO T11</xsl:when>
      <xsl:when test="$PackagingType='OF'">Platform, unspecified weight or dimension</xsl:when>
      <xsl:when test="$PackagingType='OK'">Block</xsl:when>
      <xsl:when test="$PackagingType='OT'">Octabin</xsl:when>
      <xsl:when test="$PackagingType='OU'">Container, outer</xsl:when>
      <xsl:when test="$PackagingType='P2'">Pan</xsl:when>
      <xsl:when test="$PackagingType='PA'">Packet</xsl:when>
      <xsl:when test="$PackagingType='PB'">Pallet, box Combined open-ended box and pallet</xsl:when>
      <xsl:when test="$PackagingType='PC'">Parcel</xsl:when>
      <xsl:when test="$PackagingType='PD'">Pallet, modular, collars 80cms * 100cms</xsl:when>
      <xsl:when test="$PackagingType='PE'">Pallet, modular, collars 80cms * 120cms</xsl:when>
      <xsl:when test="$PackagingType='PF'">Pen</xsl:when>
      <xsl:when test="$PackagingType='PG'">Plate</xsl:when>
      <xsl:when test="$PackagingType='PH'">Pitcher</xsl:when>
      <xsl:when test="$PackagingType='PI'">Pipe</xsl:when>
      <xsl:when test="$PackagingType='PJ'">Punnet</xsl:when>
      <xsl:when test="$PackagingType='PK'">Package</xsl:when>
      <xsl:when test="$PackagingType='PL'">Pail</xsl:when>
      <xsl:when test="$PackagingType='PN'">Plank</xsl:when>
      <xsl:when test="$PackagingType='PO'">Pouch</xsl:when>
      <xsl:when test="$PackagingType='PP'">Piece</xsl:when>
      <xsl:when test="$PackagingType='PR'">Receptacle, plastic</xsl:when>
      <xsl:when test="$PackagingType='PT'">Pot</xsl:when>
      <xsl:when test="$PackagingType='PU'">Tray</xsl:when>
      <xsl:when test="$PackagingType='PV'">Pipes, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='PX'">Pallet</xsl:when>
      <xsl:when test="$PackagingType='PY'">Plates, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='PZ'">Planks, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='QA'">Drum, steel, non-removable head</xsl:when>
      <xsl:when test="$PackagingType='QB'">Drum, steel, removable head</xsl:when>
      <xsl:when test="$PackagingType='QC'">Drum, aluminium, non-removable head</xsl:when>
      <xsl:when test="$PackagingType='QD'">Drum, aluminium, removable head</xsl:when>
      <xsl:when test="$PackagingType='QF'">Drum, plastic, non-removable head</xsl:when>
      <xsl:when test="$PackagingType='QG'">Drum, plastic, removable head</xsl:when>
      <xsl:when test="$PackagingType='QH'">Barrel, wooden, bung type</xsl:when>
      <xsl:when test="$PackagingType='QJ'">Barrel, wooden, removable head</xsl:when>
      <xsl:when test="$PackagingType='QK'">Jerrican, steel, non-removable head</xsl:when>
      <xsl:when test="$PackagingType='QL'">Jerrican, steel, removable head</xsl:when>
      <xsl:when test="$PackagingType='QM'">Jerrican, plastic, non-removable head</xsl:when>
      <xsl:when test="$PackagingType='QN'">Jerrican, plastic, removable head</xsl:when>
      <xsl:when test="$PackagingType='QP'">Box, wooden, natural wood, ordinary</xsl:when>
      <xsl:when test="$PackagingType='QQ'">Box, wooden, natural wood, with sift proof walls</xsl:when>
      <xsl:when test="$PackagingType='QR'">Box, plastic, expanded</xsl:when>
      <xsl:when test="$PackagingType='QS'">Box, plastic, solid</xsl:when>
      <xsl:when test="$PackagingType='RD'">Rod</xsl:when>
      <xsl:when test="$PackagingType='RG'">Ring</xsl:when>
      <xsl:when test="$PackagingType='RJ'">Rack, clothing hanger</xsl:when>
      <xsl:when test="$PackagingType='RK'">Rack</xsl:when>
      <xsl:when test="$PackagingType='RL'">Reel</xsl:when>
      <xsl:when test="$PackagingType='RO'">Roll</xsl:when>
      <xsl:when test="$PackagingType='RT'">Rednet</xsl:when>
      <xsl:when test="$PackagingType='RZ'">Rods, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='SA'">Sack</xsl:when>
      <xsl:when test="$PackagingType='SB'">Slab</xsl:when>
      <xsl:when test="$PackagingType='SC'">Crate, shallow</xsl:when>
      <xsl:when test="$PackagingType='SD'">Spindle</xsl:when>
      <xsl:when test="$PackagingType='SE'">Sea-chest</xsl:when>
      <xsl:when test="$PackagingType='SH'">Sachet</xsl:when>
      <xsl:when test="$PackagingType='SI'">Skid</xsl:when>
      <xsl:when test="$PackagingType='SK'">Case, skeleton</xsl:when>
      <xsl:when test="$PackagingType='SL'">Slipsheet</xsl:when>
      <xsl:when test="$PackagingType='SM'">Sheetmetal</xsl:when>
      <xsl:when test="$PackagingType='SO'">Spool</xsl:when>
      <xsl:when test="$PackagingType='SP'">Sheet, plastic wrapping</xsl:when>
      <xsl:when test="$PackagingType='SS'">Case, steel</xsl:when>
      <xsl:when test="$PackagingType='ST'">Sheet</xsl:when>
      <xsl:when test="$PackagingType='SU'">Suitcase</xsl:when>
      <xsl:when test="$PackagingType='SV'">Envelope, steel</xsl:when>
      <xsl:when test="$PackagingType='SW'">Shrinkwrapped</xsl:when>
      <xsl:when test="$PackagingType='SX'">Set</xsl:when>
      <xsl:when test="$PackagingType='SY'">Sleeve</xsl:when>
      <xsl:when test="$PackagingType='SZ'">Sheets, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='T1'">Tablet</xsl:when>
      <xsl:when test="$PackagingType='TB'">Tub</xsl:when>
      <xsl:when test="$PackagingType='TC'">Tea-chest</xsl:when>
      <xsl:when test="$PackagingType='TD'">Tube, collapsible</xsl:when>
      <xsl:when test="$PackagingType='TE'">Tyre</xsl:when>
      <xsl:when test="$PackagingType='TG'">Tank container, generic</xsl:when>
      <xsl:when test="$PackagingType='TI'">Tierce</xsl:when>
      <xsl:when test="$PackagingType='TK'">Tank, rectangular</xsl:when>
      <xsl:when test="$PackagingType='TL'">Tub, with lid</xsl:when>
      <xsl:when test="$PackagingType='TN'">Tin</xsl:when>
      <xsl:when test="$PackagingType='TO'">Tun</xsl:when>
      <xsl:when test="$PackagingType='TR'">Trunk</xsl:when>
      <xsl:when test="$PackagingType='TS'">Truss</xsl:when>
      <xsl:when test="$PackagingType='TT'">Bag, tote</xsl:when>
      <xsl:when test="$PackagingType='TU'">Tube</xsl:when>
      <xsl:when test="$PackagingType='TV'">Tube, with nozzle</xsl:when>
      <xsl:when test="$PackagingType='TW'">Pallet, triwall</xsl:when>
      <xsl:when test="$PackagingType='TY'">Tank, cylindrical</xsl:when>
      <xsl:when test="$PackagingType='TZ'">Tubes, in bundle/bunch/truss</xsl:when>
      <xsl:when test="$PackagingType='UC'">Uncaged</xsl:when>
      <xsl:when test="$PackagingType='UN'">Unit</xsl:when>
      <xsl:when test="$PackagingType='VA'">Vat</xsl:when>
      <xsl:when test="$PackagingType='VG'">Bulk, gas (at 1031 mbar and 15Â°C)</xsl:when>
      <xsl:when test="$PackagingType='VI'">Vial</xsl:when>
      <xsl:when test="$PackagingType='VK'">Vanpack</xsl:when>
      <xsl:when test="$PackagingType='VL'">Bulk, liquid</xsl:when>
      <xsl:when test="$PackagingType='VO'">Bulk, solid, large particles (Â“nodulesÂ”)</xsl:when>
      <xsl:when test="$PackagingType='VP'">Vacuum-packed</xsl:when>
      <xsl:when test="$PackagingType='VQ'">Bulk, liquefied gas (at abnormal temperature/pressure)</xsl:when>
      <xsl:when test="$PackagingType='VN'">Vehicle</xsl:when>
      <xsl:when test="$PackagingType='VR'">Bulk, solid, granular particles (Â“grainsÂ”)</xsl:when>
      <xsl:when test="$PackagingType='VS'">Bulk, scrap metal</xsl:when>
      <xsl:when test="$PackagingType='VY'">Bulk, solid, fine particles (Â“powdersÂ”)</xsl:when>
      <xsl:when test="$PackagingType='WA'">Intermediate bulk container</xsl:when>
      <xsl:when test="$PackagingType='WB'">Wickerbottle</xsl:when>
      <xsl:when test="$PackagingType='WC'">Intermediate bulk container, steel</xsl:when>
      <xsl:when test="$PackagingType='WD'">Intermediate bulk container, aluminium</xsl:when>
      <xsl:when test="$PackagingType='WF'">Intermediate bulk container, metal</xsl:when>
      <xsl:when test="$PackagingType='WG'">Intermediate bulk container, steel, pressurised > 10 kpa</xsl:when>
      <xsl:when test="$PackagingType='WH'">Intermediate bulk container, aluminium, pressurised > 10 kpa</xsl:when>
      <xsl:when test="$PackagingType='WJ'">Intermediate bulk container, metal, pressure 10 kpa</xsl:when>
      <xsl:when test="$PackagingType='WK'">Intermediate bulk container, steel, liquid</xsl:when>
      <xsl:when test="$PackagingType='WL'">Intermediate bulk container, aluminium, liquid</xsl:when>
      <xsl:when test="$PackagingType='WM'">Intermediate bulk container, metal, liquid</xsl:when>
      <xsl:when test="$PackagingType='WN'">Intermediate bulk container, woven plastic, without coat/liner</xsl:when>
      <xsl:when test="$PackagingType='WP'">Intermediate bulk container, woven plastic, coated</xsl:when>
      <xsl:when test="$PackagingType='WQ'">Intermediate bulk container, woven plastic, with liner</xsl:when>
      <xsl:when test="$PackagingType='WR'">Intermediate bulk container, woven plastic, coated and liner</xsl:when>
      <xsl:when test="$PackagingType='WS'">Intermediate bulk container, plastic film</xsl:when>
      <xsl:when test="$PackagingType='WT'">Intermediate bulk container, textile with out coat/liner</xsl:when>
      <xsl:when test="$PackagingType='WU'">Intermediate bulk container, natural wood, with inner liner</xsl:when>
      <xsl:when test="$PackagingType='WV'">Intermediate bulk container, textile, coated</xsl:when>
      <xsl:when test="$PackagingType='WW'">Intermediate bulk container, textile, with liner</xsl:when>
      <xsl:when test="$PackagingType='WX'">Intermediate bulk container, textile, coated and liner</xsl:when>
      <xsl:when test="$PackagingType='WY'">Intermediate bulk container, plywood, with inner liner</xsl:when>
      <xsl:when test="$PackagingType='WZ'">Intermediate bulk container, reconstituted wood, with inner liner</xsl:when>
      <xsl:when test="$PackagingType='XA'">Bag, woven plastic, without inner coat/liner</xsl:when>
      <xsl:when test="$PackagingType='XB'">Bag, woven plastic, sift proof</xsl:when>
      <xsl:when test="$PackagingType='XC'">Bag, woven plastic, water resistant</xsl:when>
      <xsl:when test="$PackagingType='XD'">Bag, plastics film</xsl:when>
      <xsl:when test="$PackagingType='XF'">Bag, textile, without inner coat/liner</xsl:when>
      <xsl:when test="$PackagingType='XG'">Bag, textile, sift proof</xsl:when>
      <xsl:when test="$PackagingType='XH'">Bag, textile, water resistant</xsl:when>
      <xsl:when test="$PackagingType='XJ'">Bag, paper, multi-wall</xsl:when>
      <xsl:when test="$PackagingType='XK'">Bag, paper, multi-wall, water resistant</xsl:when>
      <xsl:when test="$PackagingType='YA'">Composite packaging, plastic receptacle in steel drum</xsl:when>
      <xsl:when test="$PackagingType='YB'">Composite packaging, plastic receptacle in steel crate box</xsl:when>
      <xsl:when test="$PackagingType='YC'">Composite packaging, plastic receptacle in aluminium drum</xsl:when>
      <xsl:when test="$PackagingType='YD'">Composite packaging, plastic receptacle in aluminium crate</xsl:when>
      <xsl:when test="$PackagingType='YF'">Composite packaging, plastic receptacle in wooden box</xsl:when>
      <xsl:when test="$PackagingType='YG'">Composite packaging, plastic receptacle in plywood drum</xsl:when>
      <xsl:when test="$PackagingType='YH'">Composite packaging, plastic receptacle in plywood box</xsl:when>
      <xsl:when test="$PackagingType='YJ'">Composite packaging, plastic receptacle in fibre drum</xsl:when>
      <xsl:when test="$PackagingType='YK'">Composite packaging, plastic receptacle in fibreboard box</xsl:when>
      <xsl:when test="$PackagingType='YL'">Composite packaging, plastic receptacle in plastic drum</xsl:when>
      <xsl:when test="$PackagingType='YM'">Composite packaging, plastic receptacle in solid plastic box</xsl:when>
      <xsl:when test="$PackagingType='YN'">Composite packaging, glass receptacle in steel drum</xsl:when>
      <xsl:when test="$PackagingType='YP'">Composite packaging, glass receptacle in steel crate box</xsl:when>
      <xsl:when test="$PackagingType='YQ'">Composite packaging, glass receptacle in aluminium drum</xsl:when>
      <xsl:when test="$PackagingType='YR'">Composite packaging, glass receptacle in aluminium crate</xsl:when>
      <xsl:when test="$PackagingType='YS'">Composite packaging, glass receptacle in wooden box</xsl:when>
      <xsl:when test="$PackagingType='YT'">Composite packaging, glass receptacle in plywood drum</xsl:when>
      <xsl:when test="$PackagingType='YV'">Composite packaging, glass receptacle in wickerwork hamper</xsl:when>
      <xsl:when test="$PackagingType='YW'">Composite packaging, glass receptacle in fibre drum</xsl:when>
      <xsl:when test="$PackagingType='YX'">Composite packaging, glass receptacle in fibreboard box</xsl:when>
      <xsl:when test="$PackagingType='YY'">Composite packaging, glass receptacle in expandable plastic pack</xsl:when>
      <xsl:when test="$PackagingType='YZ'">Composite packaging, glass receptacle in solid plastic pack</xsl:when>
      <xsl:when test="$PackagingType='ZA'">Intermediate bulk container, paper, multi-wall</xsl:when>
      <xsl:when test="$PackagingType='ZB'">Bag, large</xsl:when>
      <xsl:when test="$PackagingType='ZC'">Intermediate bulk container, paper, multi-wall, water resistant</xsl:when>
      <xsl:when test="$PackagingType='ZD'">Intermediate bulk container, rigid plastic, with structural equipment, solids</xsl:when>
      <xsl:when test="$PackagingType='ZF'">Intermediate bulk container, rigid plastic, freestanding, solids</xsl:when>
      <xsl:when test="$PackagingType='ZG'">Intermediate bulk container, rigid plastic, with structural equipment, pressurised</xsl:when>
      <xsl:when test="$PackagingType='ZH'">Intermediate bulk container, rigid plastic, freestanding, pressurised</xsl:when>
      <xsl:when test="$PackagingType='ZJ'">Intermediate bulk container, rigid plastic, with structural equipment, liquids</xsl:when>
      <xsl:when test="$PackagingType='ZK'">Intermediate bulk container, rigid plastic, freestanding, liquids</xsl:when>
      <xsl:when test="$PackagingType='ZL'">Intermediate bulk container, composite, rigid plastic, solids</xsl:when>
      <xsl:when test="$PackagingType='ZM'">Intermediate bulk container, composite, flexible plastic, solids</xsl:when>
      <xsl:when test="$PackagingType='ZN'">Intermediate bulk container, composite, rigid plastic, pressurised</xsl:when>
      <xsl:when test="$PackagingType='ZP'">Intermediate bulk container, composite, flexible plastic, pressurised</xsl:when>
      <xsl:when test="$PackagingType='ZQ'">Intermediate bulk container, composite, rigid plastic, liquids</xsl:when>
      <xsl:when test="$PackagingType='ZR'">Intermediate bulk container, composite, flexible plastic, liquids</xsl:when>
      <xsl:when test="$PackagingType='ZS'">Intermediate bulk container, composite</xsl:when>
      <xsl:when test="$PackagingType='ZT'">Intermediate bulk container, fibreboard</xsl:when>
      <xsl:when test="$PackagingType='ZU'">Intermediate bulk container, flexible</xsl:when>
      <xsl:when test="$PackagingType='ZV'">Intermediate bulk container, metal, other than steel</xsl:when>
      <xsl:when test="$PackagingType='ZW'">Intermediate bulk container, natural wood</xsl:when>
      <xsl:when test="$PackagingType='ZX'">Intermediate bulk container, plywood</xsl:when>
      <xsl:when test="$PackagingType='ZY'">Intermediate bulk container, reconstituted wood</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$PackagingType"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="Tmp_Quantity">
    <xsl:value-of select="format-number(./cbc:InvoicedQuantity, '###.###,####', 'european')"/>
    <xsl:if test="./cbc:InvoicedQuantity/@unitCode">
      <xsl:for-each select="./cbc:InvoicedQuantity">
        <xsl:text/>
        <xsl:choose>
		  <xsl:when test="@unitCode  = &apos;SA&apos;">
            <span>
              <xsl:text>ÇUVAL</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;26&apos;">
            <span>
              <xsl:text>Ton</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BX&apos;">
            <span>
              <xsl:text>Kutu</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;LTR&apos;">
            <span>
              <xsl:text>LT</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;EA&apos;">
            <span>
              <xsl:text>Adet</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;NIU&apos;">
            <span>
              <xsl:text>Adet</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;C62&apos;">
            <span>
              <xsl:text>Adet</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KGM&apos;">
            <span>
              <xsl:text>KG</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KJO&apos;">
            <span>
              <xsl:text>kJ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;GRM&apos;">
            <span>
              <xsl:text>GR</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MGM&apos;">
            <span>
              <xsl:text>MG</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;NT&apos;">
            <span>
              <xsl:text>Net Ton</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;GT&apos;">
            <span>
              <xsl:text>Gross Ton</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MTR&apos;">
            <span>
              <xsl:text>M</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MMT&apos;">
            <span>
              <xsl:text>MM</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KTM&apos;">
            <span>
              <xsl:text>KM</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MLT&apos;">
            <span>
              <xsl:text>ML</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MMQ&apos;">
            <span>
              <xsl:text>MM&#179;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CLT&apos;">
            <span>
              <xsl:text>CL</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CMK&apos;">
            <span>
              <xsl:text>CM&#178;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CMQ&apos;">
            <span>
              <xsl:text>CM&#179;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CMT&apos;">
            <span>
              <xsl:text>CM</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MTK&apos;">
            <span>
              <xsl:text>M&#178;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MTQ&apos;">
            <span>
              <xsl:text>M&#179;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;DAY&apos;">
            <span>
              <xsl:text>Gün</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MON&apos;">
            <span>
              <xsl:text>Ay</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;PA&apos;">
            <span>
              <xsl:text>Paket</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KWH&apos;">
            <span>
              <xsl:text>KWH</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;INH&apos;">
            <span>
              <xsl:text>IN</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;FOT&apos;">
            <span>
              <xsl:text>FT</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MMK&apos;">
            <span>
              <xsl:text>MM&#178;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;INK&apos;">
            <span>
              <xsl:text>IN&#178;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;FTK&apos;">
            <span>
              <xsl:text>FT&#178;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;INQ&apos;">
            <span>
              <xsl:text>IN&#179;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;FTQ&apos;">
            <span>
              <xsl:text>FT&#179;</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;ONZ&apos;">
            <span>
              <xsl:text>OZ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;LBR&apos;">
            <span>
              <xsl:text>LB</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;PR&apos;">
            <span>
              <xsl:text>Çift</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BE&apos;">
            <span>
              <xsl:text>Deste</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;PK&apos;">
            <span>
              <xsl:text>Koli</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;SW&apos;">
            <span>
              <xsl:text>Top</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;QB&apos;">
            <span>
              <xsl:text>Cilt</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;SEC&apos;">
            <span>
              <xsl:text>Saniye</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;5C&apos;">
            <span>
              <xsl:text>Teneke</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;MIN&apos;">
            <span>
              <xsl:text>Dakika</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;DZN&apos;">
            <span>
              <xsl:text>Düzine</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;DPC&apos;">
            <span>
              <xsl:text>Düzine</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;5B&apos;">
            <span>
              <xsl:text>Takım</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;DMQ&apos;">
            <span>
              <xsl:text>Desimetreküp</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;WEE&apos;">
            <span>
              <xsl:text>Hafta</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;HUR&apos;">
            <span>
              <xsl:text>Saat</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;ANN&apos;">
            <span>
              <xsl:text>Yıl</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;RO&apos;">
            <span>
              <xsl:text>Rulo</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CTM&apos;">
            <span>
              <xsl:text>Karat</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;PTN&apos;">
            <span>
              <xsl:text>Parça,Kısım</xsl:text>
            </span>
          </xsl:when>

          <xsl:when test="@unitCode  = &apos;B4&apos;">
            <span>
              <xsl:text>Varil</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;28&apos;">
            <span>
              <xsl:text>KG</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BG&apos;">
            <span>
              <xsl:text>Çuval</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BJ&apos;">
            <span>
              <xsl:text>Kova</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BK&apos;">
            <span>
              <xsl:text>Sepet</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BL&apos;">
            <span>
              <xsl:text>Balya</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;BO&apos;">
            <span>
              <xsl:text>Şişe</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CO&apos;">
            <span>
              <xsl:text>Damacana</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CQ&apos;">
            <span>
              <xsl:text>Kartuş</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CS&apos;">
            <span>
              <xsl:text>Kasa</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CT&apos;">
            <span>
              <xsl:text>Karton</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;11&apos;">
            <span>
              <xsl:text>Takım</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;2W&apos;">
            <span>
              <xsl:text>Sepet</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;B32&apos;">
            <span>
              <xsl:text>KG-METRE KARE</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;CCT&apos;">
            <span>
              <xsl:text>TON BAŞINA TAŞIMA KAPASİTESİ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;D30&apos;">
            <span>
              <xsl:text>BRÜT KALORİ DEĞERİ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;D40&apos;">
            <span>
              <xsl:text>BİN LİTRE</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;GFI&apos;">
            <span>
              <xsl:text>FISSILE İZOTOP GRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;H62&apos;">
            <span>
              <xsl:text>YÜZ ADET</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;K20&apos;">
            <span>
              <xsl:text>KİLOGRAM POTASYUM OKSİT</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;K58&apos;">
            <span>
              <xsl:text>KURUTULMUŞ NET AĞIRLIKLI KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;K62&apos;">
            <span>
              <xsl:text>KİLOGRAM-ADET</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KMA&apos;">
            <span>
              <xsl:text>METİL AMİNLERİN KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KNI&apos;">
            <span>
              <xsl:text>AZOTUN KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KPH&apos;">
            <span>
              <xsl:text>Kg POTASYUM OKSİD</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KSD&apos;">
            <span>
              <xsl:text>%90 KURU ÜRÜN KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KSH&apos;">
            <span>
              <xsl:text>SODYUM HİDROKSİT KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KUR&apos;">
            <span>
              <xsl:text>URANYUM KİLOGRAMI</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KWT&apos;">
            <span>
              <xsl:text>KİLOWATT</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;KWT&apos;">
            <span>
              <xsl:text>KİLOWATT</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;LPA&apos;">
            <span>
              <xsl:text>SAF ALKOL LİTRESİ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;NCL&apos;">
            <span>
              <xsl:text>HÜCRE ADEDİ</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;R9&apos;">
            <span>
              <xsl:text>BİN METRE KÜP</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;SET&apos;">
            <span>
              <xsl:text>SET</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;T3&apos;">
            <span>
              <xsl:text>BİN ADET</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;D61&apos;">
            <span>
              <xsl:text>Dakika</xsl:text>
            </span>
          </xsl:when>
          <xsl:when test="@unitCode  = &apos;D62&apos;">
            <span>
              <xsl:text>Saniye</xsl:text>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span>
              <xsl:value-of select="@unitCode"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>