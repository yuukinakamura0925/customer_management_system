import Vue from "vue";
import Router from "vue-router";
import Customers from "../views/Customers.vue";
import Customer from "../views/Customer.vue";
import CustomerNew from "../views/CustomerNew.vue";

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
      component: Customer,
    },
    {
      path: "/customer/new",
      name: "customer_new",
      component: CustomerNew,
    },
  ],
});
