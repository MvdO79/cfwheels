```coldfusion
// In `models/User.cfc`, allow for `groupEntitlements` to be saved and deleted through the `user` object
<cffunction name="init">
	hasMany("groupEntitlements")>
	nestedProperties(association="groupEntitlements", allowDelete=true)>
</cffunction>
```