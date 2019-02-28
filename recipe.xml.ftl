<?xml version="1.0"?>
<recipe>
	<#if isActivity>
		<instantiate from="root/src/app_package/SimpleActivity.java.ftl"
					   to="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Activity.java" />

		<open file="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Activity.java" />
		
		<merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
   
	<#else>
		<instantiate from="root/src/app_package/SimpleFragment.java.ftl"
					   to="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Fragment.java" />

		<open file="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Fragment.java" />
	</#if>
	<instantiate from="root/src/app_package/SimpleComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/injector/components/${className}Component.java" />

    <open file="${escapeXmlAttribute(srcOut)}/injector/components/${className}Component.java" />
	
	<instantiate from="root/src/app_package/SimpleContract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Contract.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java" />
	
	<instantiate from="root/src/app_package/SimpleModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/injector/modules/${className}Module.java" />

    <open file="${escapeXmlAttribute(srcOut)}/injector/modules/${className}Module.java" />
	
	<instantiate from="root/src/app_package/SimplePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Presenter.java" />

    <open file="${escapeXmlAttribute(srcOut)}/module/${dirName?replace('.', '/')}/${className}Presenter.java" />
	
	<#if generateLayout>
		<#if isActivity>
		<instantiate from="root/res/layout/simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/activity_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case}.xml" />
		<open file="${escapeXmlAttribute(resOut)}/layout/activity_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case}.xml" />
			
		<#else>
		<instantiate from="root/res/layout/simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/fragment_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case}.xml" />
			<open file="${escapeXmlAttribute(resOut)}/layout/fragment_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case}.xml" />
		</#if>
	</#if>
</recipe>
