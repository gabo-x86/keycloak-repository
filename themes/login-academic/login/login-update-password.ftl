<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
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
      <h3 class="headline">${msg("updatePasswordTitle")}</h3>
    </v-card-title>
    <v-card-text>
      <#if section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
          <span class="form__error-msg">${kcSanitize(messagesPerField.get("password"))}</span>
            <v-text-field
              :rules="[rules.required]"            
              :append-icon="showpassword ? 'mdi-eye-off' : 'mdi-eye'"              
              prepend-inner-icon="mdi-lock"
              :type="showpassword ? 'text' : 'password'"
              id="password"
              name="password-new"
              autocomplete="off"
              label='${msg("newPassword")}'
              @click:append="showpassword = !showpassword"
              tabindex="1"
            ></v-text-field>

            <span class="form__error-msg">${kcSanitize(messagesPerField.get("password-confirm"))}</span>
            <v-text-field
              :rules="[rules.required]"
              prepend-inner-icon="mdi-lock"
              :type="showpassword ? 'text' : 'password'"
              id="password-change"
              name="password-confirm"
              label='${msg("passwordConfirm")}'
              tabindex="2"
            ></v-text-field>

            <v-card-actions>
              <v-spacer></v-spacer>
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
                tabindex="3"
                variant="elevated"
              >
                ${msg("changePassword")}
              </v-btn>
            </v-card-actions>
        </form>

        <div class="pt-5">
          <span>${msg("rememberYourPassword")} </span>
          <a tabindex="4" href="${url.loginUrl}"> ${msg("doLogIn")}</a>
        </div>
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
          <div class="pt-3">
            <span>${msg("noAccount")} </span>
            <a tabindex="5" href="${url.registrationUrl}">${msg("doRegister")}</a>
          </div>
        </#if>
      </#if>
    </v-card-text>
  </v-card>
</@layout.registrationLayout>
