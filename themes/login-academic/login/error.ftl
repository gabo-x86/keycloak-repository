<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
  <div class="mb-5">
    <v-img
      src="${url.resourcesPath}/img/academic-management-logo.png"
      aspect-ratio="1"
      max-width="500"
      max-height="200"
    /></v-img>
  </div>
  <v-card class="elevation-3">
    <v-card-title class="pt-5 pb-5">       
      <h3 class="headline">${msg("errorTitle")}</h3>
    </v-card-title>
    <v-card-text>

      <#if section = "form">
        <div class="pb-5">
          <p>
            ${message.summary}
          </p>
        </div>
      </#if>

      <#if client?? && client.baseUrl?has_content>
        <div class="pb-5">
          <a href="${client.baseUrl}">
            ${msg("backToApplication")}
          </a>
        </div>
      </#if>
    </v-card-text>
  </v-card>
</@layout.registrationLayout>
