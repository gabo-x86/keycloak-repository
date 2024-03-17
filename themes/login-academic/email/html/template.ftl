<#macro htmlEmailLayout>
<html>

  <head>
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/vuetify@3.0.5/dist/vuetify.min.css" rel="stylesheet"/>
  </head>

  <body>
    <div id="app">
      <v-app>
        <v-main>
          <#if realmName??>
            <v-alert
              color="success"
              icon="$success"
              title="<#nested 'emailTitle1'>"
              text="<#nested 'emailTitle2'>"
            ></v-alert>
          </#if>

          <v-card class="elevation-3">
            <v-card-text>
              <#nested "text">
              
              <a href="${link}">
                <v-btn
                  prepend-icon="mdi-check-circle"
                >
                  <template v-slot:prepend>
                    <v-icon color="success"></v-icon>
                  </template>
                  <#nested "linkText">
                </v-btn>
              </a>
            </v-card-text>
          </v-card>
        </v-main>
      </v-app>
    </div>

    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify@3.0.5/dist/vuetify.min.js"></script>
    <#if properties.scripts?has_content>
      <#list properties.scripts?split(' ') as script>
        <a href="#">${url.resourcesPath}/${script}</a>
        <script src="${url.resourcesUrl}/${script}" type="text/javascript"></script>
      </#list>
    </#if>
  </body>
</html>
</#macro>