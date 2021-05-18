import Vue from "vue";
import Router from "vue-router";
import Customers from "../views/Customers.vue";
import CustomerShow from "../views/CustomerShow.vue";
import CustomerNew from "../views/CustomerNew.vue";
import CustomerEdit from "../views/CustomerEdit.vue";
import Menus from "../views/Menus.vue";
import MenuShow from "../views/MenuShow.vue";
import MenuNew from "../views/MenuNew.vue";
import MenuEdit from "../views/MenuEdit.vue";

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
    {
      path: "/menus",
      name: "menus",
      component: Menus,
    },
    {
      path: "/menus/:id",
      name: "menu",
      component: MenuShow,
    },
    {
      path: "/menus_new",
      name: "menus_new",
      component: MenuNew,
    },
    {
      path: "/menus/:id/edit",
      name: "menus_edit",
      component: MenuEdit,
    },
  ],
});
