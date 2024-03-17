<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>

  <v-card class="elevation-3">
    <v-card-text>
      <a href="">Info</a>
      <a href="${link}">
        <v-btn
          prepend-icon="mdi-check-circle"
        >
          <template v-slot:prepend>
            <v-icon color="success"></v-icon>
          </template>
        </v-btn>
      </a>
    </v-card-text>
  </v-card>
  

  <#if section = "title">
    ${message.summary}
  <#elseif section = "header">
    ${message.summary}
  <#elseif section = "back">
    <#if client?? && client.baseUrl?has_content>
      <a class="link-back" href="${client.baseUrl}">
        <i class="holi-icon-arrow_back"></i>
        ${msg("backToApplication")}
      </a>
    </#if>
  <#elseif section = "form">
    <!--EMAIL ALREADY SENT TEMPLATE-->
    <div id="kc-info-message">
      <p class="instruction">${message.summary}<#if requiredActions??>:</p>
      <#list requiredActions>
        <ul class="list list-bullet">
          <#items as reqActionItem><li>${msg("requiredAction.${reqActionItem}")}</li></#items>
        </ul>
      </#list>
  <#else>

  </#if>

  <#if skipLink??>
  <#else>
  <h3 class="headline">${msg("ESte es un errOR")}</h3>
    <#if pageRedirectUri??>
      <p><a class="button" href="${pageRedirectUri}">${msg("backToApplication")?no_esc}</a></p>
    <#elseif actionUri??>
      <p><a class="button" href="${actionUri}">${msg("proceedWithAction")?no_esc}</a></p>
    <#elseif client.baseUrl??>
      <p><a class="button" href="${client.baseUrl}">${msg("backToApplication")?no_esc}</a></p>
    </#if>
  </#if>
        </div>
</#if>
</@layout.registrationLayout>
