<cfcomponent rest="true" restpath="crud">
	
	<cffunction name="InsertProject" restpath="InsertProject" access="remote"  returntype="string" httpmethod="POST">
		
		<cfparam name="data" type="string">
		<cfset obj = deserializejson(data)>
		<cfquery datasource="ots">
			
			INSERT INTO ots (startdate, enddate, department, project_code, description, contractor, labor_price, material_price, userid, comment,create_at,update_at) VALUES ('#obj.finicio#', '#obj.ffin#', '#obj.Dep.ID#','#obj.Cod#', '#obj.Des#', '#obj.Con.ID#', '#obj.precioT#', '#obj.precioM#', '1', '#obj.coment#', NOW(), NOW());

		</cfquery>
		<cfreturn OTS()>
	</cffunction>
	<cffunction name="UpdateProject" restpath="UpdateProject" access="remote"  returntype="string" httpmethod="POST">
		
		<cfparam name="data" type="string">
		<cfset obj = deserializejson(data)>
		<cfquery datasource="ots">

			UPDATE ots SET reference = '#obj.REFERENCE#', invoice = '#obj.INVOICE#', costcenter = '#obj.COSTCENTER#', state_Project = '#obj.STATE_PROJECT#' WHERE id = '#obj.ID#';
		</cfquery>
		<cfreturn OTS()>
	</cffunction>
	<cffunction name="DeleteProject" restpath="DeleteProject" access="remote"  returntype="string" httpmethod="POST">
		
		<cfparam name="data" type="string">
		<cfset obj = deserializejson(data)>
		<cfquery datasource="ots">
			DELETE FROM ots WHERE id = '#obj.ID#';
		</cfquery>
		<cfreturn OTS()>
	</cffunction>
	<cffunction name="OTS" restpath="OTS" access="remote"  returntype="string" httpmethod="POST">
		
		<cfset response = [] />
		<cfquery name="DataOts" datasource="ots">
			SELECT a.id, DATE_FORMAT(a.startdate, '%d-%m-%Y') startdate, DATE_FORMAT(a.enddate, '%d-%m-%Y') enddate, a.reference, a.invoice, a.department, a.costcenter, a.account,
			a.project_code, a.description,a.contractor, a.labor_price, a.material_price, a.state_Project,
			a.userid, a.comment, a.state, a.create_at, a.update_at, a.idteam,
			b.name department_name,
			c.name contractor_name
			FROM ots a
			LEFT JOIN departments b
			ON a.department = b.id
			LEFT JOIN contractors c
			ON a.contractor = c.id
		</cfquery>
		<cfoutput query="DataOts">
	        <cfset obj = {  
	            "ID" = id,
	            "STARTDATE" = startdate,
	            "ENDDATE" = enddate,
	            "REFERENCE" = reference,
	            "INVOICE" = invoice,
	            "DEPARTMENT" = department_name,
	            "COSTCENTER" = costcenter,
	            "ACCOUNT" = account,
	            "PROJECT_CODE" = project_code,
	            "DESCRIPTION" = description,
	            "CONTRACTOR" = contractor_name,
	            "LABOR_PRICE" = labor_price,
	            "MATERIAL_PRICE" = material_price,
	            "STATE_PROJECT" = state_Project,
	            "USERID" = userid,
				"COMMENT" = comment,
				"STATE" = state,
				"CREATEAT" = create_at,
				"UPDATEAT" = update_at,
				"IDTEAM" = idteam
	         } />
	        <cfset arrayAppend(response, obj) />
	    </cfoutput>
		<cfreturn serializeJSON(response, "struct")>

	</cffunction>
</cfcomponent>
