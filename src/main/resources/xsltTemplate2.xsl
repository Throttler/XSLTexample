<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <div class="main-container">
                    <div class="header main-theme">
                        Sawmill:
                        <xsl:value-of select="/sawmill/info/title"/>
                    </div>
                    <div class="body">
                        <xsl:apply-templates select="sawmill"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="sawmill">
        <div class="small-container main-theme">
            <h1>The owner of company -
                <xsl:apply-templates select="headmaster"/>
            </h1>
        </div>
        <div class="small-container main-theme">
            <h1>Orders:</h1>
            <ul>
                <xsl:apply-templates select="orders/order"/>
            </ul>
        </div>
        <div class="small-container main-theme">
            <h1>Workers:</h1>
            <ul>
                <xsl:apply-templates select="workers/worker"/>
            </ul>
        </div>
        <div class="small-container main-theme">
            <h1>How to contact with us:</h1>
            <ul>
                <xsl:apply-templates select="info/contacts"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="headmaster">
        <xsl:value-of select="firstName"/>
        <xsl:value-of select="lastName"/>
    </xsl:template>

    <xsl:template match="workers/worker">
        <xsl:for-each select=".">
            <li>
                <h1>
                    <xsl:value-of select="lastName"/>
                    <xsl:value-of select="firstName"/> ->
                    <xsl:value-of select="post"/>
                </h1>
            </li>

        </xsl:for-each>
    </xsl:template>

    <xsl:template match="orders/order">
        <xsl:for-each select="project">
            <li>
                <h1>
                    <xsl:value-of select="name"/>
                    Status:
                    <xsl:value-of select="@status"/>
                </h1>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="info/contacts">
        <xsl:value-of select="address"/>
        <xsl:value-of select="phone"/>
        <xsl:value-of select="fax"/>
    </xsl:template>

</xsl:stylesheet>
