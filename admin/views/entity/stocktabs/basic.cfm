<cfimport prefix="swa" taglib="../../../../tags" />
<cfimport prefix="hb" taglib="../../../../org/Hibachi/HibachiTags" />

<cfparam name="rc.stock" type="any" />
<cfparam name="rc.sku" type="any" default="#rc.stock.getSku()#" />
<cfparam name="rc.location" type="any" default="#rc.stock.getLocation()#" />
<cfoutput>
	<hb:HibachiPropertyRow>
		<hb:HibachiPropertyList>
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="activeFlag" >
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="skuName">
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="skuCode" >
			<hb:HibachiPropertyDisplay object="#rc.location#" property="locationName" >
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="userDefinedPriceFlag" >
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="price">
			<hb:HibachiPropertyDisplay object="#rc.sku#" property="listPrice" >
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="calculatedAverageCost" edit="false"/>
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="calculatedAverageLandedCost" edit="false" />
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="currentMargin" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="currentLandedMargin" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="currentAssetValue" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="averagePriceSold" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="averageProfit" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="averageLandedProfit" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="averageMarkup" edit="false">
			<hb:HibachiPropertyDisplay object="#rc.stock#" property="averageLandedMarkup" edit="false">
		</hb:HibachiPropertyList>
	</hb:HibachiPropertyRow>
</cfoutput>
