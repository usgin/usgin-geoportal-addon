<%--
 See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 Esri Inc. licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<% // homeBody.jsp - Home page (JSF body) %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:verbatim>

<script type="text/javascript">
/**
Submits from when on enter.
@param event The event variable
@param form The form to be submitted.
**/
function hpSubmitForm(event, form) {

  var e = event;
  if (!e) e = window.event;
  var tgt = (e.srcElement) ? e.srcElement : e.target; 
  if ((tgt != null) && tgt.id) {
    if (tgt.id == "frmSearchCriteria:mapInput-locate") return;
  }
  
  if(!GptUtils.exists(event)) {
    GptUtils.logl(GptUtils.log.Level.WARNING, 
         "fn submitform: could not get event so as to determine if to submit form ");
    return;
  }
  var code;
  
  if(GptUtils.exists(event.which)) {
    code = event.which;
  } else if (GptUtils.exists(event.keyCode)) {
    code = event.keyCode;
  } else {
    GptUtils.logl(GptUtils.log.Level.WARNING, 
         "fn submitForm: Could not determine key pressed");
    return;
  }
  
  if(code == 13) {
    
    // Getting main search button
    var searchButtonId = "hpFrmSearch:btnDoSearch";
    var searchButton = document.getElementById(searchButtonId);
    if(!GptUtils.exists(searchButton)){
      GptUtils.logl(GptUtils.log.Level.WARNING, 
         "Could not find button id = " + searchButtonId);
    } else if (!GptUtils.exists(searchButton.click)) {
      GptUtils.logl(GptUtils.log.Level.WARNING, 
         "Could not find click action on id = " + searchButtonId);
    } else {
      searchButton.click();
    }
  } else {
    return true;
  }
}
</script>

</f:verbatim>
 
<center><h:graphicImage value="/catalog/images/usginLogo.png"
width="450" height="85"
style=''
alt="USGIN Logo"
title="USGIN logo"/></center>
	<h1>
		<center>
			<a href="$(search.domain)">Please Click Here To Search the USGIN Geoscience Resource Catalog</a>
		</center>
	</h1>	
	<div style='padding-right: 25px; padding-left: 25px;'>        
      	<div style='padding-right: 2px; padding-left: 2px;'>			
			<br/>
			<ul>							
				<li>
					This site is an administrative access point the <strong>The USGIN Catalog</strong>, which provides metadata for a wide fariety of information resources..
				</li>
				<br/>
				<li>
					 The catalog is also exposed for searching via an 
					<a href="http://portal.opengeospatial.org/files/?artifact_id=20555">Open Geospatial Consortium Catalog Service for the Web (CSW)</a>.
				</li>
				<br/>
				<li>
		<a href="http://catalog.usgin.org/geoportal/csw?request=GetCapabilities&service=CSW">The CSW capabilities document</a> provides an access point to this service.
					<br/>
					... see a <a href="http://www.ogcnetwork.net/node/630">CSW tutorial</a> for more information ...
				</li>
				<br/>
				<li>
					The catalog can also be searched via the Geoportal REST API, as described by 
					<a href="http://catalog.usgin.org/geoportal/openSearchDescription">this OpenSearch description document</a>.
				</li>
        	</ul>
        	<br/>
        	<br/>
        	<div id="menu" style="text-align: left; height: 120px;">
				<center>
					<b>
						<h1>Find Out More About...</h1>
					</b>
				</center>					
				<center>
					<a href="http://usgin.org/">USGIN - United States Geoscience Information Network</a>
				</center>
				<center>
					<a href="http://www.stategeothermaldata.org/">AASG Geothermal Data Project </a>
				</center>						
				<center>
					<a href="http://www.geothermaldata.org/">NGDS - National Geothermal Data System</a>
				</center>			
			</div>
		</div>
	</div>
	
<f:verbatim>
<h2></h2><br/>
<!-- more content here -->
</f:verbatim>