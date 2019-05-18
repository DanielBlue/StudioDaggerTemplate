<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="${packageName}">

    <application>
	<#if dirName?trim?length gt 1>
		<activity android:name="${packageName}.module.${dirName}.${className}Activity"
				  android:screenOrientation="portrait"/>
	<#else>
		<activity android:name="${packageName}.module.${className}Activity"
		          android:screenOrientation="portrait"/>
	</#if>
        
    </application>
</manifest>
