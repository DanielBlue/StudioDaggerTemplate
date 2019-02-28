package ${packageName}.injector.modules;

import ${packageName}.data.source.Repository;

<#if isActivity>
	import ${packageName}.injector.PerActivity;
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Activity;
	<#else>
		import ${packageName}.module.${className}Activity;
	</#if>
<#else>
	import ${packageName}.injector.PerFragment;
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Fragment;
	<#else>
		import ${packageName}.module.${className}Fragment;
	</#if>
</#if>
	
	<#if dirName?trim?length gt 1>
		import ${packageName}.module.${dirName}.${className}Contract;
		import ${packageName}.module.${dirName}.${className}Presenter;
	<#else>
		import ${packageName}.module.${className}Contract;
		import ${packageName}.module.${className}Presenter;
	</#if>

import dagger.Module;
import dagger.Provides;

/**
 * Created by maoqi on 2018/6/7.
 */

@Module
public class ${className}Module {
	<#if isActivity>
		public final ${className}Activity view;
	<#else>
		public final ${className}Fragment view;
	</#if>

	<#if isActivity>
		public ${className}Module(${className}Activity view) {
			this.view = view;
		}
	<#else>
		public ${className}Module(${className}Fragment view) {
			this.view = view;
		}
	</#if>
    

	<#if isActivity>
		@PerActivity
	<#else>
		@PerFragment
	</#if>
    @Provides
    public ${className}Contract.Presenter providePresenter(Repository repository) {
        return new ${className}Presenter(view,repository);
    }
}
