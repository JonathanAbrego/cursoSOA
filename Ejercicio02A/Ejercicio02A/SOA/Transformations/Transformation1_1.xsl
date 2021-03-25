<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://www.bwr.mx" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://xmlns.oracle.com/Ejercicio02A/Ejercicio02A/TransformaSalida">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransformaSalida.wsdl"/>
            <oracle-xsl-mapper:rootElement name="entrada" namespace="http://www.bwr.mx"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransformaSalida.wsdl"/>
            <oracle-xsl-mapper:rootElement name="salida" namespace="http://www.bwr.mx"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [THU MAR 25 12:29:48 CST 2021].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <ns0:salida>
         <xsl:attribute name="empresa">
            <xsl:value-of select="/ns0:entrada/ns0:empresa/ns0:nombre_empresa"/>
         </xsl:attribute>
         <xsl:for-each select="/ns0:entrada/ns0:departamentos/ns0:departamento">
            <ns0:departamento>
               <xsl:attribute name="id">
                  <xsl:value-of select="@id"/>
               </xsl:attribute>
               <xsl:attribute name="nombre">
                  <xsl:value-of select="current ( )"/>
               </xsl:attribute>
               <xsl:variable name="auxDpto" select="@id"/>
               <xsl:for-each select="/ns0:entrada/ns0:empleados/ns0:empleado">
                  <xsl:if test="@dpto = '*'">
                     <ns0:empelado id="{@id}">
                        <xsl:value-of select="current ( )"/>
                     </ns0:empelado>
                  </xsl:if>
                  <xsl:if test="@dpto = $auxDpto">
                     <ns0:empelado id="{@id}">
                        <xsl:value-of select="current ( )"/>
                     </ns0:empelado>
                  </xsl:if>

               </xsl:for-each>
               <ns0:fecha>
                  <xsl:value-of select="xp20:format-dateTime (xp20:current-date(), &quot;[D01]-[M01]-[Y0001]&quot; )"/>
               </ns0:fecha>
            </ns0:departamento>
         </xsl:for-each>
      </ns0:salida>
   </xsl:template>
</xsl:stylesheet>
