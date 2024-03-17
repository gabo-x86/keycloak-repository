<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false
  displayWide=false showAnotherWayIfPresent=true>
  <!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <#if properties.meta?has_content>
      <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" type="text/css" />
        </#list>
    </#if>

    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/vuetify@3.0.5/dist/vuetify.min.css" rel="stylesheet"/>

    <!--favicon link-->
    <#if properties.faviconpng?has_content>
            <link rel="icon" href="${url.resourcesPath}/${properties.faviconpng}" type="image/png" />
    <#else>
            <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    </#if>
    
</head>

<body>
  <div id="app">
    <v-app>
      <v-main>
        <v-container class="main-container">
          <v-row class="main-row" align="center" justify="center">

            <v-col cols="6" align="center">
              <#nested "form">
            </v-col>

          </v-row>
        </v-container>
      </v-main>
    </v-app>
  </div>


  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify@3.0.5/dist/vuetify.min.js"></script>
  <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
      <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
  </#if>
  
</body>
</html>
</#macro>
