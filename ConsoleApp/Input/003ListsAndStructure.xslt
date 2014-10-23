<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:increment="urn:Increment"><!-- using an external class for incrementing -->
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

  <!--
		  Format for the book
	  -->
  <xsl:template match="Book">
    <Book>
      <xsl:apply-templates select="Menu" />
    </Book>
  </xsl:template>
  <!--
		  Format the Menu
	  -->
  <xsl:template match="Menu">
    <xsl:element name="Menu">
      <xsl:attribute name="Title">
        <xsl:value-of select="@Title" />
      </xsl:attribute>
      <ShoppingLists>
        <Shopping Title="Vegetables">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Vegetable'"/>
            <xsl:with-param name="Week" select="'One'"/>
          </xsl:call-template>
        </Shopping>
        <Shopping Title="Groceries">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Grocery'"/>
          </xsl:call-template>
        </Shopping>
        <Shopping Title="Meat">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Meat'"/>
          </xsl:call-template>
        </Shopping>
        <Shopping Title="Dairy">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Dairy'"/>
          </xsl:call-template>
        </Shopping>
        <Shopping Title="Check">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Check'"/>
          </xsl:call-template>
        </Shopping>
        <Shopping Title="Extra Vegetables">
          <xsl:call-template name="ShoppingList" >
            <xsl:with-param name="List" select="'Vegetable'"/>
            <xsl:with-param name="Week" select="'Two'"/>
          </xsl:call-template>
        </Shopping>
      </ShoppingLists>
      <xsl:apply-templates select="Recipe" />
    </xsl:element>
  </xsl:template>
  <!--
      Shopping List
    -->
  <xsl:template name="ShoppingList">
    <xsl:param name="List" />
    <xsl:param name="Week" />
    <xsl:param name="Meals" select="0"/>
    <xsl:choose>
      <xsl:when test="$List != 'Vegetable'">
        <xsl:for-each select="Recipe/Stage/*[name() = $List]">
          <xsl:sort select="@Type" />
          <xsl:element name="Item">
            <xsl:attribute name="Type">
              <xsl:value-of select="@Type" />
            </xsl:attribute>
            <xsl:attribute name="Quantity">
              <xsl:value-of select="@Quantity" />
            </xsl:attribute>
            <xsl:attribute name="Unit">
              <xsl:value-of select="@Unit" />
            </xsl:attribute>
          </xsl:element>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <!-- Vegetables -->
        
        <xsl:choose>
          <!-- Second Week -->
          <xsl:when test="$Week = 'Two'">
            <xsl:for-each select="Recipe/Stage/*[name() = $List]">
              <xsl:sort select="@Type" />
              <xsl:element name="Item">
                <xsl:attribute name="Type">
                  <xsl:value-of select="@Type" />
                </xsl:attribute>
                <xsl:attribute name="Quantity">
                  <xsl:value-of select="@Quantity" />
                </xsl:attribute>
                <xsl:attribute name="Unit">
                  <xsl:value-of select="@Unit" />
                </xsl:attribute>
                <xsl:attribute name="MealCounter">
                  <xsl:value-of select="../../@Meals" />
                </xsl:attribute>
                
              </xsl:element>
            </xsl:for-each>
          </xsl:when>
        <xsl:otherwise>
          <!-- first Week -->
        </xsl:otherwise>
      </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- 
		  Recipe
	  -->
  <xsl:template match="Recipe">
    <xsl:element name="Recipe">
      <xsl:attribute name="Meals">
        <xsl:value-of select="@Meals" />
      </xsl:attribute>
      <xsl:attribute name="Title">
        <xsl:value-of select="@Title" />
      </xsl:attribute>
      <xsl:element name="Ingredients">
        <xsl:for-each select="Stage/Vegetable|Stage/Grocery|Stage/Dairy|Stage/Meat|Stage/Check">
          <xsl:element name="Item">
            <xsl:attribute name="Type">
              <xsl:value-of select="@Type" />
            </xsl:attribute>
            <xsl:attribute name="Quantity">
              <xsl:value-of select="@Quantity" />
            </xsl:attribute>
            <xsl:attribute name="Unit">
              <xsl:value-of select="@Unit" />
            </xsl:attribute>
            <xsl:attribute name="Process">
              <xsl:value-of select="@Process" />
            </xsl:attribute>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
      <xsl:apply-templates select="Stage" />
    </xsl:element>
  </xsl:template>
  <!-- 
		  Stage - the contents of the stage can be copied without 
		  any transformations.
	  -->
  <xsl:template match="Stage">
    <xsl:copy-of select="." />
  </xsl:template>

</xsl:stylesheet>
