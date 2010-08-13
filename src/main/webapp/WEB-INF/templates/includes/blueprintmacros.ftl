[#ftl]
[#import "spring.ftl" as spring]
[#-- [#assign security=JspTaglibs["http://www.springframework.org/security/tags"]] --]

[#-- To use macros defined here add the following directive at the top of an ftl file --]
[#-- [#import "macros.ftl" as mifos] --]

[#-- header macro --]
[#-- Generate the Mifos header with tabbed navigation --]
[#-- currentTab values: "Home","ClientsAndAccounts","Reports","Admin" --]
[#-- usage   [@mifos.topNavigation currentTab="Home" /] --]
[#macro topNavigation currentTab]
<div>
    <div class="topAlign append-1">
		<span class="logo"></span>
		<a href="yourSettings.do?method=get" title="[@spring.message "yourSettings"/]">[@spring.message "yourSettings"/]</a>&nbsp;|&nbsp;
		<a id="logout_link" href="j_spring_security_logout" title="[@spring.message "logout"/]">[@spring.message "logout"/]</a>
	</div>
    <div>		
		<span class="menu">
		  <a id="header.link.home" href="custSearchAction.do?method=getHomePage" class="[#if currentTab == "Home"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Home" /]">[@spring.message "tab.Home" /]</a>
		  <a id="header.link.clientsAndAccounts" href="custSearchAction.do?method=loadMainSearch" class="[#if currentTab == "ClientsAndAccounts"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.ClientsAndAccounts" /]">[@spring.message "tab.ClientsAndAccounts" /]</a>
		  <a id="header.link.reports" href="reportsAction.do?method=load" class="[#if currentTab == "Reports"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Reports" /]">[@spring.message "tab.Reports" /]</a>
        [#--
		  [@security.authorize ifAllGranted="ROLE_ADMIN"]
		  <a id="header.link.admin" href="AdminAction.do?method=load" class="[#if currentTab == "Admin"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Admin" /]">[@spring.message "tab.Admin" /]</a></span>
		  [/@security.authorize]
        --]
		</span>
	</div>
    <div class="clear"></div>
    <div class="orangeline">&nbsp;</div>
</div>
[/#macro]

[#macro topNavigationNoSecurity currentTab]
<div>
	<div class="topAlign append-1">
		<span class="logo"></span>
		<a href="yourSettings.do?method=get" title="[@spring.message "yourSettings"/]">[@spring.message "yourSettings"/]</a>&nbsp;|&nbsp;
		<a id="logout_link" href="j_spring_security_logout" title="[@spring.message "logout"/]">[@spring.message "logout"/]</a>
	</div>
    <div>
		<span class="menu">
		  <a id="header.link.home" href="custSearchAction.do?method=getHomePage" class="[#if currentTab == "Home"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Home" /]">[@spring.message "tab.Home" /]</a>
		  <a id="header.link.clientsAndAccounts" href="custSearchAction.do?method=loadMainSearch" class="[#if currentTab == "ClientsAndAccounts"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.ClientsAndAccounts" /]">[@spring.message "tab.ClientsAndAccounts" /]</a>
		  <a id="header.link.reports" href="reportsAction.do?method=load" class="[#if currentTab == "Reports"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Reports" /]">[@spring.message "tab.Reports" /]</a>
		  <a id="header.link.admin" href="AdminAction.do?method=load" class="[#if currentTab == "Admin"]taborange[#else]tablightorange[/#if]" title="[@spring.message "tab.Admin" /]">[@spring.message "tab.Admin" /]</a></span>
	   </div>
    <div class="clear"></div>
    <div class="orangeline">&nbsp;</div>
</div>
[/#macro]

[#macro crumbs breadcrumbs]
<div class="bluedivs paddingLeft">
	    [#list breadcrumbs as messages]
  			[#if messages_has_next]
    			<a href="${messages.link}">[@spring.message "${messages.message}" /]</a>&nbsp;/&nbsp;  [#else] <span class="fontBold">[@spring.message "${messages.message}" /]</span>
  			[/#if]
  		[/#list]
 </div>
[/#macro]

+[#macro crumbpairs breadcrumbs lastEntryIsText="true"]
<div class="bluedivs paddingLeft">
	    [#list breadcrumbs?keys as text]
  			[#if text_has_next || lastEntryIsText=="false"]
    			<a href="${breadcrumbs[text]}">[@spring.messageText text, text/]</a>&nbsp;/&nbsp;
            [#else]
                <span class="fontBold">[@spring.messageText text, text/]</span>
   			[/#if]
  		[/#list]
 </div>
[/#macro]

[#macro crumb url]
<div class="bluedivs paddingLeft"><a href="AdminAction.do?method=load">[@spring.message "tab.Admin"/]</a>&nbsp;/&nbsp;<span class="fontBold">[@spring.message "${url}"/]</span></div>
[/#macro]

[#macro header pageTitle]
<html>
  <head>
    <title id="${pageTitle}">[@spring.message "${pageTitle}" /]</title>
    <link href="maincss.css.ftl" rel="stylesheet" type="text/css" />
    <link href="gazelle.css.ftl" rel="stylesheet" type="text/css" />
    <link href="screen.css.ftl" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="pages/framework/js/jquery/jquery-1.4.2.min.js"></script>   
  </head>
  <body>
[/#macro]
[#macro footer]

</body>
</html>
[/#macro]
