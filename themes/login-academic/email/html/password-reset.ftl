<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("passwordResetBodyHtml", linkExpiration, realmName)?no_esc}
    </#if>
    <#if section = "linkText">
        ${msg("passwordResetLinkTextHtml")?no_esc}
    </#if>
    <#if section = "emailTitle1">
        ${msg('emailResetPasswordTitle1')?no_esc}
    </#if>
    <#if section = "emailTitle2">
        ${msg('emailResetPasswordTitle2')?no_esc}
    </#if>
</@layout.htmlEmailLayout>
