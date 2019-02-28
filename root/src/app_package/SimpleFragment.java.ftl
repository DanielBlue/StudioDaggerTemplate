<#if dirName?trim?length gt 1>
	package ${packageName}.module.${dirName};
<#else>
	package ${packageName}.module;
</#if>

import ${packageName}.injector.modules.${className}Module;
import ${packageName}.module.base.BaseFragment;

public class ${className}Fragment extends BaseFragment implements ${className}Contract.View {

	@Inject
    ${className}Contract.Presenter  mPresenter;

    @Override
    protected void initInjector() {
		Dagger${className}Component
                .builder()
                .applicationComponent(AndroidApplication.getInstance().getAppComponent())
                .${className?uncap_first}Module(new ${className}Module(this))
                .build()
                .inject(this);
    }

    @Override
    protected int attachLayoutRes() {
	<#if generateLayout>
		return R.layout.fragment_${className?replace('([a-z])([A-Z]+)','$1_$2','r')?lower_case};
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
	
	public static ${className}Fragment newInstance() {
		${className}Fragment fragment = new ${className}Fragment();
        return fragment;
    }
}