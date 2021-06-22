<template>
  <v-container>
    <h1>Bill page</h1>
    <div >
      {{ cart }}
    </div>
    <div class="my-16">
      <v-table>
        <thead>
          <tr>
            <th> 
              MenuList
            </th>
            <th >
              Count
            </th>
            <th >
              price
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="menu in menus"
            :key="menu.id"
          >
            <td>
              {{ menu.name }}
            </td>
            <td>
              <!-- <CountUpButton 
                @click="createCartDetail(menu.id,cart.id)"
                @catchCount="calculationBill"
                :name.sync="menu.name"
                :price.sync="menu.price"
              /> -->
              <v-btn @click="createCartDetail(menu.id,cart.id,menu.price)">+</v-btn>
            </td>
            <td>
              {{ menu.price }}
            </td>
          </tr>
      </tbody>
      </v-table>
    </div>
    <div>
      <v-table >
        <thead>
          <tr>
            <th> 
              MenuList
            </th>
            <th >
              price
            </th>
            <th >
              delete
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
             v-for="cart_detail in cart.cart_details"
             :key="cart_detail.id"
          >
            <td>
              {{ cart_detail.menu_id }}
            </td>
            <td>
              {{ cart_detail }}
            </td>
            <td>
              <v-btn  @click="deleteRecord(cart_detail.id,cart.id)">削除</v-btn>
            </td>
          </tr>
        </tbody>
      </v-table>
    </div>
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
    let path = "http://localhost:3000/menus";
    this.axios
      .get(path)
      .then(
        response => (
          (this.menus = response.data)
        )
      );

    const cartID = this.$route.params["cart_id"];
    // const cartID = 1;
    path = "http://localhost:3000/carts/" + cartID;
    this.axios
      .get(path)
      .then(
        response => (
          (this.cart = response.data.data)
        ),
      );
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
    // 二回ポストせず、cart_idで全部送ってordersコントローラーでorder_detailsのデータも一気にcreateする処理をかく。NewBillのcustomerとcartも同じように一回のFrontからのpostで処理する。
    orderCreate(){ 
      alert("テスト用、カートidを次にアラート")
      alert(this.cart.id)
      let path = "http://localhost:3000/orders/";
      let params = {
        cart_id: this.cart.id,
      };
      this.axios
      .post(path, params)
      
    },
    //   .then(
    //     response => (
    //       (this.orderID= response.data.data.id), // TODO
    //         path = "http://localhost:3000/orders/" + this.orderID + "/order_details/"
    //         params = {
    //           order_id: this.orderID,
    //           menu_id: this.cart.cart_details
    //         },
    //         this.axios
    //           .post(path, params)
    //     )
    //   )

    //   location.reload()
      
    // },
  }
};
</script>