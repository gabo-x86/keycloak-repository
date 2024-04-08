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
      <h3 class="headline">${msg("Registrar usuario")}</h3>
    </v-card-title>
    <v-card-text>
      <#if section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
          <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
            <#if realm.password>
              <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <span class="form__error-msg">${kcSanitize(messagesPerField.get("firstName"))}</span>
                <v-text-field
                  label='${msg("firstName")}'
                  :rules="[rules.required]"
                  id="firstName"
                  name="firstName"
                  tabindex="1"
                  autofocus
                  autocomplete="on"
                  clearable
                ></v-text-field>

                <span class="form__error-msg">${kcSanitize(messagesPerField.get("lastName"))}</span>
                <v-text-field
                  label='${msg("lastName")}'
                  :rules="[rules.required]"      
                  id="lastName"
                  name="lastName"
                  tabindex="2"
                  autocomplete="on"
                  clearable
                ></v-text-field>

                <span class="form__error-msg">${kcSanitize(messagesPerField.get("email"))}</span>
                <v-text-field
                  label='${msg("email")}'
                  :rules="[rules.required]"
                  id="email"
                  name="email"
                  tabindex="3"
                  autocomplete="on"
                  clearable
                ></v-text-field>

                <#if !realm.registrationEmailAsUsername>
                <span class="form__error-msg">${kcSanitize(messagesPerField.get("username"))}</span>
                  <v-text-field
                    label='${msg("username")}'
                    :rules="[rules.required]"
                    id="username"
                    name="username"
                    tabindex="4"
                    autocomplete="on"
                    clearable
                    oninput="this.setCustomValidity('')"
                  ></v-text-field>
                </#if>
          
                <span class="form__error-msg">${kcSanitize(messagesPerField.get("password"))}</span>
                <#if passwordRequired>
                  <v-text-field
                    :rules="[rules.required]"        
                    :append-icon="showpassword ? 'mdi-eye-off' : 'mdi-eye'"
                    :type="showpassword ? 'text' : 'password'"
                    id="password"
                    name="password"
                    autocomplete="off"
                    label='${msg("password")}'
                    @click:append="showpassword = !showpassword"
                    tabindex="5"
                  ></v-text-field>

                  <span class="form__error-msg">${kcSanitize(messagesPerField.get("password-confirm"))}</span>
                  <v-text-field
                    :rules="[rules.required]"            
                    :append-icon="showpasswordConfirm ? 'mdi-eye-off' : 'mdi-eye'"
                    :type="showpasswordConfirm ? 'text' : 'password'"
                    id="password-confirm"
                    name="password-confirm"
                    label='${msg("passwordConfirm")}'
                    @click:append="showpasswordConfirm = !showpasswordConfirm"
                    tabindex="6"
                  ></v-text-field>
                </#if>

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
                    tabindex="6"
                    variant="elevated"
                  >
                    ${msg("doRegister")}
                  </v-btn>
                </v-card-actions>
              </form>
            </#if>
          </div>
        </div>
      
        <div class="pt-5">
          <span>${msg("¿Ya tienes una cuenta? ")}</span>
          <a href="${url.loginUrl}"> ${msg("doLogIn")}</a>
        </div>
      </#if>
    </v-card-text>
  </v-card>
</@layout.registrationLayout>
