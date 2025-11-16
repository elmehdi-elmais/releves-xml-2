<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/releve">
        <html>
            <head>
                <title>Relevé bancaire</title>
            </head>
            <body>
                <h1>Relevé bancaire</h1>                
                <h2>RIB: <xsl:value-of select="@RIB"/></h2>                
                <h2>Date de relevé: <xsl:value-of select="./dateReleve"/></h2>                
                <h2>Solde: <xsl:value-of select="./solde"/></h2>
                <h3>Liste des opérations</h3>
                <table border="1">
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>              
                    <tr>
                        <th colspan="2">Total des opérations de débit</th>
                        <td colspan="2">
                            <xsl:value-of select="sum(operations/operation[@type='DEBIT']/@montant)"/>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">Total des opérations de crédit.</th>
                        <td colspan="2">
                            <xsl:value-of select="sum(operations/operation[@type='CREDIT']/@montant)"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>