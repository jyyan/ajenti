<xsl:template match="topcategory">
    <a class="ui-el-top-category{x:iif(@selected, '-selected', '')}" href="#" onclick="javascript:ui_select_top_category('{@id}');return ajax('/handle/category/click/{@id}');" id="{@id}">
        <xsl:value-of select="@text"/>
    </a>
</xsl:template>

<xsl:template match="category">
    <a href="#" onclick="javascript:ui_select_category('{@id}');return ajax('/handle/category/click/{@id}');">
	    <div id="{@id}" class="{x:iif(@selected, 'ui-el-category-selected', 'ui-el-category')}">
            <img src="{@icon}" class="ui-el-category-icon" />
            <span class="ui-el-category-text">
                <xsl:value-of select="@name"/>
            </span>
        </div>
    </a>
</xsl:template>

<xsl:template match="categoryfolder">
    <div class="ui-el-categoryfolder" id="{@id}">
        <xsl:value-of select="@text"/>
    </div>
    <div class="ui-el-categoryfolder-children">
        <xsl:apply-templates />
    </div>
</xsl:template>


<xsl:template match="pluginpanel">
    <div class="ui-el-pluginpanel">
        <div class="ui-el-pluginpanel-head">
            <span><xsl:value-of select="@title" /></span>
        </div>
        <div>
            <xsl:apply-templates select="*[1]" />
        </div>
        <div class="ui-el-pluginpanel-content">
            <xsl:apply-templates select="*[2]" />
        </div>
    </div>
</xsl:template>

<xsl:template match="toolbar">
        <div class="ui-el-toolbar">
            <xsl:apply-templates />
        </div>
</xsl:template>
        
<xsl:template match="topprogressbox">
        <div class="ui-progress-box">
            <table width="100%"><tr>
                <td width="20"><img class="ajax" src="/dl/core/ui/ajax-light.gif"/></td>
                <td width="20"><img src="{@icon}"/></td>
                <td><label text="{@title}" bold="True"/></td>
                <td style="max-width: 280px; display: block; overflow: hidden"><label text="{@text}"/></td>
                <xsl:if test="@can_abort = 'True'">
                    <td width="10"><warningminibutton text="Abort" id="aborttask" msg="Abort the background task for {@title}"/></td>
                </xsl:if>
            </tr></table>
            <refresh time="3000"/>
        </div>
</xsl:template>
        
        
<xsl:template match="systemmessage">
    <div class="ui-el-message ui-el-message-{@cls}">
        <xsl:value-of select="@text" />
    </div>
</xsl:template>
        
