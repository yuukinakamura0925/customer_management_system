import Vue from "vue";
import App from "./App.vue";
import axios from "axios";
import router from "./router/index";
Vue.config.productionTip = false;

Vue.use(axios);

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
