<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://www.bwr.mx" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://xmlns.oracle.com/Eleven/Eleven/BPELFtp"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/ftp/Eleven/Eleven/ftpEscribeXML"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/BPELFtp.wsdl"/>
            <oracle-xsl-mapper:rootElement name="moneda" namespace="http://www.bwr.mx"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/BPELFtp.wsdl"/>
            <oracle-xsl-mapper:rootElement name="expenses" namespace="http://www.bwr.mx"/>
            <oracle-xsl-mapper:param name="InputVariable.payload"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/ftpEscribeXML.wsdl"/>
            <oracle-xsl-mapper:rootElement name="gastos" namespace="http://www.bwr.mx"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [FRI APR 09 12:06:30 CDT 2021].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="InputVariable.payload"/>
   <xsl:template match="/">
      <ns0:gastos>
         <ns0:id>
            <xsl:value-of select="$InputVariable.payload/ns0:expenses/@id"/>
         </ns0:id>
         <ns0:fecha>
            <xsl:value-of select="$InputVariable.payload/ns0:expenses/@fecha"/>
         </ns0:fecha>
         <xsl:for-each select="$InputVariable.payload/ns0:expenses/ns0:rows/ns0:row">
            <xsl:if test="/ns0:moneda/ns0:actual = ns0:country">
               <ns0:gasto>
                  <ns0:uuid>
                     <xsl:value-of select="ns0:uuid"/>
                  </ns0:uuid>
                  <ns0:subtotal>
                     <xsl:value-of select="ns0:amount"/>
                  </ns0:subtotal>
                  <ns0:impuesto>
                     <xsl:value-of select="ns0:tax"/>
                  </ns0:impuesto>
                  <ns0:pais>
                     <xsl:value-of select="ns0:country"/>
                  </ns0:pais>
               </ns0:gasto>
            </xsl:if>
         </xsl:for-each>
      </ns0:gastos>
   </xsl:template>
</xsl:stylesheet>
