<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs">

    <xsl:output method="html" indent="yes" encoding="UTF-8" />

    <!-- Root template -->
    <xsl:template match="/statnice">
        <html>
            <head>
                <meta name="robots" content="noindex, nofollow"></meta>
                <title>Státnice - Komisaři a Komise</title>
                <style>
                    table, th, td { border: 1px solid black; border-collapse: collapse; }
                    th, td { padding: 5px; }
                </style>
            </head>
            <body>
                <table cellpadding="0" cellspacing="0" border-style="none">
                    <tr>
                        <td>
                            <h1>Státnice</h1>
                        </td>
                        <td>
                            <a href="https://statnice.capybara-enjoyer.de/statnice.pdf">pdf</a>
                        </td>
                    </tr>
                </table>
                <xsl:if test="@posledniUpdate">
                    <p>
                        <strong>Poslední update:</strong>
                        <xsl:value-of select="@posledniUpdate" />
                    </p>
                </xsl:if>

                <!-- Komisaři Table -->
                <xsl:if test="komisar">
                    <h2>Komisaři</h2>
          <table>
                        <tr>
                            <th>Jméno</th>
                            <th>Tituly</th>
                            <th>Otázky</th>
                        </tr>
                        <xsl:for-each select="komisar">
                            <tr>
                                <td>
                                    <xsl:value-of select="@jmeno" />
                                </td>
                                <td>
                                    <xsl:value-of select="@tituly" />
                                </td>
                                <td>
                                    <ul>
                                        <xsl:for-each select="otazka">
                                            <li>
                                                <xsl:value-of select="." />
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:if>

                <!-- Komise Table -->
                <xsl:if test="komise">
                    <h2>Komise</h2>
          <xsl:for-each select="komise">
                        <table>
                            <tr>
                                <th>Komisař</th>
                                <th>Tituly</th>
                            </tr>
                            <xsl:for-each select="komisar">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@jmeno" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="@tituly" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                            <tr>
                                <th colspan="2">Otázky</th>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <ul>
                                        <xsl:for-each select="otazka">
                                            <li>
                                                <xsl:value-of select="." />
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </table>
            <br />
                    </xsl:for-each>
                </xsl:if>
            </body>
        </html>
    </xsl:template>

    <!-- Identity template for other nodes (optional, for completeness) -->
    <xsl:template match="text()|@*" />
</xsl:stylesheet>