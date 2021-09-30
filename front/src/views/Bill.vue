<template>
  <v-container>
    <h1>お会計ページ</h1>
    <v-card
      class="d-flex align-center justify-center pa-4 mx-auto"
      max-width="300"
      outlined
    >
      <div v-if="customer.name">
        <p>『{{ customer.name }}』さんのお会計</p>
      </div>
      <div v-else>
        『未登録のお客様』のお会計
      </div>
    </v-card>
    <div>
      <h2 class="my-16">メニュー一覧</h2>
    </div>

    <v-container fluid class="pa-0">
      <v-row class="mb-6" no-gutters>
        <v-col v-for="category in categories" :key="category.id">
          <v-btn v-on:click="toggleSwitch(category.id)" x-large color="primary" dark>
            {{ category.name }}
          </v-btn>
        </v-col>
      </v-row>
    </v-container>

    <div class="my-8">
      <v-card
        class="d-flex align-center justify-center pa-4 mx-auto"
        max-width="1000"
        outlined
      >
        <v-simple-table class="table_form">
          <thead>
            <tr>
              <th>
                メニュー名
              </th>
              <th>
                値段
              </th>
              <th></th>
            </tr>
          </thead>
          <tbody>

            <div v-if="select_menus.length">
              <tr v-for="menu in select_menus" :key="menu.id">
                <td class="text-left" width="300">
                  {{ menu.name }}
                </td>
                <td class="text-left" width="300">{{ menu.price }} 円</td>
                <td width="50">
                  <v-btn @click="createCartDetail(menu.id, cart.id, menu.price)"
                    >+</v-btn
                  >
                </td>
              </tr>
            </div>
            <div v-else>
              <tr v-for="menu in menus" :key="menu.id">
                <td class="text-left" width="300">
                  {{ menu.name }}
                </td>
                <td class="text-left" width="300">{{ menu.price }} 円</td>
                <td width="50">
                  <v-btn @click="createCartDetail(menu.id, cart.id, menu.price)"
                    >+</v-btn
                  >
                </td>
              </tr>
            </div>
            
          </tbody>
        </v-simple-table>
      </v-card>
    </div>

    <h2 class="my-16">お会計カート</h2>
    <div class="my-8">
      <v-card
        class="d-flex align-center justify-center pa-4 mx-auto"
        max-width="1000"
        outlined
      >
        <v-simple-table class="table_form">
          <thead>
            <tr>
              <th>
                メニュー名
              </th>
              <th>
                値段
              </th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="cart_detail in cart.cart_details" :key="cart_detail.id">
              <td class="text-left" width="300">
                {{ cart_detail.menu_id }}
              </td>
              <td class="text-left" width="300">{{ cart_detail.price }} 円</td>
              <td class="text-left" width="50">
                <v-btn @click="deleteRecord(cart_detail.id, cart.id)"
                  >削除</v-btn
                >
              </td>
            </tr>
          </tbody>
        </v-simple-table>
      </v-card>
      <div>
        <h3 class="mt-16">ご請求金額</h3>
        <v-card
          class="d-flex align-center justify-center pa-4 mx-auto"
          max-width="550"
          min-height="76"
          outlined
        >
          <div>
            <h2>{{ total }}円 (税込)</h2>
          </div>
        </v-card>
        <v-card
          class="d-flex align-center justify-center pa-4 mx-auto mt-16"
          max-width="550"
          min-height="76"
          outlined
        >
          <div>
            <v-text-field
              v-model="deposit"
              label="お預かり金額"
              placeholder="0"
              :rules="[() => !!deposit || 'お預かり金額を入力してください']"
            ></v-text-field>
          </div>
        </v-card>

        <h3 class="mt-16">おつり</h3>
        <v-card
          class="d-flex align-center justify-center pa-4 mx-auto"
          max-width="550"
          min-height="76"
          outlined
        >
          <div v-if="deposit - total <= 0">
            <h2>0 円</h2>
          </div>
          <div v-else>
            <h2>{{ deposit - total }} 円</h2>
          </div>
        </v-card>
        <v-btn class="mt-8" @click="orderCreate()">お会計確定</v-btn>
      </div>
    </div>
  </v-container>
</template>

<script lang="js">
// import CountUpButton from "../components/CountUpButton";

export default {
  components: {
  },
  data() {
    return {
      select_menus: [],
      menus: [],
      customer: null,
      cart:null,
      categories: null,
      total: 0,
      orderID: 0,
      deposit: 0
    }
  },
  filters: {
    // ここにbillingの計算がされる処理を書く
  },
  created() {
    let cartID = 0;
    let baseURL = process.env.NODE_ENV === "production" ? "http://backend.customer-management-system.link" : "http://localhost:3000";
    let path = baseURL +  "/menus";
    this.axios
      .get(path)
      .then(
        response => (
          (this.menus = response.data)
        ),
      );

    path = baseURL + "/categories";
    this.axios
      .get(path)
      .then(
        response => (
          (this.categories = response.data)
        ),
      );


    const customerID = this.$route.params["customer_id"];
    path = baseURL + "/customers/" + customerID;
    this.axios
      .get(path)
      .then(
        response => (
          (this.customer = response.data),
          cartID = this.customer.cart.id,
          path = baseURL + "/carts/" + cartID,
          this.axios
            .get(path)
            .then(
              response => (
                (this.cart = response.data.data)
              )
            )
        ),
      );
  },
  updated(){
    // menu.nameを表示させる処理
    let cart_details = this.cart.cart_details
    let menus = this.menus

    for (let i = 0; i < cart_details.length; i++) {
      for (let k = 0; k < menus.length; k++) {
        if (cart_details[i].menu_id == menus[k].id) {
          // menu_idにmenu.nameを格納
          cart_details[i].menu_id = menus[k].name
        }
      }
    };

    let total = 0
    for (let i = 0; i < cart_details.length; i++) {
      total += cart_details[i].price
    };
    this.total = total*11/10
  },

  methods: {
    createCartDetail(menuId,cartId,menuPrice){
      let baseURL = process.env.NODE_ENV === "production" ? "http://backend.customer-management-system.link" : "http://localhost:3000";
      let path = baseURL + "/carts/" + cartId + "/cart_details"
      let params = {
        cart_id: cartId,
        menu_id: menuId,
        qty: 1,
        price: menuPrice
      };
      this.axios
      .post(path, params)
      location.reload();
    },
    deleteRecord(cartDetailID,cartID) {
        let baseURL = process.env.NODE_ENV === "production" ? "http://backend.customer-management-system.link" : "http://localhost:3000";
        let path = baseURL + "/carts/" + cartID + "/cart_details/" + cartDetailID;
        this.axios
        .delete(path)
        location.reload();
    },
    orderCreate(){
      let baseURL = process.env.NODE_ENV === "production" ? "http://backend.customer-management-system.link" : "http://localhost:3000";
      let path = baseURL + "/orders/";
      let params = {
        cart_id: this.cart.id,

      };
      this.axios
      .post(path, params)
      location.reload();
    },
    calculationBill(){
      this.deposit - this.total
    },
    toggleSwitch(categoryID){
      this.select_menus = []
      let menus = this.menus
      for (let i = 0; i < menus.length; i++) {  
        if (menus[i].category_id == categoryID) {
            this.select_menus.push(menus[i])
        }
      };
    },



  }

};
</script>
<style>
.table_form {
  margin: 0 auto;
  max-width: 900px;
}
</style>
