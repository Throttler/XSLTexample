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
                    <div class="footer second-theme">
                        <xsl:apply-templates select="sawmill/info/contacts"/>
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
                <xsl:apply-templates select="orders"/>
            </ul>
        </div>
        <div class="small-container main-theme">
            <h1>Workers:</h1>
            <ul>
                <xsl:apply-templates select="workers"/>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="headmaster">
        <xsl:value-of select="firstName"/>
        <xsl:value-of select="lastName"/>
    </xsl:template>

    <xsl:template match="workers">
        <xsl:copy>
            <xsl:for-each select="worker">
                <xsl:sort select="lastName"/>
                <li>
                    <h1>
                        <xsl:value-of select="lastName"/>
                        <xsl:value-of select="firstName"/> ->
                        <xsl:value-of select="post"/>
                    </h1>
                </li>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="orders">
        <xsl:copy>
            <xsl:for-each select="order">
                <xsl:sort select="project/@status"/>
                <li>
                    <div class="order-item">

                        <div class="order-item-row">
                                <xsl:value-of select="project/name"/>
                        </div>


                        <xsl:choose>
                            <xsl:when test = "project/@status = 'active'">
                                <div class="order-item-row">
                                    Status:
                                    <xsl:value-of select="project/@status"/>
                                    <xsl:variable name="percents" select="number(progress)"/>

                                    <div class="progress-bar">
                                        <progress value="{$percents}" max="100"></progress>
                                    </div>

                                    <xsl:value-of select="$percents"/>
                                    %
                                </div>
                                <div class="order-item-row">
                                    Description:
                                    <xsl:value-of select="project/description"/>
                                </div>
                                <div class="order-item-row">
                                    Expected profit: <xsl:value-of select="coast"/>
                                </div>
                            </xsl:when>

                            <xsl:when test = "project/@status = 'complited'">
                                <div class="order-item-row">
                                    Status:
                                    <xsl:value-of select="project/@status"/>
                                </div>
                                <div class="order-item-row">
                                    Description:
                                    <xsl:value-of select="project/description"/>
                                </div>
                                <div class="order-item-row">
                                    Profit: <xsl:value-of select="coast"/>
                                </div>
                            </xsl:when>

                            <xsl:when test = "project/@status = 'declined'">
                                <div class="order-item-row">
                                    Status:
                                    <xsl:value-of select="project/@status"/>
                                </div>
                                <div class="order-item-row">
                                    Reason: <xsl:value-of select="reason"/>
                                </div>
                            </xsl:when>

                            <xsl:otherwise>
                                <div class="order-item-row">
                                    Project without useful information
                                </div>
                            </xsl:otherwise>

                        </xsl:choose>


                    </div>

                </li>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="sawmill/info/contacts">
        <span class="info-item"><h3>How to contact with us:</h3></span>
        <span class="info-item">
            <h3>
                Address:
                <xsl:value-of select="address"/>;
            </h3>
        </span>
        <span class="info-item">
            <h3>
                Phone number:
                <xsl:value-of select="phone"/>;
            </h3>
        </span>
        <span class="info-item">
            <h3>
                Fax:
                <xsl:value-of select="fax"/>.
            </h3>
        </span>

    </xsl:template>

</xsl:stylesheet>
