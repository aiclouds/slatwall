<cfif thisTag.executionMode is "start">
	<cfparam name="attributes.divClass" type="string" default="col-md-12" />
	<cfparam name="request.context.edit" type="boolean" default="false" />
	<cfparam name="attributes.edit" type="boolean" default="#request.context.edit#" />

	<cfoutput>
		<div class="#attributes.divClass#">
			<cfif attributes.edit>
				<div class="form-horizontal " style="max-width: 650px;">
			<cfelse>
				<div class="form-horizontal  s-property-info" style="max-width: 650px;">
			</cfif>
	</cfoutput>
<cfelse>
	<cfoutput>
			<cfif attributes.edit>
				</div>
			<cfelse>
				</div>
			</cfif>
		</div>
	</cfoutput>
</cfif>
