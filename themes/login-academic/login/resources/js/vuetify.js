const app = Vue.createApp({
  data() {
    return {
      rules: {
        required: (value) => !!value || ""
      },
      showpassword: false,
      showpasswordConfirm: false,
      loading: false,
    };
  },

  methods: {
    submit() {
      this.loading = true;
    }
  }
});

app.use(Vuetify.createVuetify({
  defaults: {
    icons: {
      defaultSet: 'mdi',
      sets: {},
    },
  }
}));

app.mount('#app');
