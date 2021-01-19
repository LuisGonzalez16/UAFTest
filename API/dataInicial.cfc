<cfcomponent rest="true" restpath="DataInicial">
	
	<cffunction name="Contrators" restpath="Contrators" access="remote"  returntype="string" httpmethod="POST">
		<cfset response = [] />
		<cfquery name="DataContrators" datasource="ots">
			SELECT * FROM contractors
		</cfquery>
		<cfoutput query="DataContrators">
	        <cfset obj = {
	            "ID" = id,
	            "NAME" = name,
	            "TELEPHONE" = telephone,
	            "EMAIL" = email,
	            "STATE" = state     
	         } />
	        <cfset arrayAppend(response, obj) />
	    </cfoutput>
		<cfreturn serializeJSON(response, "struct")>

	</cffunction>

	<cffunction name="Departments" restpath="Departments" access="remote"  returntype="string" httpmethod="POST">
		<cfset response = [] />
		<cfquery name="DataDepartments" datasource="ots">
			SELECT * FROM departments
		</cfquery>
		<cfoutput query="DataDepartments">
	        <cfset obj = {
	            "ID" = id,
	            "NAME" = name,
	            "STATE" = state     
	         } />
	        <cfset arrayAppend(response, obj) />
	    </cfoutput>
		<cfreturn serializeJSON(response, "struct")>

	</cffunction>

	<cffunction name="CostCenter" restpath="CostCenter" access="remote"  returntype="string" httpmethod="POST">
		<cfset response = [] />
		<cfquery name="DataCostCenter" datasource="ots">
			SELECT * FROM cost_center
		</cfquery>
		<cfoutput query="DataCostCenter">
	        <cfset obj = {
	            "ID" = id,
	            "NAME" = name,
	            "COD" = cod,
	            "STATE" = state     
	         } />
	        <cfset arrayAppend(response, obj) />
	    </cfoutput>
		<cfreturn serializeJSON(response, "struct")>

	</cffunction>
</cfcomponent>
