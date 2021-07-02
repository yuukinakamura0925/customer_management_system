<template>
  <v-container>
    <h1>お会計ページ</h1>
    <div v-if="customer.name">
      『{{ customer.name }}』さんのお会計
    </div>
    <div v-else>
      『未登録のお客様』のお会計
    </div>
    <h2 class="mt-8">メニュー一覧</h2>
    
    <div class="my-8">
      <v-simple-table class="menu_table">
        <thead>
          <tr>
            <th> 
              メニュー名
            </th>
            <th >
              値段
            </th>
            <th >
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="menu in menus"
            :key="menu.id"
          >
            <td class="text-left" width="300">
              {{ menu.name }}
            </td>
            <td class="text-left" width="300">
              {{ menu.price }} 円
            </td>
            <td width="50">
              <v-btn @click="createCartDetail(menu.id,cart.id,menu.price)">+</v-btn>
            </td>

          </tr>
        </tbody>
      </v-simple-table>
    </div>
    <h2>お会計カート</h2>
    <div class="my-8">
      <v-simple-table class="menu_table">
        <thead>
          <tr>
            <th> 
              メニュー名
            </th>
            <th >
              値段
            </th>
            <th >
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
             v-for="cart_detail in cart.cart_details"
             :key="cart_detail.id"
          >
            <td class="text-left" width="300">
              {{ cart_detail.menu_id }}
            </td>
            <td class="text-left" width="300">
              {{ cart_detail.price }} 円  
            </td>
            <td class="text-left" width="50"> 
              <v-btn  @click="deleteRecord(cart_detail.id,cart.id)">削除</v-btn>
            </td>
          </tr>
        </tbody>
      </v-simple-table>
      <div>
        <p>ご請求金額{{total}}円</p>
        <v-text-field
          label="お預かり金額"
          :rules="rules"
          hide-details="auto"
        ></v-text-field>
        <p>おつり{{total}}円</p>
        <v-btn  @click="orderCreate()">お会計確定</v-btn>
      </div>
    </div>
  </v-container>
</template>

<script lang="js">
// import CountUpButton from "../components/CountUpButton";

export default {
  components: {
    // CountUpButton,
  },
  data() {
    return {
      menus: null,
      customer: null,
      cart:null,
      total: 0,
      orderID: 0
    }
  },
  filters: {
    // ここにbillingの計算がされる処理を書く
  },
  created() {
    let cartID = 0;

    let path = "http://localhost:3000/menus";
    this.axios
      .get(path)
      .then(
        response => (
          (this.menus = response.data)
        ),
      );

    const customerID = this.$route.params["customer_id"];
    path = "http://localhost:3000/customers/" + customerID;
    this.axios
      .get(path)
      .then(
        response => (
          (this.customer = response.data),
          console.log(this.customer.cart.id),
          cartID = this.customer.cart.id,
          path = "http://localhost:3000/carts/" + cartID,
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
  
  },

  methods: {
    calculationBill(menuPrice){
      this.total += menuPrice
      if(this.total < 0){
        this.total = 0
      }
    },
    createCartDetail(menuId,cartId,menuPrice){
      let path = "http://localhost:3000/carts/" + cartId + "/cart_details"
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

        let path = "http://localhost:3000/carts/" + cartID + "/cart_details/" + cartDetailID; 
        this.axios
        .delete(path)
        location.reload();
    },
    orderCreate(){ 
      alert("テスト用、カートidを次にアラート")
      alert(this.cart.id)
      let path = "http://localhost:3000/orders/";
      let params = {
        cart_id: this.cart.id,
      };
      this.axios
      .post(path, params)
      location.reload();
    },
  }
  
};
</script>
<style>
  .menu_table {
    width: 900px ;
    margin: 0 auto;
  }
</style>