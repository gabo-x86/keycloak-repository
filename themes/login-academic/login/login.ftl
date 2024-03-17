<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayMessage=true displayWide=(realm.password && social.providers??); section>
  <div class="mb-5">
    <v-img
      src="${url.resourcesPath}/img/academic-management-logo.png"
      aspect-ratio="1"
      max-width="500"
      max-height="200"
    /></v-img>
  </div>
  <#if message?has_content && message.type='success'>
    <v-alert 
      color="info"
      icon="$info"
      title="${msg('forgotPasswordSentMessage')}"
      text="${msg('emailSentMessage')}"
      class="text-left"
    ></v-alert>
  </#if>
  <v-card class="elevation-3">
    <v-card-title class="pt-10 pb-10">       
      <h3 class="headline">${msg("doLogIn")}</h3>
    </v-card-title>
    <v-card-text>
      <#if section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
          <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
            <#if realm.password>
              <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <span class="form__error-msg">${kcSanitize(messagesPerField.get("username"))}</span>
                <v-text-field
                  label='<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>'
                  :rules="[rules.required]"           
                  prepend-inner-icon="mdi-account"
                  clear-icon="clear"
                  id="username"
                  name="username"
                  tabindex="1"
                  autofocus
                  autocomplete="off"
                  clearable
                ></v-text-field>

                <span class="form__error-msg">${kcSanitize(messagesPerField.get("password"))}</span>
                <v-text-field
                  :rules="[rules.required]"            
                  :append-icon="showpassword ? 'mdi-eye-off' : 'mdi-eye'"              
                  prepend-inner-icon="mdi-lock"
                  :type="showpassword ? 'text' : 'password'"
                  id="password"
                  name="password"
                  autocomplete="off"
                  label='${msg("password")}'
                  @click:append="showpassword = !showpassword"
                  tabindex="2"
                ></v-text-field>
                <#if realm.resetPasswordAllowed>
                  <div class="w-100 d-flex">
                    <a dtabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                  </div>
                </#if>

                <#if realm.rememberMe && !usernameEditDisabled??>
                  <#if login.rememberMe??>
                    <v-checkbox 
                      label="${msg('rememberMe')}"
                      tabindex="3" 
                      id="rememberMe" 
                      name="rememberMe"
                      :value="true"
                    >
                    </v-checkbox>
                  <#else>
                    <v-checkbox
                      label="${msg('rememberMe')}"
                      tabindex="3"
                      id="rememberMe"
                      name="rememberMe"
                      :value="true"
                    >
                    </v-checkbox>
                  </#if>
                </#if>

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
                    tabindex="4"
                    variant="elevated"
                  >
                    ${msg("doLogIn")}
                  </v-btn>
                </v-card-actions>

              </form>
            </#if>
          </div>

          <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
              <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                <#list social.providers as p>
                  <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                </#list>
              </ul>
            </div>
          </#if>
        </div>

        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
          <div class="pt-5">
            <span>${msg("noAccount")} </span>
            <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
          </div>
        </#if>

      </#if>
    </v-card-text>
  </v-card>
</@layout.registrationLayout>
