import Vue from "vue";
import Router from "vue-router";
import Customers from "../views/Customers.vue";
import CustomerShow from "../views/CustomerShow.vue";
import CustomerNew from "../views/CustomerNew.vue";
import CustomerEdit from "../views/CustomerEdit.vue";
Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/customers",
      name: "customers",
      component: Customers,
    },
    {
      path: "/customers/:id",
      name: "customer",
      component: CustomerShow,
    },
    {
      path: "/customers_new",
      name: "customers_new",
      component: CustomerNew,
    },
    {
      path: "/customers/:id/edit",
      name: "customers_edit",
      component: CustomerEdit,
    },
  ],
});
