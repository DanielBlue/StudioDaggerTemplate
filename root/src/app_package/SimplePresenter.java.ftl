<#if dirName?trim?length gt 1>
	package ${packageName}.module.${dirName};
<#else>
	package ${packageName}.module;
</#if>

import ${packageName}.data.source.Repository;
import ${packageName}.utils.NullUtils;


public class ${className}Presenter implements ${className}Contract.Presenter {
    private final ${className}Contract.View m${className}View;
    private final Repository mRepository;

    public ${className}Presenter(${className}Contract.View view, Repository mRepository) {
        this.m${className}View = NullUtils.checkNotNull(view);
        this.mRepository = NullUtils.checkNotNull(mRepository);
    }
}
