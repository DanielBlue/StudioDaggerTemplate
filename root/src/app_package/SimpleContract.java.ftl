<#if dirName?trim?length gt 1>
	package ${packageName}.module.${dirName};
<#else>
	package ${packageName}.module;
</#if>

import ${packageName}.module.base.IBasePresenter;
import ${packageName}.module.base.IBaseView;

public interface ${className}Contract {
    interface View extends IBaseView{

    }

    interface Presenter extends IBasePresenter{}

}
