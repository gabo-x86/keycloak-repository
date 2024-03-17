<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
  <div class="mb-5">
    <v-img
      src="${url.resourcesPath}/img/academic-management-logo.png"
      aspect-ratio="1"
      max-width="500"
      max-height="200"
    /></v-img>
  </div>
  <v-card class="elevation-3">
    <v-card-title class="pt-10 pb-10">       
      <h3 class="headline">${msg("¿Olvidaste tu contraseña?")}</h3>
    </v-card-title>
    <v-card-text>
      <#if section = "form">
        <#if realm.password>
          <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <span class="form__error-msg">${kcSanitize(messagesPerField.get("email"))}</span>
            <v-text-field
              label='${msg("Ingresa el email enlazado a tu cuenta")}'
              :rules="[rules.required]"
              prepend-inner-icon="mdi-email"
              id="username"
              name="username"
              tabindex="1"
              autocomplete="off"
              clearable
            ></v-text-field>
            <v-card-actions>
              <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
              <v-btn 
                block 
                color="primary"
                name="login"
                id="kc-login"
                @click="submit"
                :loading="loading"
                size="large"
                type="submit"
                tabindex="2"
                variant="elevated"
              >
                ${msg("doSubmit")?no_esc}
              </v-btn>
            </v-card-actions>
          </form>
        <#elseif section = "info" >
          ${msg("emailInstruction")}
        </#if>
      </#if>
    </v-card-text>
  </v-card>

  <div class="pt-5">
    <span>${msg("rememberYourPassword")} </span>
    <a tabindex="3" href="${url.loginUrl}"> ${msg("doLogIn")}</a>
  </div>
  <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
    <div class="pt-3">
      <span>${msg("noAccount")} </span>
      <a tabindex="4" href="${url.registrationUrl}">${msg("doRegister")}</a>
    </div>
  </#if>
</@layout.registrationLayout>
