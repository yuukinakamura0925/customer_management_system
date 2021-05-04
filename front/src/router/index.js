import Vue from "vue";
import Router from "vue-router";
import Customers from "../views/Customers.vue";
Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/customers",
      name: "customers",
      component: Customers,
    },
  ],
});
