<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:cml="https://joejcollins.github.io/CookML.xsd"
                exclude-result-prefixes="msxsl cml">
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" indent="yes"/>
  <!-- 
  Copy everything that has no other pattern defined and apply the caloric
  staples template.
  -->
  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="staples" />
    </xsl:copy>
  </xsl:template>
  <!--
	Expanding the staples is the first step because they use the utensils 
  (which will be replaced with localised text) and because the staple
  tag will add other ingredients to the shopping lists.    
	-->
  <xsl:template name="staples" match="cml:Staple">
    <!-- Couscous -->
    <xsl:variable name="Meals" select="../../@Meals" />
    <xsl:if test="@Name='couscous'">
      In a
      <Utensil Name="pan" /> pour 
      <Water Unit="ml" Name="boiling water">
        <xsl:attribute name="Quantity" >
          <xsl:value-of select="($Meals div 2) * 600"/>
        </xsl:attribute>
      </Water>
      on 
      <Grocery Unit="g" Name="cous cous">
        <xsl:attribute name="Quantity" >
          <xsl:value-of select="($Meals div 2) * 400"/>
        </xsl:attribute>
      </Grocery>, 
      cover and leave to stand for 10 minutes.
    </xsl:if>
    <!-- Noodles -->
    <xsl:if test="@Name='noodles'">
      In a <Utensil Name="pan" />
      put
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">noodles</xsl:attribute>
      </xsl:element>
      pour on
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">boiling water</xsl:attribute>
      </xsl:element>
      cover and stand for 10 minutes, then drain.
    </xsl:if>
    <xsl:if test="@Name='pasta shapes'">
      In a <Utensil Name="pan" /> heat
      <Water Quantity="2000" Unit="ml" Name="cold water" /> then add
      <Grocery Quantity="400" Unit="g" Name="pasta shapes"/>
      boil for 12
      minutes then drain.
    </xsl:if>
    <!-- Rice -->
    <xsl:if test="@Name='rice white'">
      In a
      <Utensil Name="pan" />
      put
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">white rice</xsl:attribute>
      </xsl:element>
      and
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">cold water</xsl:attribute>
      </xsl:element>
      bring to the boil then turn off, cover and stand for 25 minutes.
    </xsl:if>
    <xsl:if test="@Name='rice brown'">
      In a
      <Utensil Name="pan" />
      put
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">brown rice</xsl:attribute>
      </xsl:element>
      and
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">cold water</xsl:attribute>
      </xsl:element>
      bring to the boil then simmer for 15 minutes,
      then cover and stand for 10 minutes.
    </xsl:if>
    <xsl:if test="@Name='rice turmeric'">
      In a
      <Utensil Name="pan" />
      put
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">white rice</xsl:attribute>
      </xsl:element>,
      <xsl:element name="Check">
        <xsl:variable name="Quantity" select="1" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">tsp</xsl:attribute>
        <xsl:attribute name="Name">ground turmeric</xsl:attribute>
      </xsl:element>,
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="50" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">raisins</xsl:attribute>
      </xsl:element>
      and
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">cold water</xsl:attribute>
      </xsl:element>
      bring to the boil then simmer for 15 minutes,
      then cover and stand for 10 minutes.
    </xsl:if>
    <!-- Spaghetti -->
    <xsl:if test="@Name='spaghetti'">
      In a <Utensil Name="pan" /> boil water then add
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">spaghetti</xsl:attribute>
      </xsl:element>
      continuse boiling for 12  minutes then drain.
    </xsl:if>
    <xsl:if test="@Name='potatoes'">
      Bake 
      <Vegetable Process="washed" Name="baking potatoes" Unit="g">
        <xsl:attribute name="Quantity" >
          <xsl:value-of select="($Meals div 2) * 1200"/>
        </xsl:attribute>
      </Vegetable>
      at
      <Temperature Level="high" /> for 40 minutes.
    </xsl:if>
    <xsl:if test="@Name='new potatoes'">
      In a <Utensil Name="pan" /> place
      <Vegetable Process="washed" Name="new potatoes" Unit="g">
        <xsl:attribute name="Quantity" >
          <xsl:value-of select="($Meals div 2) * 1200"/>
        </xsl:attribute>
      </Vegetable>
      bring to the boil and simmer for 20 minutes.
    </xsl:if>
    <xsl:if test="@Name='tagliatelli'">
      In a
      <Utensil Name="pan" />
      put
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">boiling water</xsl:attribute>
      </xsl:element>
      add
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">tagliatelli</xsl:attribute>
      </xsl:element>
      boil for 12 minutes then drain.
    </xsl:if>
    <xsl:if test="@Name='tortellini'">
      In a
      <Utensil Name="pan" />
      put
      <xsl:element name="Water">
        <xsl:variable name="Quantity" select="800" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">ml</xsl:attribute>
        <xsl:attribute name="Name">boiling water</xsl:attribute>
      </xsl:element>
      and
      <xsl:element name="Grocery">
        <xsl:variable name="Quantity" select="400" />
        <xsl:attribute name="Quantity">
          <xsl:value-of select="($Meals div 2) * $Quantity" />
        </xsl:attribute>
        <xsl:attribute name="Unit">g</xsl:attribute>
        <xsl:attribute name="Name">tortellini</xsl:attribute>
      </xsl:element>
      boil for 5 minutes then drain.
    </xsl:if>
  </xsl:template>
  <!--
		Remove all the namespaces (to make it easier to read).  The namespace is really
    only there in the first place to get the editor to respond to the xsd.  After this
    point there will be no editing by hand anyway.
	-->
  <xsl:template match="*">
    <!-- remove element prefix (if any) -->
    <xsl:element name="{local-name()}">
      <!-- process attributes -->
      <xsl:for-each select="@*">
        <!-- remove attribute prefix (if any) -->
        <xsl:attribute name="{local-name()}">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
