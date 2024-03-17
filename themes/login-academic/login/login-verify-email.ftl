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
      <h3 class="headline">${msg("emailVerifyTitle")}</h3>
    </v-card-title>
    <#if section = "form">
    <v-card-text>
      <p class="pb-3">
        ${msg("emailVerifyInstruction1")}
      </p>
      <p>
        ${msg("emailVerifyInstruction")}
      </p>
      <p class="pb-3">
        ${msg("resendEmailMessage")}
      </p>
			<div class="pb-5">
        <a href="${url.loginAction}"> 
          <v-btn
            color="primary"
            tabindex="1"
            variant="elevated"
          >
            ${msg("resendEmailButton")}
					</v-btn>
        </a>
			</div>

      <#if client?? && client.baseUrl?has_content>
        <a href="${client.baseUrl}">
          ${msg("backToApplication")}
        </a>
      </#if>
    </v-card-text>
    </#if>
  </v-card>
</@layout.registrationLayout>
