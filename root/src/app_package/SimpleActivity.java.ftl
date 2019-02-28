<#if dirName?trim?length gt 1>
	package ${packageName}.module.${dirName};
<#else>
	package ${packageName}.module;
</#if>

import ${packageName}.injector.modules.${className}Module;

<#if isToolbar>
	import ${packageName}.module.base.ToolbarActivity;
<#else>
	import ${packageName}.module.base.BaseActivity;
</#if>

import javax.inject.Inject;

<#if isToolbar>
	public class ${className}Activity extends ToolbarActivity implements ${className}Contract.View {
<#else>
	public class ${className}Activity extends BaseActivity implements ${className}Contract.View {
</#if>

	@Inject
    ${className}Contract.Presenter  mPresenter;
	
	public static void start(Context context) {
        Intent intent = new Intent(context, ${className}Activity.class);
        context.startActivity(intent);
    }
	
    @Override
    protected void initInjector() {
		Dagger${className}Component
                .builder()
                .applicationComponent(AndroidApplication.getInstance().getAppComponent())
                .${className?uncap_first}Module(new ${className}Module(this))
                .build()
                .inject(this);
    }
	
	
	<#if isToolbar>
		@Override
		protected String setToolbarTitle() {
			return null;
		}
	</#if>
	
    @Override
    protected int attachLayoutRes() {
	<#if generateLayout>
		return R.layout.activity_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case};
		<#else>
		return 0;
	</#if>
        
    }
	
	@Override
    protected void initData() {
        
    }

    @Override
    protected void initView() {

    }

    @Override
    protected void loadData() {

    }
}
