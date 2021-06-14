<template>
  <div>
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
              <v-btn @click="createCartDetail(1,1)">+</v-btn>
            </td>
            <td>
              {{ menu.price }}
            </td>
            <td>
              <v-btn @click="cartDetailCreate">確定</v-btn>
            </td>
          </tr>
      </tbody>
      </v-table>
    </div>
    <p>1
      ご請求金額{{total}}円
    </p>
    <form>
      <p>
        お預かり：<input type="text" size="40">円
      </p>
      <p>
        <v-btn  @click="$router.push({ name: 'bill'})">支払いへ進む</v-btn>
      </p>
    </form>
  </div>
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
      cusotmer: null,
      cart:null,
      total: 0
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
          (this.cart = response.data)
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
    createCartDetail(menuId,cartId){
      alert(params)
      let path = "http://localhost:3000/carts/" + cartId + "/cart_details"
      let params = {
        cart_id: cartId,
        menu_id: menuId,
        qty: 1
      };
      alert(params)
      this.axios
      .post(path, params)
    }
  }
};
</script>