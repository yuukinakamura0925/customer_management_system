import Vue from "vue";
import store from "./store/index";
import App from "./App.vue";
import axios from "axios";
import VueAxios from "vue-axios";
import router from "./router";
import vuetify from "./plugins/vuetify";
Vue.config.productionTip = false;

Vue.use(VueAxios, axios);

new Vue({
  router,
  vuetify,
  store,
  render: (h) => h(App),
}).$mount("#app");
