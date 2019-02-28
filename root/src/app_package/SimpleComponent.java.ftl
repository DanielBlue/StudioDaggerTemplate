package ${packageName}.injector.components;
<#if isActivity>
	import ${packageName}.injector.PerActivity;
<#else>
	import ${packageName}.injector.PerFragment;
</#if>
	import ${packageName}.injector.modules.${className}Module;

<#if isActivity>
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Activity;
	<#else>
		import ${packageName}.module.${className}Activity;
	</#if>
	
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Activity;
	<#else>
		import ${packageName}.module.${className}Activity;
	</#if>

<#else>
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Fragment;
	<#else>
		import ${packageName}.module.${className}Fragment;
	</#if>
</#if>
	import dagger.Component;

<#if isActivity>
	@PerActivity
<#else>
	@PerFragment
</#if>
@Component(dependencies = ApplicationComponent.class,modules = ${className}Module.class)
public interface ${className}Component {
	<#if isActivity>
		void inject(${className}Activity view);
	<#else>
		void inject(${className}Fragment view);
	</#if>
    
}
