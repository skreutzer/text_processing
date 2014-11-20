<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (C) 2014  Stephan Kreutzer

This file is part of template1 for odt2html.

template1 for odt2html is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3 or any later version,
as published by the Free Software Foundation.

template1 for odt2html is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License 3 for more details.

You should have received a copy of the GNU General Public License
along with template1 for odt2html. If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:template match="div[@class='chapter']">
    <xsl:comment> This file was generated by html2epub1_html_chapter of template1 for odt2html, which is free software licensed under the GNU Affero General Public License 3 or any later version (see https://github.com/publishing-systems/automated_digital_publishing/ and http://www.publishing-systems.org). </xsl:comment><xsl:text>&#xA;</xsl:text>
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
      <head>
        <title>
          <xsl:if test="h2">
            <xsl:for-each select="h2/text()">
              <xsl:value-of select="."/>
            </xsl:for-each>
          </xsl:if>
        </title>
        <style type="text/css">
          .keyword
          {
              font-weight:bold;
          }
        </style>
      </head>
      <body>
        <div class="chapter">
          <xsl:if test="h2">
            <h2>
              <xsl:for-each select="h2/text()">
                <xsl:value-of select="."/>
              </xsl:for-each>
            </h2>
          </xsl:if>
          <xsl:apply-templates/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="div[@class='section']">
    <div class="section">
      <xsl:if test="h3">
        <h3>
          <xsl:value-of select="h3"/>
        </h3>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="div[@class='subsection']">
    <div class="subsection">
      <xsl:if test="h4">
        <h4>
          <xsl:value-of select="h4"/>
        </h4>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="p[@class='paragraph_5f_first' or @class='paragraph']">
    <p class="paragraph_default">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="p[@class='paragraph_5f_first' or @class='paragraph']//text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="a">
    <a>
      <!--
        Regarding the filtering of the 'shape' attribute:
        The XHTML 1.0 Strict DTD defines default values for several attributes.
        If those attributes aren't present at the input, they automatically
        get added to the output with their corresponding default value. See
        http://www.xmlplease.com/xhtml/shaperect
      -->
      <xsl:copy-of select="@*[name()!='shape']"/>
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="ul">
    <ul>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="ol">
    <ol>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="ul/li|ol/li">
    <li>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="ul/li//text()|ol/li//text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="span[@class='keyword']">
    <span class="keyword">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="img">
    <img alt="">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </img>
  </xsl:template>

  <xsl:template match="span[@class='keyword']//text()">
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="text()|@*"/>

</xsl:stylesheet>
