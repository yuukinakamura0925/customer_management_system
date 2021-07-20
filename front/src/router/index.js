import Vue from "vue";
import Router from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import Customers from "../views/Customers.vue";
import CustomerShow from "../views/CustomerShow.vue";
import CustomerNew from "../views/CustomerNew.vue";
import CustomerEdit from "../views/CustomerEdit.vue";
import Menus from "../views/Menus.vue";
import MenuShow from "../views/MenuShow.vue";
import MenuNew from "../views/MenuNew.vue";
import MenuEdit from "../views/MenuEdit.vue";
import Orders from "../views/Orders.vue";
import OrderShow from "../views/OrderShow.vue";
import NewBill from "../components/NewBill.vue";
import Bill from "../views/Bill.vue";
import Categories from "../views/Categories.vue";
import CategoryShow from "../views/CategoryShow.vue";
import CategoryNew from "../views/CategoryNew.vue";
import CategoryEdit from "../views/CategoryEdit.vue";

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: "/login",
      name: "login",
      component: Login,
    },
    {
      path: "/home",
      name: "home",
      component: Home,
    },
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
    {
      path: "/orders",
      name: "orders",
      component: Orders,
    },
    {
      path: "/orders/:id",
      name: "order",
      component: OrderShow,
    },
    // {
    //   path: "/orders_new",
    //   name: "orders_new",
    //   component: OrderNew,
    // },
    // {
    //   path: "/orders/:id/edit",
    //   name: "orders_edit",
    //   component: OrderEdit,
    // },
    {
      path: "/new_bill",
      name: "new_bill",
      component: NewBill,
    },
    {
      // パスにidのパラメーターをもたせる。
      path: "/bill/:customer_id",
      name: "bill",
      component: Bill,
    },
    {
      path: "/categories",
      name: "categories",
      component: Categories,
    },
    {
      path: "/categories/:id",
      name: "category",
      component: CategoryShow,
    },
    {
      path: "/categories_new",
      name: "categories_new",
      component: CategoryNew,
    },
    {
      path: "/categories/:id/edit",
      name: "categories_edit",
      component: CategoryEdit,
    },
  ],
});
