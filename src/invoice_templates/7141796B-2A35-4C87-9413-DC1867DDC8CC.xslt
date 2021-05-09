<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:clm54217="urn:un:unece:uncefact:codelist:specification:54217:2001" xmlns:clm5639="urn:un:unece:uncefact:codelist:specification:5639:1988" xmlns:clm66411="urn:un:unece:uncefact:codelist:specification:66411:2001" xmlns:clmIANAMIMEMediaType="urn:un:unece:uncefact:codelist:specification:IANAMIMEMediaType:2003" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xades="http://uri.etsi.org/01903/v1.3.2#" exclude-result-prefixes="cac cbc ccts clm54217 clm5639 clm66411 clmIANAMIMEMediaType fn link n1 qdt udt xbrldi xbrli xdt xlink xs xsd xsi ext ds xades">
  <xsl:decimal-format name="european" decimal-separator="," grouping-separator="." NaN=""/>
  <xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
  <xsl:param name="SV_OutputFormat" select="'HTML'"/>
  <xsl:variable name="XML" select="/"/>
  <xsl:template match="/">
    <html>
      <head>
        <style type="text/css">*{	font-family: "Tahoma", "Times New Roman", Times, serif;	font-size:10px;		color:#353432;	}	body{ margin:0px; padding:0px; padding-left:4px;}	h1, h2 { padding-bottom: 3px; padding-top: 3px; margin-bottom: 5px; text-transform: uppercase; font-family: Arial, Helvetica, sans-serif;	}	h1 { font-size: 1.4em; text-transform:none;	}	h2 { font-size: 1em; color: brown;	}	h3 { font-size: 1em; color: #333333; text-align: justify; margin: 0; padding: 0;	}	h4 { font-size: 1.1em; font-style: bold; font-family: Arial, Helvetica, sans-serif; color: #000000; margin: 0; padding: 0;	}	hr { height:2px; color: #000000; background-color: #000000; border-bottom: 1px solid #000000;	}	p, ul, ol { margin-top: 1.5em;	}	ul, ol { margin-left: 3em;	}	blockquote { margin-left: 3em; margin-right: 3em; font-style: italic;	}	a { text-decoration: none; color: #70A300;	}	a:hover { border: none; color: #70A300;	}	#despatchTable { border-collapse:collapse; font-size:11px; float:right; border-color:gray;	}	#ettnTable { border-collapse:collapse; font-size:11px; border-color:gray;	}	#customerPartyTable { border-width: 0px; border-spacing:; border-style: inset; border-color: gray; border-collapse: collapse; background-color:	}	#customerIDTable { border-width: 2px; border-spacing:; border-style: inset; border-color: gray; border-collapse: collapse; background-color:	}	#customerIDTableTd { border-width: 2px; border-spacing:; border-style: inset; border-color: gray; border-collapse: collapse; background-color:	}	#lineTable { border-width:2px; border-spacing:; border-style: inset; border-color: black; border-collapse: collapse; background-color:;	}	#lineTableTd { border-width: 1px; padding: 1px; border-style: inset; border-color: black; background-color: white;	}	#lineTableTr { border-width: 1px; padding: 0px; border-style: inset; border-color: black; background-color: white; -moz-border-radius:;	}	#lineTableDummyTd { border-width: 1px; border-color:white; padding: 1px; border-style: inset; border-color: black; background-color: white;	}	#lineTableBudgetTd { border-width: 0.05em; border-spacing:0px; padding: 1px; border-style: inset; border-color: black; background-color: white; -moz-border-radius:;	}	#notesTable { border-width: 2px; border-spacing:; border-style: inset; border-color: black; border-collapse: collapse; background-color:	}	#notesTableTd { border-width: 0px; border-spacing:; border-style: inset; border-color: black; border-collapse: collapse; background-color:	}	table { border-spacing:0px;	}	#budgetContainerTable { border-width: 0px; border-spacing: 0px; border-style: inset; border-color: black; border-collapse: collapse; background-color:;	}	td { border-color:gray;	}	.page_container{ width:800px;  }	.efatura_text{ text-align: center; color:#bbbbbb; font-size:12px; }	.firma_adi{ display:block; color:#2c4e73; font-size:1.2em; font-weight:bold; margin-top:10px;}	.cerceve_ust{ position: relative; width:350px; height:15px; margin-top:5px;  }	.cerceve_alt{ position: relative; width:350px; height:15px; margin-bottom:5px; }	span.cerceve_box{ display: inline-block; width:15px; height:15px;  }	.corner_tl{ position: absolute; top:0px;left:0px; border:0px none; border-top:2px solid #2c4e73; border-left:2px solid #2c4e73; }	.corner_tr{ position: absolute; top:0px;right:0px; border:0px none; border-top:2px solid #2c4e73; border-right:2px solid #2c4e73; }	.corner_bl{ position: absolute; top:0px;left:0px; border:0px none; border-bottom:2px solid #2c4e73; border-left:2px solid #2c4e73; }	.corner_br{ position: absolute; top:0px;right:0px; border:0px none; border-bottom:2px solid #2c4e73; border-right:2px solid #2c4e73; }	.cerceve_orta{ padding-right:10px; padding-left:10px; padding-top:0px; padding-bottom:0px; }	.ettn_container { width:340px;}	.pair_key{ display: inline-block; width:100px; font-weight: bold; }	.pair_seperator{ display: inline-block; width: 10px; text-align: left; }	.pair_value{ display: inline-block; }	.tablo_satir{ width:800px; border-spacing:0px; }	.pad6px,.pad6x{ padding:6px; }	.pad10px,.pad10x{ padding:10px; }	.cerceve{ border-radius:6px; border:1px solid #2c4e73; margin-top:5px;margin-bottom:5px; width:100%; }	.efatura_cap_div{ border-radius:6px; width: 95%; padding: 8px; background:#2c4e73; color:#ffffff }	.fatura_bilgi{ min-width: 210px !important; }	.kolon_baslik{ border-bottom : 1px solid  #d9d9d9; border-right:1px solid  #d9d9d9; background: #2c4e73; color:#ffffff;	}	tr.tr_baslik td:last-child, tr.satir td:last-child {    border-right:0px none; } 	.kolon_baslik span{ display:block; text-align:center;  color:#ffffff; font-weight:bold; padding:3px;	}	tr.satir td{	border-bottom : 1px solid  #d9d9d9;	border-right:1px solid  #d9d9d9;	}	td.kolon_deger span { display:block; padding:2px; }	.tablo_satir tr:last-child td{  border-bottom:0px none;  }	#tablo_satir{	border:1px solid #d9d9d9;	}	tr.odd{ background: #ffffff;	}	tr.even{ background: #f5f5f5;	}	.alt_toplam_tablosu{ width:800px; }	.myframe{   	margin-top:5px;	margin-bottom:5px;	border : 1px solid  #d9d9d9; padding:5px; border-radius:6px;  	}	.toplam_satiri{ padding:3px; }	.alt_toplam_key{	display: inline-block;	width:250px;	  	font-weight: bold;	}	.alt_toplam_sep{ display: inline-block;}	.alt_toplam_val{ display: inline-block; width:120px; margin-left:3px; text-align:right; }	.toplam_satiri{ padding:3px; }	.row_banka{ font-weight: bold; color:#649726; }	a{ text-decoration: none; color:#649726; }	a:hover{ font-weight:bold; color:#2c4e73; }	.alt_toplam_key{ color:#4e4d49; }	.alt_toplam_val{  color:#4e4d49; }	.fatura_not_container{ color:#649726; }	.fatura_not_container_w_box{ border:1px solid #2c4e73; padding:8px; border-radius:6px; margin-top:4px; width:800px; }</style>
      </head>
      <body>
        <p>
          <span style="font-size: 10px;">&#8203;&#8203;</span>
        </p>
        <table border="0" cellpadding="0" cellspacing="0" style="border-color: blue;" width="800">
          <tbody>
            <tr>
              <td width="40%" valign="top" rowspan="2">
                <table>
                  <tr>
                    <td class="cerceve">
                      <table class="pad6px" width="350">
                        <tbody>
                          <tr>
                            <td align="left" >
                              <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party">
                                <xsl:if test="./cac:PartyName">
                                  <xsl:value-of select="./cac:PartyName/cbc:Name" />
                                  <br />
                                </xsl:if>
                                <xsl:if test="./cac:Person/cbc:Title">
                                  <xsl:value-of select="./cac:Person/cbc:Title"/>
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cac:Person/cbc:FirstName">
                                  <xsl:value-of select="./cac:Person/cbc:FirstName"/>
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cac:Person/cbc:MiddleName">
                                  <xsl:value-of select="./cac:Person/cbc:MiddleName"/>
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cac:Person/cbc:FamilyName">
                                  <xsl:value-of select="./cac:Person/cbc:FamilyName"/>
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                                <xsl:if test="./cac:Person/cbc:NameSuffix">
                                  <xsl:value-of select="./cac:Person/cbc:NameSuffix"/>
                                  <xsl:text>&#160;</xsl:text>
                                </xsl:if>
                              </xsl:for-each>
                            </td>
                          </tr>
                          <tr align="left">
                            <td align="left">
                              <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress">
                                <xsl:value-of select="concat(./cbc:StreetName,' ',./cbc:BuildingName)"/>
                                <xsl:if test="./cbc:BuildingNumber">
                                  <xsl:value-of select="concat('  No:',./cbc:BuildingNumber)"/>
                                </xsl:if>
                                <br />
                                <xsl:value-of select="concat(./cbc:PostalZone,' ',./cbc:CitySubdivisionName,'/ ',./cbc:CityName,' ')"/>
                              </xsl:for-each>
                              <br/>
                            </td>
                          </tr>
                          <xsl:if test="normalize-space(//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone)">
                            <tr align="left">
                              <td align="left">
                                <span class="pair_key">Tel</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telephone" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="normalize-space(//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax)">
                            <tr align="left">
                              <td align="left">
                                <span class="pair_key"> Faks</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:Telefax" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="normalize-space(//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI)">
                            <tr>
                              <td align="left">
                                <span class="pair_key">Web Sitesi</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cbc:WebsiteURI" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="normalize-space(n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail)">
                            <tr align="left">
                              <td align="left">
                                <span class="pair_key">E-posta</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="normalize-space(n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name)">
                            <tr>
                              <td align="left">
                                <span class="pair_key">Vergi Dairesi</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <tr>
                            <td align="left">
                              <xsl:for-each select="//n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification">
                                <xsl:variable name="schemeID" select="cbc:ID/@schemeID"/>
                                <xsl:if test="$schemeID =&apos;TCKN&apos; or $schemeID =&apos;VKN&apos;">
                                  <span class="pair_key">
                                    <xsl:value-of select="$schemeID"/>
                                  </span>
                                  <span class="pair_seperator">:</span>
                                  <span class="pair_value">
                                    <xsl:value-of select="cbc:ID"/>
                                  </span>
                                </xsl:if>
                              </xsl:for-each>
                            </td>
                          </tr>
                          <xsl:if test="normalize-space(n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID = &apos;MERSISNO&apos;])">
                            <tr>
                              <td align="left">
                                <span class="pair_key">Mersis No</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID = &apos;MERSISNO&apos;]" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="normalize-space(n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID = &apos;TICARETSICILNO&apos;])">
                            <tr>
                              <td align="left">
                                <span class="pair_key">Ticaret Sicil No</span>
                                <span class="pair_seperator">:</span>
                                <span class="pair_value">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeID = &apos;TICARETSICILNO&apos;]" />
                                </span>
                              </td>
                            </tr>
                          </xsl:if>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <td/>
                  <tr>
                    <td class="cerceve">
                      <table class="pad6px">
                        <tbody>
                          <tr>
                            <td align="left" style="width: 469px;">
                              <strong>SAYIN</strong>
                            </td>
                          </tr>
                          <tr>
                            <td align="left" style="width: 469px;">
                              <xsl:choose>
                                <xsl:when test="not(//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos; or //n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;)">
                                  <xsl:for-each select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party">
                                    <xsl:if test="./cac:PartyName">
                                      <xsl:value-of select="./cac:PartyName/cbc:Name" />
                                      <br />
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:Title">
                                      <xsl:value-of select="./cac:Person/cbc:Title"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:FirstName">
                                      <xsl:value-of select="./cac:Person/cbc:FirstName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:MiddleName">
                                      <xsl:value-of select="./cac:Person/cbc:MiddleName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:FamilyName">
                                      <xsl:value-of select="./cac:Person/cbc:FamilyName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:NameSuffix">
                                      <xsl:value-of select="./cac:Person/cbc:NameSuffix"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                  </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:for-each select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party">
                                    <xsl:if test="./cac:PartyName">
                                      <xsl:value-of select="./cac:PartyName/cbc:Name" />
                                      <br />
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:Title">
                                      <xsl:value-of select="./cac:Person/cbc:Title"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:FirstName">
                                      <xsl:value-of select="./cac:Person/cbc:FirstName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:MiddleName">
                                      <xsl:value-of select="./cac:Person/cbc:MiddleName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:FamilyName">
                                      <xsl:value-of select="./cac:Person/cbc:FamilyName"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                    <xsl:if test="./cac:Person/cbc:NameSuffix">
                                      <xsl:value-of select="./cac:Person/cbc:NameSuffix"/>
                                      <xsl:text>&#160;</xsl:text>
                                    </xsl:if>
                                  </xsl:for-each>
                                </xsl:otherwise>
                              </xsl:choose>
                            </td>
                          </tr>
                          <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos;">
                            <tr>
                              <td align="left" style="width: 469px;">
                                Pasaport No:             <xsl:value-of select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Person/cac:IdentityDocumentReference/cbc:ID" />
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos;">
                            <tr>
                              <td align="left" style="width: 469px;">
                                &#220;lkesi             <xsl:call-template name="Country">
                                  <xsl:with-param name="CountryType">
                                    <xsl:value-of select="//n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:NationalityID" />
                                  </xsl:with-param>
                                </xsl:call-template>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:choose>
                            <xsl:when test="not(//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos; or //n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;)">
                              <tr align="left">
                                <td align="left" style="width: 469px;">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />&#160;<br />
                                  <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />&#160;<xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" /> /<xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" />
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" />
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI !=&apos;&apos;">
                                    <span class="pair_key">
                                      <xsl:text> Web Sitesi  </xsl:text>
                                    </span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cbc:WebsiteURI" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail !=&apos;&apos;">
                                    <span class="pair_key">E-Posta</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone !=&apos;&apos;">
                                    <span class="pair_key">Tel</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax !=&apos;&apos;">
                                    <span class="pair_key">Faks</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name !=&apos;&apos;">
                                    <span class="pair_key">Vergi Dairesi</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cbc:Name" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:for-each select="//n1:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification">
                                    <xsl:variable name="schemeID" select="cbc:ID/@schemeID"/>
                                    <xsl:if test="$schemeID =&apos;TCKN&apos; or $schemeID =&apos;VKN&apos;">
                                      <span class="pair_key">
                                        <xsl:value-of select="$schemeID"/>
                                      </span>
                                      <span class="pair_seperator">:</span>
                                      <span class="pair_value">
                                        <xsl:value-of select="cbc:ID"/>
                                      </span>
                                    </xsl:if>
                                  </xsl:for-each>
                                </td>
                              </tr>
                            </xsl:when>
                            <xsl:otherwise>
                              <tr align="left">
                                <td align="left" style="width: 469px;">
                                  <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />&#160;<br />
                                  <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />&#160;<xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" /> /<xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" />
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name" />
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI !=&apos;&apos;">
                                    <span class="pair_key">Web Sitesi</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail != &apos;&apos;">
                                    <span class="pair_key"> E-Posta</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" style="width: 469px;">
                                  <xsl:if test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone != &apos;&apos;">
                                    <span class="pair_key">Tel</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />
                                    </span>
                                  </xsl:if>
                                  <xsl:if test="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax != &apos;&apos;">
                                    <span class="pair_key"> Faks</span>
                                    <span class="pair_seperator">:</span>
                                    <span class="pair_value">
                                      <xsl:value-of select="n1:Invoice/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />
                                    </span>
                                  </xsl:if>
                                </td>
                              </tr>
                            </xsl:otherwise>
                          </xsl:choose>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <td/>
                  <tr>
                    <td class="cerceve pad6px">
                      <span class="pair_key">ETTN</span>
                      <span class="pair_seperator">:</span>
                      <span class="pair_value">
                        <xsl:value-of select="n1:Invoice/cbc:UUID" />
                      </span>
                    </td>
                  </tr>
                </table>
              </td>
              <td width="20%" align="center" valign="top">
			  
                <img align="middle" alt="GIB Logo" src="data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzMiA3OS4xNTkyODQsIDIwMTYvMDQvMTktMTM6MTM6NDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjZDNDJBNEI2QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjZDNDJBNEI1QjVCRDExRThCQjM0REIwQkZGMEQxODY0IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzREVENkU1N0FDREVDNEJBNzkxNUM2M0NCN0RENzM0NyIgc3RSZWY6ZG9jdW1lbnRJRD0iM0RFRDZFNTdBQ0RFQzRCQTc5MTVDNjNDQjdERDczNDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB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" style="width: 70px;" />
                <br />
                <br />
                <font align="center">e-Arşiv</font>				
              </td>
              <td width="40%" rowspan="2">
                <table width="100%">
                  <tr>
                    <td width='40%' valign='middle' align='right'><img style='max-width:320px; max-height:180px;' alt = 'Firma Logo' src = 'data:image/jpeg;base64,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'/></td> 
                  </tr>
                  <td/>
                  <tr>
                    <td class="efatura_cap_div">e-Arşiv</td>
                  </tr>
                  <tr>
                    <td class="cerceve">
                      <table class="pad6px">
                        <tbody class="fatura_bilgi">
                          <tr>
                            <td>
                              <span class="pair_key">&#214;zelle&#351;tirme No</span>
                              <span class="pair_seperator">:</span>
                              <xsl:value-of select="n1:Invoice/cbc:CustomizationID" />
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <span class="pair_key">Senaryo</span>
                              <span class="pair_seperator">:</span>
                              <xsl:value-of select="n1:Invoice/cbc:ProfileID" />
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <span class="pair_key">Fatura Tipi</span>
                              <span class="pair_seperator">:</span>
                              <xsl:value-of select="n1:Invoice/cbc:InvoiceTypeCode" />
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <span class="pair_key">Fatura No</span>
                              <span class="pair_seperator">:</span>
                              <xsl:value-of select="n1:Invoice/cbc:ID" />
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <span  class="pair_key">Fatura Tarihi</span>
                              <span class="pair_seperator">:</span>
                              <xsl:for-each select="//n1:Invoice">
                                <xsl:for-each select="cbc:IssueDate">
                                  <xsl:value-of select="substring(.,9,2)" />-               <xsl:value-of select="substring(.,6,2)" />-               <xsl:value-of select="substring(.,1,4)" />
                                </xsl:for-each>
                              </xsl:for-each>
                            </td>
                          </tr>
                          <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = 'duzenlemeTarihi']">
                            <tr>
                              <td>
                                <span style="font-weight:bold;">
                                  <xsl:text>Düzenlenme Zamanı</xsl:text>
                                </span>
                                <span class="pair_seperator">:</span>
                                <xsl:value-of select="cbc:DocumentType"/>
                              </td>
                            </tr>
                          </xsl:for-each>
                          <xsl:if test="//n1:Invoice/cac:DespatchDocumentReference/cbc:ID">
                            <tr>
                              <td>
                                <strong class="pair_key">&#304;rsaliye No</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:DespatchDocumentReference">
                                  <xsl:value-of select="cbc:ID" />
                                  <br />
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cac:DespatchDocumentReference/cbc:IssueDate">
                            <tr>
                              <td>
                                <strong class="pair_key">&#304;rsaliye Tarihi</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:DespatchDocumentReference">
                                  <xsl:variable name="ddt" select="cbc:IssueDate" />
                                  <xsl:value-of select="concat(substring($ddt, 9, 2), &apos;-&apos;, substring($ddt, 6, 2), &apos;-&apos;, substring($ddt, 1, 4))" />
                                  <br />
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cac:OrderReference">
                            <tr>
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
                          <xsl:if test="//n1:Invoice/cac:OrderReference/cbc:IssueDate">
                            <tr>
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
                          <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos;">
                            <tr>
                              <td>
                                <strong  class="pair_key">Arac&#305; Kurum VKN</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:value-of select="n1:Invoice/cac:TaxRepresentativeParty/cac:PartyIdentification/cbc:ID[@schemeID = &apos;ARACIKURUMVKN&apos;]" />
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;YOLCUBERABERFATURA&apos;">
                            <tr>
                              <td>
                                <strong class="pair_key">Arac&#305; Kurum Unvan</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:TaxRepresentativeParty">
                                  <xsl:value-of select="cac:PartyName/cbc:Name" />
                                  <br />
                                </xsl:for-each>
                              </td>
                            </tr>
                          </xsl:if>
                          <xsl:if test="//n1:Invoice/cbc:InvoiceTypeCode = &apos;SGK&apos;">
                            <tr>
                              <td>
                                <strong  class="pair_key">Sa&#287;l&#305;k Fatura Tipi</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:value-of select="//n1:Invoice/cbc:AccountingCost" />
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong  class="pair_key">M&#252;kellef Kodu</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                                  <xsl:if test="cbc:DocumentTypeCode= &apos;MUKELLEF_KODU&apos;">
                                    <xsl:value-of select="cbc:DocumentType"/>
                                  </xsl:if>
                                </xsl:for-each>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong  class="pair_key">M&#252;kellef Ad&#305;</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                                  <xsl:if test="cbc:DocumentTypeCode= &apos;MUKELLEF_ADI&apos;">
                                    <xsl:value-of select="cbc:DocumentType"/>
                                  </xsl:if>
                                </xsl:for-each>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong  class="pair_key">Dosya No</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                                  <xsl:if test="cbc:DocumentTypeCode= &apos;DOSYA_NO&apos; or cbc:DocumentTypeCode= &apos;HARCAMA_REFERANS_NO&apos; ">
                                    <xsl:value-of select="cbc:DocumentType"/>
                                  </xsl:if>
                                </xsl:for-each>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <strong  class="pair_key">D&#246;nem</strong>
                                <strong class="pair_seperator">:</strong>
                                <xsl:value-of select="//n1:Invoice/cac:InvoicePeriod/cbc:StartDate"/>
                                <xsl:text> / </xsl:text>
                                <xsl:value-of select="//n1:Invoice/cac:InvoicePeriod/cbc:EndDate"/>
                              </td>
                            </tr>
                          </xsl:if>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
			<tr>
        <td width='20%' align='center' valign='top'><img style='max-width:150px; max-height:150px;' align='center' alt='Firma İmzası' src='data:image/jpeg;base64,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'/></td>
			</tr>
          </tbody>
        </table>
      </body>
    </html>
    <html>
      <head/>
      <body>
        <p>&#160;</p>
        <table border="0" id="tablo_satir" borderspacing="0" cellpadding="0" class="tablo_satir">
          <tbody>
            <tr class="tr_baslik">
              <td  class="kolon_baslik" style="width:5%">
                <span>S&#305;ra No</span>
              </td>
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:20%">
                  <span>
                    <xsl:text>Malzeme / Hizmet Kodu</xsl:text>
                  </span>
                  <span>
                    <xsl:text>Malzeme / Hizmet A&#231;&#305;klamas&#305;</xsl:text>
                  </span>
                </td>
              </xsl:if>
              <!--//Malzeme hizmet kodu açıklaması ihracat-->          
              <xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;"  class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Malzeme / Hizmet Kodu</xsl:text>
                  </span>
                </td>
              </xsl:if>
              <!--//Malzeme hizmet kodu  normal-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" class="kolon_baslik" style="width:20%">
                  <span>
                    <xsl:text>Malzeme / Hizmet A&#231;&#305;klamas&#305;</xsl:text>
                  </span>
                </td>
              </xsl:if> <!--//Malzeme hizmet  açıklaması normal-->
              <!--<td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>A&#231;&#305;klamalar</xsl:text>
                </span>
              </td>--> <!--Diğer açıklamalar silindi-->
              <td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>Miktar</xsl:text>
                </span>
              </td>  <!--// miktar-->
              <td class="kolon_baslik" style="width:10%">
                <span>
                  <xsl:text>Birim Fiyat</xsl:text>
                </span>
              </td>  <!--// birim fiyat-->
              <td class="kolon_baslik" style="width:6%">
                <span>
                  <xsl:text>&#304;skonto Oran&#305;</xsl:text>
                </span>
              </td>  <!--// iskonto oranı-->
              <td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>&#304;skonto Tutar&#305;</xsl:text>
                </span>
              </td> <!--iskonto tutarı-->
              <td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>KDV Oran&#305;</xsl:text>
                </span>
              </td> <!--kdv oranı--> 
              <td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>KDV Tutar&#305;</xsl:text>
                </span>
              </td> <!--kdv tutarı-->
              <!--<xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Di&#287;er Vergiler</xsl:text>
                  </span>
                </td>
              </xsl:if>--> <!--Diğer vergiler silindi-->
              <!--<td class="kolon_baslik" style="width:8%">
                <span>
                  <xsl:text>Vergi Muafiyet Sebebi</xsl:text>
                </span>
              </td>-->  <!--vergi muafiyet sebebi silindi--> 
              <td class="kolon_baslik" style="width:16%">
                <span>
                  <xsl:text>Malzeme / Hizmet Tutar&#305;</xsl:text>
                </span>
              </td>  <!--// malzeme hizmet tutar-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Teslim &#350;art&#305;</xsl:text>
                  </span>
                </td>
              </xsl:if> <!--// teslim şart-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>E&#351;ya Kap Cinsi</xsl:text>
                  </span>
                </td>
              </xsl:if>      <!--// kap cinsi-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Kap No</xsl:text>
                  </span>
                </td>
              </xsl:if>  <!--kap no-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Kap Adet</xsl:text>
                  </span>
                </td>
              </xsl:if>  <!--kap adet-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>Teslim / Bedel &#214;deme Yeri</xsl:text>
                  </span>
                </td>
              </xsl:if>  <!--teslim bedeli ödeme yeri--> 
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>G&#246;nderim &#350;ekli</xsl:text>
                  </span>
                </td>
              </xsl:if>  <!--gönderim şekli-->
              <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" class="kolon_baslik" style="width:8%">
                  <span>
                    <xsl:text>GT&#304;P</xsl:text>
                  </span>
                </td>
              </xsl:if>
            </tr>  <!--gtip-->
            <xsl:for-each select="//n1:Invoice/cac:InvoiceLine">
              <tr>
                <xsl:attribute name="class">
                  <xsl:choose>
                    <xsl:when test="number(position()) mod 2 = 1">satir odd</xsl:when>
                    <xsl:otherwise>satir even</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 3%; text-align: left;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:value-of select="./cbc:ID" />
                      </span>
                    </span>
                  </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 20%; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID" />
                          <br />
                          <br />
                          <span style="color: rgb(105, 105, 105);">
                            <span style="font-size: 10px;">
                              <span style="font-family: verdana,geneva,sans-serif;">
                                <xsl:value-of select="./cac:Item/cbc:Description" />
                              </span>
                            </span>
                          </span>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="./cac:Item/cac:SellersItemIdentification/cbc:ID" />
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 20%; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="./cac:Item/cbc:Description" />
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <!--<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 7%; text-align: center;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:for-each select="./cbc:Note">
                          <span>
                            <xsl:text>&#160;</xsl:text>
                            <xsl:value-of select="." />
                          </span>
                          <br />
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td>-->  <!--açıklama değer silindi--> 
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:value-of select="format-number(./cbc:InvoicedQuantity, &apos;###.###,##&apos;, &apos;european&apos;)" />
                        <xsl:if test="./cbc:InvoicedQuantity/@unitCode">
                          <xsl:for-each select="./cbc:InvoicedQuantity">
                            <xsl:text> </xsl:text>
                            <xsl:choose>
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
                                  <xsl:value-of select="@unitCode" />
                                </span>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </xsl:if>
                      </span>
                    </span>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="format-number(./cac:Price/cbc:PriceAmount, &apos;###.##0,0000&apos;, &apos;european&apos;)" />
                        <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID">
                          <xsl:text> </xsl:text>
                          <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID = &apos;TRY&apos; ">
                            <xsl:text>TL</xsl:text>
                          </xsl:if>
                          <xsl:if test="./cac:Price/cbc:PriceAmount/@currencyID != &apos;TRY&apos;">
                            <xsl:value-of select="./cac:Price/cbc:PriceAmount/@currencyID" />
                          </xsl:if>
                        </xsl:if>
                      </span>
                    </span>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 6%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:for-each select="./cac:AllowanceCharge">
                          <xsl:text> </xsl:text>
                          <xsl:text>% </xsl:text>
                          <xsl:value-of select="format-number(cbc:MultiplierFactorNumeric*100, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:for-each select="./cac:AllowanceCharge">
                          <xsl:text/>
                          <xsl:value-of select="format-number(cbc:Amount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                          <xsl:if test="cbc:Amount/@currencyID">
                            <xsl:text> </xsl:text>
                            <xsl:if test="cbc:Amount/@currencyID = &apos;TRY&apos;">
                              <xsl:text>TL </xsl:text>
                            </xsl:if>
                            <xsl:if test="cbc:Amount/@currencyID != &apos;TRY&apos;">
                              <xsl:value-of select="cbc:Amount/@currencyID" />
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 7%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                          <xsl:if test="cbc:TaxTypeCode=&apos;0015&apos; ">
                            <xsl:if test="../../cbc:Percent">
                              <xsl:text>%</xsl:text>
                              <xsl:value-of select="format-number(../../cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                          <xsl:if test="cbc:TaxTypeCode=&apos;0015&apos; ">
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="format-number(../../cbc:TaxAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                            <xsl:if test="../../cbc:TaxAmount/@currencyID">
                              <xsl:text> </xsl:text>
                              <xsl:if test="../../cbc:TaxAmount/@currencyID = &apos;TRY&apos;">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="../../cbc:TaxAmount/@currencyID != &apos;TRY&apos;">
                                <xsl:value-of select="../../cbc:TaxAmount/@currencyID" />
                              </xsl:if>
                            </xsl:if>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td>
                <!--<xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 4%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme">
                            <xsl:if test="cbc:TaxTypeCode!=&apos;0015&apos; ">
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cbc:Name" />
                              <xsl:if test="../../cbc:Percent">
                                <xsl:text>(%</xsl:text>
                                <xsl:value-of select="format-number(../../cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                <xsl:text>)=</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="format-number(../../cbc:TaxAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                              <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                <xsl:text> </xsl:text>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID = &apos;TRY&apos;">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="../../cbc:TaxAmount/@currencyID != &apos;TRY&apos;">
                                  <xsl:value-of select="../../cbc:TaxAmount/@currencyID" />
                                </xsl:if>
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                          <xsl:for-each select="./cac:WithholdingTaxTotal/cac:TaxSubtotal">
                            <xsl:if test="not(cbc:TaxAmount = 0)">
                              <xsl:choose>
                                <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=&apos;&apos;">
                                  <xsl:text>Di&#287;er Vergiler Toplam&#305; </xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text>Tevkifat (</xsl:text>
                                  <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode" />
                                  <xsl:text>-</xsl:text>
                                  <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name" />
                                  <xsl:text>)</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:if test="cbc:Percent !=&apos;&apos;">
                                <xsl:text>(%</xsl:text>
                                <xsl:value-of select=" format-number(cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                <xsl:text>)= </xsl:text>
                              </xsl:if>
                              <xsl:value-of select="format-number(../cbc:TaxAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                              <xsl:if test="../cbc:TaxAmount/@currencyID">
                                <xsl:if test="../cbc:TaxAmount/@currencyID = &apos;TRY&apos;">
                                  <xsl:text>TL</xsl:text>
                                </xsl:if>
                                <xsl:if test="../cbc:TaxAmount/@currencyID != &apos;TRY&apos;">
                                  <xsl:value-of select="../cbc:TaxAmount/@currencyID" />
                                </xsl:if>
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>-->
                <!--<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 13%; text-align: center;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:for-each select="./cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:if test="normalize-space(cac:TaxCategory/cbc:TaxExemptionReason)">
                            <xsl:value-of select="cac:TaxCategory/cbc:TaxExemptionReason"/>
                            <br/>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                    </span>
                  </span>
                </td> -->
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 16%; text-align: right;">
                  <span style="color: rgb(105, 105, 105);">
                    <span style="font-size: 10px;">
                      <span style="font-family: verdana,geneva,sans-serif;">
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="format-number(./cbc:LineExtensionAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                        <xsl:if test="./cbc:LineExtensionAmount/@currencyID">
                          <xsl:text> </xsl:text>
                          <xsl:if test="./cbc:LineExtensionAmount/@currencyID = &apos;TRY&apos; ">
                            <xsl:text>TL</xsl:text>
                          </xsl:if>
                          <xsl:if test="./cbc:LineExtensionAmount/@currencyID != &apos;TRY&apos; ">
                            <xsl:value-of select="./cbc:LineExtensionAmount/@currencyID"> </xsl:value-of>
                          </xsl:if>
                        </xsl:if>
                      </span>
                    </span>
                  </span>
                </td>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:DeliveryTerms/cbc:ID[@schemeID=&apos;INCOTERMS&apos;]"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:PackagingTypeCode"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:ID"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:Shipment/cac:TransportHandlingUnit/cac:ActualPackage/cbc:Quantity"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:DeliveryAddress"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:call-template name="TransportMode">
                            <xsl:with-param name="TransportModeType">
                              <xsl:value-of select="./cac:Delivery/cac:Shipment/cac:ShipmentStage/cbc:TransportModeCode"/>
                            </xsl:with-param>
                          </xsl:call-template>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
                <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
                  <td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6%; text-align: right;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:text>&#160;</xsl:text>
                          <xsl:value-of select="./cac:Delivery/cac:Shipment/cac:GoodsItem/cbc:RequiredCustomsID"/>
                        </span>
                      </span>
                    </span>
                  </td>
                </xsl:if>
              </tr>
            </xsl:for-each>


            <!--
						<tr>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 3%; text-align: left;">&#160;</td>
							<xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 6%; text-align: center;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 6%; text-align: center;">&#160;</td>
							</xsl:if>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10%; text-align: left;">
								<span style="color: rgb(105, 105, 105);">
									<span style="font-size: 10px;">
										<span style="font-family: verdana,geneva,sans-serif;">
											<xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
												<xsl:text> </xsl:text>
												<xsl:value-of select="./cbc:AllowanceChargeReason"/>
											</xsl:for-each>
										</span>
									</span>
								</span>
							</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 7%; text-align: center;">&#160;</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 6%; text-align: right;">&#160;</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 13%; text-align: right;">&#160;</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 7%; text-align: right;">
								<span style="color: rgb(105, 105, 105);">
									<span style="font-size: 10px;">
										<span style="font-family: verdana,geneva,sans-serif;">
											<xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
												<xsl:text/>
												<xsl:text>%</xsl:text>
												<xsl:value-of select="format-number(cbc:MultiplierFactorNumeric*100, &apos;###.##0,00&apos;, &apos;european&apos;)" />
											</xsl:for-each>
										</span>
									</span>
								</span>
							</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 11%; text-align: right;">
								<span style="color: rgb(105, 105, 105);">
									<span style="font-size: 10px;">
										<span style="font-family: verdana,geneva,sans-serif;">
											<xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
												<xsl:value-of select="format-number(cbc:Amount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
												<xsl:if test="cbc:Amount/@currencyID">
													<xsl:text/>
													<xsl:if test="cbc:Amount/@currencyID = &apos;TRY&apos;">
														<xsl:text>TL</xsl:text>
													</xsl:if>
													<xsl:if test="cbc:Amount/@currencyID != &apos;TRY&apos;">
														<xsl:value-of select="cbc:Amount/@currencyID" />
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</span>
									</span>
								</span>
							</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">&#160;</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">&#160;</td>
							<td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 8%; text-align: right;">&#160;</td>
							<xsl:if test="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID != &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 4%; text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(105, 105, 105); border-image: none; width: 10.6%; text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
							<xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;">
								<td condition="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos;" style="border: 0.05em solid rgb(132, 132, 132); border-image: none; width: 10.6% text-align: right;">&#160;</td>
							</xsl:if>
						</tr>
					
					-->
          </tbody>
        </table>
      </body>
    </html>
    <html>
      <head/>
      <body>
        <br/>
        <br/>
        <table class="alt_toplam_tablosu">
          <tbody>
            <tr>
              <td width="50%" valign="top"/>
              <td  width="50%">
                <div class="myframe">
                  <div class="toplam_satiri" >
                    <span class="alt_toplam_key" >Mal / Hizmet Toplam Tutar&#305;</span>
                    <span class="alt_toplam_sep">:</span>
                    <span class="alt_toplam_val" >
                      <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID">
                        <xsl:text> </xsl:text>
                        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID = &apos;TRY&apos;">
                          <xsl:text>TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != &apos;TRY&apos;">
                          <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID" />
                        </xsl:if>
                      </xsl:if>
                    </span>
                  </div>
                  <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos; and //n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos; and //n1:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason = &apos;Navlun&apos;">
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Navlun</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:choose>
                          <xsl:when test="//n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos;">
                            <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                              <xsl:if test="cbc:AllowanceChargeReason = &apos;Navlun&apos;">
                                <xsl:value-of select="format-number(cbc:Amount, &apos;###.##0,00&apos;, &apos;european&apos;)"/>
                                <xsl:if test="cbc:Amount/@currencyID">
                                  <xsl:text> </xsl:text>
                                  <xsl:if test="cbc:Amount/@currencyID = &apos;TRY&apos;">
                                    <xsl:text>&#160;TL </xsl:text>
                                  </xsl:if>
                                  <xsl:if test="cbc:Amount/@currencyID != &apos;TRY&apos;">
                                    &#160; <xsl:value-of select="cbc:Amount/@currencyID"/>
                                  </xsl:if>
                                </xsl:if>
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:when>
                        </xsl:choose>
                      </span>
                    </div>
                  </xsl:if>
                  <xsl:if test="//n1:Invoice/cbc:ProfileID = &apos;IHRACAT&apos; and //n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos; and //n1:Invoice/cac:AllowanceCharge/cbc:AllowanceChargeReason = &apos;Sigorta&apos;">
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Sigorta</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:choose>
                          <xsl:when test="//n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos;">
                            <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                              <xsl:if test="cbc:AllowanceChargeReason = &apos;Sigorta&apos;">
                                <xsl:value-of select="format-number(cbc:Amount, &apos;###.##0,00&apos;, &apos;european&apos;)"/>
                                <xsl:if test="cbc:Amount/@currencyID">
                                  <xsl:text/>
                                  <xsl:if test="cbc:Amount/@currencyID = &apos;TRY&apos;">
                                    <xsl:text>&#160;TL </xsl:text>
                                  </xsl:if>
                                  <xsl:if test="cbc:Amount/@currencyID != &apos;TRY&apos;">
                                    &#160; <xsl:value-of select="cbc:Amount/@currencyID"/>
                                  </xsl:if>
                                </xsl:if>
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:when>
                        </xsl:choose>
                      </span>
                    </div>
                  </xsl:if>
                  <div class="toplam_satiri" >
                    <span class="alt_toplam_key" >
                      <xsl:text>Toplam &#304;skonto</xsl:text>
                      <xsl:if test="//n1:Invoice/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
                        <xsl:text>(%</xsl:text>
                        <xsl:value-of select="format-number((//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount*100) div //n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </span>
                    <span class="alt_toplam_sep">:</span>
                    <span class="alt_toplam_val" >
                      <xsl:value-of select="format-number(//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                      <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID">
                        <xsl:text> </xsl:text>
                        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID = &apos;TRY&apos;">
                          <xsl:text>TL</xsl:text>
                        </xsl:if>
                        <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID != &apos;TRY&apos;">
                          <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount/@currencyID" />
                        </xsl:if>
                      </xsl:if>
                    </span>
                  </div>
                  <xsl:if test="//n1:Invoice/cac:AllowanceCharge/cbc:MultiplierFactorNumeric">
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Toplam Masraf</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" />
                    </div>
                  </xsl:if>
                  <div class="toplam_satiri" >
                    <span class="alt_toplam_key" >
                      <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                          <table id="taxSubtotalHeaderTable" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr  >
                                <td  >
                                  <xsl:choose>
                                    <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=&apos;&apos;">
                                      <xsl:text>Di&#65533;er Vergiler Toplam&#65533; </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:text>Hesaplanan </xsl:text>
                                      <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name" />
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <xsl:text>(%</xsl:text>
                                  <xsl:value-of select=" format-number(cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                  <xsl:text>)</xsl:text>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </xsl:if>
                      </xsl:for-each>
                    </span>
                    <span class="alt_toplam_sep">:</span>
                    <span class="alt_toplam_val" >
                      <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                        <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                          <table id="taxSubtotalsTable" cellpadding="0" cellspacing="0" align="right" style="clear:both" width="100%">
                            <tbody>
                              <tr id="budgetContainerTr" align="right" style="border-bottom: 1px solid #000;">
                                <td align="right">
                                  <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                    <xsl:value-of select="format-number(../../cbc:TaxAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                      <xsl:text> </xsl:text>
                                      <xsl:if test="../../cbc:TaxAmount/@currencyID = &apos;TRY&apos;">
                                        <xsl:text>TL</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="../../cbc:TaxAmount/@currencyID != &apos;TRY&apos;">
                                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID" />
                                      </xsl:if>
                                    </xsl:if>
                                  </xsl:for-each>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </xsl:if>
                      </xsl:for-each>
                    </span>
                  </div>
                  <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >
                        <xsl:choose>
                          <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=&apos;&apos;">
                            <xsl:text>Di&#287;er Vergiler Toplam&#305; </xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>Tevkifat </xsl:text>
                            <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name" />
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>(%</xsl:text>
                        <xsl:value-of select=" format-number(cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                        <xsl:text>)</xsl:text>
                      </span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val">
                        <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                          <table id="taxSubtotalsTable" cellpadding="0" cellspacing="0" align="right" style="clear:both" width="100%">
                            <tbody>
                              <tr id="budgetContainerTr" align="right">
                                <td align="right">
                                  <xsl:for-each select="cac:TaxCategory/cac:TaxScheme">
                                    <xsl:value-of select="format-number(../../cbc:TaxAmount, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                    <xsl:if test="../../cbc:TaxAmount/@currencyID">
                                      <xsl:text> </xsl:text>
                                      <xsl:if test="../../cbc:TaxAmount/@currencyID = &apos;TRY&apos;">
                                        <xsl:text>TL</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="../../cbc:TaxAmount/@currencyID != &apos;TRY&apos;">
                                        <xsl:value-of select="../../cbc:TaxAmount/@currencyID" />
                                      </xsl:if>
                                    </xsl:if>
                                  </xsl:for-each>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </xsl:if>
                      </span>
                    </div>
                  </xsl:for-each>
                  <div class="toplam_satiri" >
                    <span class="alt_toplam_key" >Vergiler Dahil Toplam Tutar</span>
                    <span class="alt_toplam_sep">:</span>
                    <span class="alt_toplam_val" >
                      <xsl:for-each select="//n1:Invoice">
                        <xsl:for-each select="cac:LegalMonetaryTotal">
                          <xsl:for-each select="cbc:TaxInclusiveAmount">
                            <xsl:value-of select="format-number(., &apos;###.##0,00&apos;, &apos;european&apos;)" />
                            <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID">
                              <xsl:text> </xsl:text>
                              <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID = &apos;TRY&apos;">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID != &apos;TRY&apos;">
                                <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount/@currencyID"> </xsl:value-of>
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </xsl:for-each>
                      </xsl:for-each>
                    </span>
                  </div>
                  <div class="toplam_satiri" >
                    <span class="alt_toplam_key" >&#214;denecek Tutar</span>
                    <span class="alt_toplam_sep">:</span>
                    <span class="alt_toplam_val" >
                      <xsl:for-each select="//n1:Invoice">
                        <xsl:for-each select="cac:LegalMonetaryTotal">
                          <xsl:for-each select="cbc:PayableAmount">
                            <xsl:value-of select="format-number(., &apos;###.##0,00&apos;, &apos;european&apos;)" />
                            <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID">
                              <xsl:text> </xsl:text>
                              <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID = &apos;TRY&apos;">
                                <xsl:text>TL</xsl:text>
                              </xsl:if>
                              <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID != &apos;TRY&apos;">
                                <xsl:value-of select="//n1:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID" />
                              </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </xsl:for-each>
                      </xsl:for-each>
                    </span>
                  </div>
                  <xsl:if test="//n1:Invoice/cac:LegalMonetaryTotal/cbc:LineExtensionAmount/@currencyID != &apos;TRY&apos;">
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >
                        D&#246;viz Kuru (<xsl:value-of select="//n1:Invoice/cac:PricingExchangeRate/cbc:TargetCurrencyCode" />)
                      </span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:value-of select="format-number(//n1:Invoice/cac:PricingExchangeRate/cbc:CalculationRate, &apos;###.##0,0000&apos;, &apos;european&apos;)" />
                        <xsl:text> </xsl:text>
                        <xsl:text>TL</xsl:text>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Mal / Hizmet Toplam Tutar&#305;</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                          <xsl:if test="cbc:DocumentType = &apos;LINEEXTENSIONAMOUNT&apos;">
                            <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:text> </xsl:text>
                        <xsl:text>TL</xsl:text>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Navlun</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:choose>
                          <xsl:when test="//n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos;">
                            <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                              <xsl:if test="cbc:AllowanceChargeReason = &apos;Navlun&apos;">
                                <xsl:value-of select="format-number(cbc:Amount * ../cac:PricingExchangeRate/cbc:CalculationRate, &apos;###.##0,00&apos;, &apos;european&apos;)"/>
                                <xsl:text>&#160;TL </xsl:text>
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:when>
                        </xsl:choose>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Sigorta</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:choose>
                          <xsl:when test="//n1:Invoice/cac:AllowanceCharge and //n1:Invoice/cac:AllowanceCharge/cbc:ChargeIndicator = &apos;true&apos;">
                            <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                              <xsl:if test="cbc:AllowanceChargeReason = &apos;Sigorta&apos;">
                                <xsl:value-of select="format-number(cbc:Amount * ../cac:PricingExchangeRate/cbc:CalculationRate, &apos;###.##0,00&apos;, &apos;european&apos;)"/>
                                <xsl:text>&#160;TL </xsl:text>
                              </xsl:if>
                            </xsl:for-each>
                          </xsl:when>
                        </xsl:choose>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Toplam &#304;skonto</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                          <xsl:if test="cbc:DocumentType = &apos;ALLOWANCETOTALAMOUNT&apos;">
                            <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:text> </xsl:text>
                        <xsl:text>TL</xsl:text>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Toplam Masraf</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" />
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >
                        <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                            <table id="taxSubtotalHeaderTable" cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                <tr >
                                  <td >
                                    <span style="font-weight:bold; ">
                                      <xsl:choose>
                                        <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=&apos;&apos;">
                                          <xsl:text>Di&#65533;er Vergiler Toplam&#65533; </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:text>Hesaplanan </xsl:text>
                                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name" />
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:text>(%</xsl:text>
                                      <xsl:value-of select=" format-number(cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                      <xsl:text>)</xsl:text>
                                    </span>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal">
                          <xsl:variable name="var_Percent" select="cbc:Percent"/>
                          <xsl:variable name="var_TaxTypeCode" select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                          <xsl:text> </xsl:text>
                          <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                            <xsl:variable name="var_DocumentType" select="cbc:DocumentType"/>
                            <xsl:variable name="var_DocumentTypeCode" select="cbc:DocumentTypeCode"/>
                            <xsl:if test="$var_DocumentType = $var_Percent and $var_DocumentTypeCode = $var_TaxTypeCode and not($var_Percent = &apos;0.0000&apos;) ">
                              <table id="taxSubtotalsTable" border="0" cellpadding="0" cellspacing="0" align="right" tagid="taxtable" style="clear:both" width="100%">
                                <tbody>
                                  <tr id="budgetContainerTr" align="right">
                                    <td align="right">
                                      <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                      <xsl:text> </xsl:text>
                                      <xsl:text>TL </xsl:text>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </xsl:if>
                          </xsl:for-each>
                        </xsl:for-each>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >
                        <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
                          <xsl:if test="not(cbc:Percent = 0.0000) or not(cbc:TaxAmount = 0)">
                            <table id="taxSubtotalHeaderTable" cellpadding="0" cellspacing="0" width="100%">
                              <tbody>
                                <tr >
                                  <td >
                                    <span style="font-weight:bold; ">
                                      <xsl:choose>
                                        <xsl:when test="cac:TaxCategory/cac:TaxScheme/cbc:Name=&apos;&apos;">
                                          <xsl:text>Di&#287;er Vergiler Toplam&#305; </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <xsl:text>Tevkifat </xsl:text>
                                          <xsl:value-of select="cac:TaxCategory/cac:TaxScheme/cbc:Name" />
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:text>(%</xsl:text>
                                      <xsl:value-of select=" format-number(cbc:Percent, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                      <xsl:text>)</xsl:text>
                                    </span>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </xsl:if>
                        </xsl:for-each>
                      </span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:WithholdingTaxTotal/cac:TaxSubtotal">
                          <xsl:variable name="var_Percent" select="cbc:Percent"/>
                          <xsl:variable name="var_TaxTypeCode" select="cac:TaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>
                          <xsl:text> </xsl:text>
                          <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                            <xsl:variable name="var_DocumentType" select="cbc:DocumentType"/>
                            <xsl:variable name="var_DocumentTypeCode" select="cbc:DocumentTypeCode"/>
                            <xsl:choose>
                              <xsl:when test="string(number($var_Percent)) != &apos;NaN&apos; and string(number($var_DocumentType)) != &apos;NaN&apos;">
                                <xsl:if test="(number($var_DocumentType) = number($var_Percent)) and $var_DocumentTypeCode = $var_TaxTypeCode and not(number($var_Percent) = 0) ">
                                  <table id="taxSubtotalsTable" border="0" cellpadding="0" cellspacing="0" align="right" tagid="taxtable" style="clear:both" width="100%">
                                    <tbody>
                                      <tr id="budgetContainerTr" align="right" height="80">
                                        <td align="right" style="border-bottom: 1px solid #a4a4a4;">
                                          <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                          <xsl:text> </xsl:text>
                                          <xsl:text>TL </xsl:text>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </xsl:if>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:if test="$var_DocumentType = $var_Percent and $var_DocumentTypeCode = $var_TaxTypeCode and not($var_Percent = &apos;0.0000&apos;) ">
                                  <table id="taxSubtotalsTable" border="0" cellpadding="0" cellspacing="0" align="right" tagid="taxtable" style="clear:both" width="100%">
                                    <tbody>
                                      <tr id="budgetContainerTr" align="right" height="80">
                                        <td align="right" style="border-bottom: 1px solid #a4a4a4;">
                                          <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                                          <xsl:text> </xsl:text>
                                          <xsl:text>TL </xsl:text>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </xsl:if>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        </xsl:for-each>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >Vergiler Dahil Toplam Tutar</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                          <xsl:if test="cbc:DocumentType = &apos;TAXINCLUSIVEAMOUNT&apos;">
                            <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:text> </xsl:text>
                        <xsl:text>TL</xsl:text>
                      </span>
                    </div>
                    <div class="toplam_satiri" >
                      <span class="alt_toplam_key" >&#214;denecek Tutar</span>
                      <span class="alt_toplam_sep">:</span>
                      <span class="alt_toplam_val" >
                        <xsl:for-each select="//n1:Invoice/cac:AdditionalDocumentReference">
                          <xsl:if test="cbc:DocumentType = &apos;PAYABLEAMOUNT&apos;">
                            <xsl:value-of select="format-number(cbc:ID, &apos;###.##0,00&apos;, &apos;european&apos;)" />
                          </xsl:if>
                        </xsl:for-each>
                        <xsl:text> </xsl:text>
                        <xsl:text>TL</xsl:text>
                      </span>
                    </div>
                  </xsl:if>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
        <p>&#160;</p>
        <xsl:if test="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode=&apos;OKCBF&apos;">
          <table style="border: 2px solid rgb(0, 0, 0); border-image: none; width: 800px; border-collapse: collapse;">
            <thead>
              <tr>
                <th colspan="6">&#214;KC Bilgileri</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">Fi&#351; Numaras&#305;</span>
                      </span>
                    </strong>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">Fi&#351; Tarihi</span>
                      </span>
                    </strong>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">Fi&#65533;&#65533; Saati</span>
                      </span>
                    </strong>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">Fi&#351; Tipi</span>
                      </span>
                    </strong>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">Z Rapor No</span>
                      </span>
                    </strong>
                  </span>
                </td>
                <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                  <span style="font-size: 9px;">
                    <strong>
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: verdana,geneva,sans-serif;">&#214;KC Seri No</span>
                      </span>
                    </strong>
                  </span>
                </td>
              </tr>
              <xsl:for-each select="//n1:Invoice/cac:BillingReference/cac:AdditionalDocumentReference/cbc:DocumentTypeCode[text()=&apos;OKCBF&apos;]">
                <tr>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="../cbc:ID"/>
                        </span>
                      </span>
                    </span>
                  </td>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="../cbc:IssueDate" />
                        </span>
                      </span>
                    </span>
                  </td>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="substring(../cac:ValidityPeriod/cbc:StartTime,1,5)" />
                        </span>
                      </span>
                    </span>
                  </td>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:choose>
                            <xsl:when test="../cbc:DocumentDescription=&apos;AVANS&apos;">
                              <xsl:text>&#214;n Tahsilat(Avans) Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;YEMEK_FIS&apos;">
                              <xsl:text>Yemek Fi&#351;i/Kart&#305; ile Yap&#305;lan Tahsilat Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;E-FATURA&apos;">
                              <xsl:text>E-Fatura Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;E-FATURA_IRSALIYE&apos;">
                              <xsl:text>&#304;rsaliye Yerine Ge&#231;en E-Fatura Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;E-ARSIV&apos;">
                              <xsl:text>E-Ar&#351;iv Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;E-ARSIV_IRSALIYE&apos;">
                              <xsl:text>&#304;rsaliye Yerine Ge&#231;en E-Ar&#351;iv Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;FATURA&apos;">
                              <xsl:text>Fatural&#305; Sat&#305;&#351; Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;OTOPARK&apos;">
                              <xsl:text>Otopark Giri&#351; Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;FATURA_TAHSILAT&apos;">
                              <xsl:text>Fatura Tahsilat Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:when test="../cbc:DocumentDescription=&apos;FATURA_TAHSILAT_KOMISYONLU&apos;">
                              <xsl:text>Komisyonlu Fatura Tahsilat Bilgi Fi&#351;i</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:text/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </span>
                      </span>
                    </span>
                  </td>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="../cac:Attachment/cac:ExternalReference/cbc:URI" />
                        </span>
                      </span>
                    </span>
                  </td>
                  <td style="border: 0.05em solid rgb(132, 132, 132); border-image: none; text-align: center;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-size: 10px;">
                        <span style="font-family: verdana,geneva,sans-serif;">
                          <xsl:value-of select="../cac:IssuerParty/cbc:EndpointID" />
                        </span>
                      </span>
                    </span>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:if>
        <p>&#160;</p>
        <table  class="fatura_not_container_w_box" style="width: 800px; margin-top: 6px;">
          <tbody>
            <tr>
              <td align="left">
                <p style="margin-left: 20px;">
                  <br />
                  <span style="font-size: 11px;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-family: tahoma,geneva,sans-serif;">
                        <xsl:if test="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote">
                          <b>&#214;deme Notu :</b>
                          <xsl:value-of select="//n1:Invoice/cac:PaymentMeans/cbc:InstructionNote"/>
                          <br />
                        </xsl:if>
                        <xsl:if test="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote">
                          <b>Hesap A&#231;&#305;klamas&#305; :</b>
                          <xsl:value-of select="//n1:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:PaymentNote"/>
                          <br />
                        </xsl:if>
                        <xsl:if test="//n1:Invoice/cac:PaymentTerms/cbc:Note">
                          <b>&#214;deme Ko&#351;ulu :</b>
                          <xsl:value-of select="//n1:Invoice/cac:PaymentTerms/cbc:Note"/>
                          <br />
                        </xsl:if>
                        <xsl:if test="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason">
                          <b>Vergi Muafiyet Sebebi :</b>
                          <xsl:value-of select="//n1:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason"/>
                          <br />
                        </xsl:if>
                        <br />

                        <xsl:if test="//n1:Invoice/cbc:Note">
                          <b>Genel A&#231;&#305;klamalar</b>
                          <br />
                          <xsl:for-each select="//n1:Invoice/cbc:Note">
                            <xsl:value-of select="."/>
                            <br />
                          </xsl:for-each>
						  <p id="firmNotes"><p style='margin-left: 40px;'>İşletme Merkezi: Ehlibeyt Mah. Mevlana Bulvarı No:199-A 06520 Balgat, Çankaya, Ankara, Telefon: 0312 583 73 00, Fax: 0312-473 70 41 – 42,Kavaklıdere V.D. 575 004 6974, Ticari Sicili: 126487, Mersis No: 0575004697400029, Sermayesi: 193.000.000 TL www.koluman.com.tr<br/>Şube: Otomobil Showroom ve Servisi: Koluman Motorlu Araçlar Ticaret ve Sanayi A.Ş. Ankara Şube, Mercedes-Benz Türk A.Ş. Bayi.Ehlibeyt Mah.Mevlana Bulvarı No.199/A 06520 Çankaya, ANKARA. Telefon: 0312 583 73 00 Faks: 0312 473 70 41-42, Kavaklıdere V.D. 575 004 6974 ,Ticaret Sicil No: ANKARA-126487, Mersis No: 0575 0046 9740 0066, Sermaye: 193.000.000.-TL, www.koluman.com.tr<br/>Banka Bilgileri<br/>İş Bankası Başkent Kurumsal Şb. - TRY TR77 0006 4000 0014 3990 0208 23<br/>İş Bankası Başkent Kurumsal Şb. - EUR TR26 0006 4000 0024 3990 0501 57<br/>Akbank Başkent Kurumsal Şb. - TRY TR63 0004 6008 3288 8000 0396 62<br/>Akbank Başkent Kurumsal Şb. - EUR TR63 0004 6008 3203 6000 0594 15<br/>Garanti Bankası Ankara Ticari Şb. - TRY TR62 0006 2000 1700 0006 2948 31<br/>Garanti Bankası Ankara Ticari Şb. - EUR TR64 0006 2000 1700 0009 0932 45<br/>1-İşbu fatura muhteviyatına ibrazından itibaren 8 gün içinde itiraz edilmediği takdirde kabul edilmiş sayılır.<br/>2-Mal müşterinin hesabına ve rizikosuna sevk edilir.<br/>3-Fatura tarihinden itibaren 10 gün içinde ödenmemesi halinde aylık %8 gecikme zammı uygulanacaktır.<br/>4-Kısmı ödemeler öncelikle vade farkına mahsup edilir.<br/>Koluman Motorlu Araçlar Ticaret ve Sanayi A.S. Mercedes-Benz marka otomobil, otobüs, kamyon ve hafif ticari araç satısı, ayrıca otomobil ve bütün ticari araçlar servisi için yetkili bayidir.<br/></p></p>
                        </xsl:if>
                      </span>
                    </span>
                  </span>
                </p>
              </td>
            </tr>
            <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;EINVOICE&apos;]/cbc:DocumentType=3">
              <tr>
                <td>
                  <span style="font-size: 11px;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-family: tahoma,geneva,sans-serif;">
                        <strong>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#304;nternet Sat&#305;&#351; Bilgileri:</strong>
                      </span>
                    </span>
                  </span>
                  <br />
                  <span style="font-size: 11px;">
                    <span style="color: rgb(105, 105, 105);">
                      <span style="font-family: tahoma,geneva,sans-serif;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Bu sat&#305;&#351; internet &#252;zerinden yap&#305;lm&#305;&#351;t&#305;r.</span>
                    </span>
                  </span>
                  <br />
                  <br />
                  <span condition="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/webAdresi&apos;]/cbc:DocumentType)" style="margin-left: 40px;">
                    <span style="font-size: 11px;">
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: tahoma,geneva,sans-serif;">
                          <strong>Sat&#305;&#351; &#304;&#351;leminin Yap&#305;ld&#305;&#287;&#305; Web Adresi: </strong>
                          <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/webAdresi&apos;]/cbc:DocumentType" />
                        </span>
                      </span>
                    </span>
                  </span>
                  <br />
                  <span condition="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeAracisiAdi&apos;]/cbc:DocumentType)" style="margin-left: 40px;">
                    <span style="font-size: 11px;">
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: tahoma,geneva,sans-serif;">
                          <strong>&#214;deme Arac&#305;s&#305;: </strong>
                          <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeAracisiAdi&apos;]/cbc:DocumentType" />
                        </span>
                      </span>
                    </span>
                  </span>
                  <br />
                  <span condition="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeSekli&apos;]/cbc:DocumentType)" style="line-height: 1.6em; margin-left: 40px;">
                    <span style="font-size: 11px;">
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: tahoma,geneva,sans-serif;">
                          <strong>&#214;deme &#351;ekli: </strong>
                          <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeSekli&apos;]/cbc:DocumentType" />
                        </span>
                      </span>
                    </span>
                  </span>
                  <br />
                  <span condition="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeTarihi&apos;]/cbc:DocumentType)" style="line-height: 1.6em; margin-left: 40px;">
                    <span style="font-size: 11px;">
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: tahoma,geneva,sans-serif;">
                          <strong>&#214;deme Tarihi: </strong>
                          <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/odemeTarihi&apos;]/cbc:DocumentType" />
                        </span>
                      </span>
                    </span>
                  </span>
                  <br />
                  <span condition="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderimTarihi&apos;]/cbc:DocumentType)" style="line-height: 1.6em; margin-left: 40px;">
                    <span style="font-size: 11px;">
                      <span style="color: rgb(105, 105, 105);">
                        <span style="font-family: tahoma,geneva,sans-serif;">
                          <strong>G&#246;nderim Tarihi: </strong>
                          <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderimTarihi&apos;]/cbc:DocumentType" />
                        </span>
                      </span>
                    </span>
                  </span>
                  <br />
                  <xsl:if test="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/gercekKisi/tckn&apos;]/cbc:DocumentType)">
                    <span style="line-height: 1.6em; margin-left: 40px;">
                      <span style="font-size: 11px;">
                        <span style="color: rgb(105, 105, 105);">
                          <span style="font-family: tahoma,geneva,sans-serif;">
                            <strong>G&#246;nderiyi ta&#351;&#305;yan TCKN: </strong>
                            <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/gercekKisi/tckn&apos;]/cbc:DocumentType" />
                          </span>
                        </span>
                      </span>
                    </span>
                    <br />
                  </xsl:if>


                  <xsl:if test="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/tuzelKisi/vkn&apos;]/cbc:DocumentType)">
                    <span style="line-height: 1.6em; margin-left: 40px;">
                      <span style="font-size: 11px;">
                        <span style="color: rgb(105, 105, 105);">
                          <span style="font-family: tahoma,geneva,sans-serif;">
                            <strong>G&#246;nderiyi ta&#351;&#305;yan VKN: </strong>
                            <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/tuzelKisi/vkn&apos;]/cbc:DocumentType" />
                          </span>
                        </span>
                      </span>
                    </span>
                    <br />
                  </xsl:if>

                  <xsl:if test="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/gercekKisi/adiSoyadi&apos;]/cbc:DocumentType)">
                    <span style="line-height: 1.6em; margin-left: 40px;">
                      <span style="font-size: 11px;">
                        <span style="color: rgb(105, 105, 105);">
                          <span style="font-family: tahoma,geneva,sans-serif;">
                            <strong>G&#246;nderiyi ta&#351;&#305;yan ad&#305; soyad&#305;: </strong>
                            <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/gercekKisi/adiSoyadi&apos;]/cbc:DocumentType" />
                          </span>
                        </span>
                      </span>
                    </span>
                    <br />
                  </xsl:if>


                  <xsl:if test="normalize-space(//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/tuzelKisi/unvan&apos;]/cbc:DocumentType)">
                    <span style="line-height: 1.6em; margin-left: 40px;">
                      <span style="font-size: 11px;">
                        <span style="color: rgb(105, 105, 105);">
                          <span style="font-family: tahoma,geneva,sans-serif;">
                            <strong>G&#246;nderiyi ta&#351;&#305;yan unvan&#305;: </strong>
                            <xsl:value-of select="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID = &apos;internetSatisBilgi/gonderiBilgileri/gonderiTasiyan/tuzelKisi/unvan&apos;]/cbc:DocumentType" />
                          </span>
                        </span>
                      </span>
                    </span>
                    <br />
                  </xsl:if>


                  <table border="0" cellpadding="0" cellspacing="0" condition="//n1:Invoice/cac:AdditionalDocumentReference/cbc:ID =&apos;EINVOICE&apos; and //n1:Invoice/cac:AdditionalDocumentReference/cbc:DocumentType =3" style="margin-top: 30px;">
                    <tbody>
                      <tr>
                        <td>
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">
                                <strong>&#160;&#160;&#160;&#160;&#160;&#304;ade B&#246;l&#252;m&#252;</strong>
                              </span>
                            </span>
                          </span>
                          <table border="1" bordercolor="#a4a4a4" cellpadding="0" cellspacing="0" style="margin-left: 40px;">
                            <tbody>
                              <tr id="budgetContainerTr">
                                <td id="lineTableBudgetTd" style="width: 290px;">
                                  <span style="margin-left: 40px;">
                                    <span style="font-size: 11px;">
                                      <span style="color: rgb(105, 105, 105);">
                                        <span style="font-family: tahoma,geneva,sans-serif;">
                                          <span style="font-weight: bold;">Mal&#305;n Cinsi</span>
                                        </span>
                                      </span>
                                    </span>
                                  </span>
                                </td>
                                <td id="lineTableBudgetTd" style="width: 100px;">
                                  <span style="margin-left: 40px;">
                                    <span style="font-size: 11px;">
                                      <span style="color: rgb(105, 105, 105);">
                                        <span style="font-family: tahoma,geneva,sans-serif;">
                                          <span style="font-weight: bold;">Mal&#305;n Miktar&#305;</span>
                                        </span>
                                      </span>
                                    </span>
                                  </span>
                                </td>
                                <td id="lineTableBudgetTd" style="width: 150px;">
                                  <span style="margin-left: 40px;">
                                    <span style="font-size: 11px;">
                                      <span style="color: rgb(105, 105, 105);">
                                        <span style="font-family: tahoma,geneva,sans-serif;">
                                          <span style="font-weight: bold;">Birim Fiyat&#305;</span>
                                        </span>
                                      </span>
                                    </span>
                                  </span>
                                </td>
                                <td id="lineTableBudgetTd" style="width: 150px;">
                                  <span style="margin-left: 40px;">
                                    <span style="font-size: 11px;">
                                      <span style="color: rgb(105, 105, 105);">
                                        <span style="font-family: tahoma,geneva,sans-serif;">
                                          <span style="font-weight: bold;">Tutar</span>
                                        </span>
                                      </span>
                                    </span>
                                  </span>
                                </td>
                              </tr>
                              <tr id="budgetContainerTr">
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                              </tr>
                              <tr id="budgetContainerTr">
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                              </tr>
                              <tr id="budgetContainerTr">
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                              </tr>
                              <tr id="budgetContainerTr">
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                                <td id="lineTableBudgetTd">
                                  <span style="margin-left: 40px;">&#160;</span>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                          <br />
                          <br />
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">
                                <span style="font-weight: bold;">&#160;&#160;&#160;&#160;&#160;Mal&#305; &#304;ade Edenin</span>
                              </span>
                            </span>
                          </span>
                          <br />
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">
                                <span style="font-weight: bold;">&#160;&#160;&#160;&#160;&#160;Ad&#305; Soyad&#305;</span>
                              </span>
                            </span>
                          </span>
                          <br />
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">
                                <span style="font-weight: bold;">&#160;&#160;&#160;&#160;&#160;Adresi</span>
                              </span>
                            </span>
                          </span>
                          <br />
                          <br />
                          <br />
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">
                                <span style="font-weight: bold;">&#160;&#160;&#160;&#160;&#160;&#304;mzas&#305;</span>
                              </span>
                            </span>
                          </span>
                          <br />
                          <br />
                          <br /> &#160; 	<span style="margin-left: 40px;"> </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>

            </xsl:if>
          </tbody>
          <table border="0" cellpadding="0" cellspacing="0" style="width: 800px;">
            <tbody>
              <tr>
                <td>
                  <p style="margin-left: 40px;">

                    <!--<xsl:if test="(//n1:Invoice/cbc:ProfileID = &apos;EARSIVFATURA&apos;)">-->
                    <br />
                    <b>
                      <span style="color:red;">
                        <xsl:text>e-Ar&#351;iv faturalar&#305;n&#305;z&#305; elektronik ortamda g&#246;r&#252;nt&#252;lemek ve indirilebilmek i&#231;in &quot;</xsl:text>
                        <a target="_blank" href="https://faturasorgulama.elogo.com.tr">
                          <xsl:text>https://faturasorgulama.elogo.com.tr</xsl:text>
                        </a>
                        <xsl:text>&quot; platformunu kullanabilirsiniz.</xsl:text>
                      </span>
                    </b>
                    <!--</xsl:if>-->
                    <xsl:if test="//n1:Invoice/cac:AdditionalDocumentReference[cbc:ID =&apos;gonderimSekli&apos;]/cbc:DocumentType =&apos;ELEKTRONIK&apos;">
                      <div style="text-align: center;">
                        <span style="margin-left: 40px;">
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">e-Ar&#351;iv izni kapsam&#305;nda elektronik ortamda iletilmi&#351;tir.</span>
                            </span>
                          </span>
                        </span>
                      </div>
                    </xsl:if>
                    <xsl:if test="not(//n1:Invoice/cac:DespatchDocumentReference) and //n1:Invoice/cbc:ProfileID !=&apos;IHRACAT&apos;">
                      <div style="text-align: center;">
                        <span style="margin-left: 40px;">
                          <span style="font-size: 11px;">
                            <span style="color: rgb(105, 105, 105);">
                              <span style="font-family: tahoma,geneva,sans-serif;">&#304;rsaliye yerine ge&#231;er.</span>
                            </span>
                          </span>
                        </span>
                      </div>
                    </xsl:if>
                  </p>
                </td>
              </tr>
            </tbody>
          </table>
        </table>
        <br/>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="TransportMode">
    <xsl:param name="TransportModeType"/>
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
  <xsl:template name="geneliskonto">
    <tr id="lineTableTr" >
      <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
      <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="left">
        <span>
          <table border="0">
            <tbody>
              <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                <tr>
                  <td>
                    <xsl:text>&#160;&#160;&#160;&#160;&#160;</xsl:text>
                    <xsl:text>İndirim</xsl:text>
                  </td>
                </tr>
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
          <table border="0">
            <tbody>
              <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                <tr>
                  <td>
                    <xsl:choose>
                      <xsl:when test="normalize-space(cbc:AllowanceChargeReason)">
                        <xsl:value-of select="cbc:AllowanceChargeReason"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:if test ="normalize-space(cbc:MultiplierFactorNumeric)">
                          <xsl:text>%</xsl:text>
                          <xsl:value-of select="format-number(cbc:MultiplierFactorNumeric*100, '###.##0,00', 'european')"/>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </span>
      </td>
      <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
        <span>
          <table border="0">
            <tbody>
              <xsl:for-each select="//n1:Invoice/cac:AllowanceCharge">
                <tr>
                  <td>
                    <xsl:value-of select="format-number(cbc:Amount, '###.##0,00', 'european')"/>
                    <xsl:if test="cbc:Amount/@currencyID">
                      <xsl:text> </xsl:text>
                      <xsl:if test="cbc:Amount/@currencyID = 'TRY'">
                        <xsl:text>TL</xsl:text>
                      </xsl:if>
                      <xsl:if test="cbc:Amount/@currencyID != 'TRY'">
                        <xsl:value-of select="cbc:Amount/@currencyID"/>
                      </xsl:if>
                    </xsl:if>
                  </td>
                </tr>
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
      <td id="lineTableTd" style="border-top:thick double black; border-top-width:3px;" align="right">
        <span>
          <xsl:text>&#160;</xsl:text>
        </span>
      </td>
    </tr>
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
</xsl:stylesheet>