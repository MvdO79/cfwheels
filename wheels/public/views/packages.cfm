<cfinclude template="../layout/_header.cfm">

<cfscript>
param name="request.wheels.params.type" default="app";

packages = $createObjectFromRoot(path=application.wheels.wheelsComponentPath, fileName="Test", method="$listTestPackages", options=request.wheels.params);

// ignore packages before the "tests directory"
if (packages.recordCount) {
	allPackages = ListToArray(packages.package, ".");
	preTest = "";
	for (i in allPackages) {
		preTest = ListAppend(preTest, i, ".");
		if (i eq "tests") {
			break;
		}
	}
}

</cfscript>
<cfoutput>


<div class="ui container">

	#pageHeader("Test Suites", "Core &amp; App test suites")#

	<cfinclude template="../tests/_navigation.cfm">



<div class="ui segment">

	<p>Below is listing of all the #type# test packages. Click the part of the package to run it individually.</p>

	#startTable("Tests")#

		<cfif packages.recordcount>
			<cfloop query="packages">
				<tr><td>
					<cfset testablePackages = ListToArray(ReplaceNoCase(package, "#preTest#.", "", "one"), ".")>
					<cfset packagesLen = arrayLen(testablePackages)>
					<cfloop from="1" to="#packagesLen#" index="i">
						#linkTo(route="wheelsTests",
								type = type,
								params="package=#ArrayToList(testablePackages.subList(JavaCast('int', 0), JavaCast('int', i)), '.')#&format=html",
								text=testablePackages[i] )#<cfif i neq packagesLen> .</cfif>
					</cfloop>
				</td></tr>
			</cfloop>
		<cfelse>
			<span class="failure-message-item">No Test Packages Found</span>
		</cfif>

	#endTable()#

</div>
</div>

</cfoutput>

<cfinclude template="../layout/_footer.cfm">

