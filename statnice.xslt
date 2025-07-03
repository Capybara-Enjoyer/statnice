<?xml version="1.0" encoding="UTF-8"?>
<!--
     XSLT for transforming statnice.xml to XSL-FO for PDF generation.
     Use with Apache FOP: fop -xml statnice.xml -xsl statnice.xslt -pdf statnice.pdf
-->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                    page-height="29.7cm" page-width="21cm" margin="2cm">
                    <fo:region-body />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body"
                    font-family="DejaVu Sans, Arial Unicode MS, Times, Helvetica, sans-serif">
                    <fo:block font-size="14pt" font-weight="bold"
                        text-align="center" space-after="1cm">
                        Seznam otázek ke státnicím
                    </fo:block>
                    <fo:block font-size="10pt">
                        <xsl:apply-templates select="statnice/komisar">
                            <xsl:sort select="@jmeno" order="ascending" />
                        </xsl:apply-templates>
                        <xsl:apply-templates select="statnice/komise" />
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- Komisař -->
    <xsl:template match="komisar">
        <fo:block font-size="12pt" font-weight="bold" space-before="1cm" space-after="0.2cm">
            <xsl:value-of select="@jmeno" />
            <xsl:if test="@tituly">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="@tituly" />
            </xsl:if>
        </fo:block>
        <fo:list-block
            provisional-distance-between-starts="0.7cm"
            provisional-label-separation="0.3cm" space-after="0.5cm">
            <xsl:for-each select="otazka">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block>•</fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:value-of select="." />
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:for-each>
        </fo:list-block>
    </xsl:template>

    <!-- Komise -->
    <xsl:template match="komise">
        <fo:block font-size="10pt" font-weight="bold" space-before="1cm" space-after="0.2cm">
        Komise: <xsl:for-each select="komisar">
                <xsl:if test="position() &gt; 1">, </xsl:if>
                <xsl:value-of
                    select="substring-before(@jmeno, ' ')" />
            </xsl:for-each>
        </fo:block>
        <fo:list-block
            provisional-distance-between-starts="0.7cm"
            provisional-label-separation="0.3cm" space-after="0.5cm">
            <xsl:for-each select="otazka">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block>•</fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:value-of select="." />
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:for-each>
        </fo:list-block>
    </xsl:template>

</xsl:stylesheet>