<template>
  <div>
    <h1>Bill page</h1>
    {{ cart }}
    <table>
      <thead>
        <tr>
          <th >
            MenuList
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
            <CountUpButton 
              @catchCount="calculationBill"
              :name.sync="menu.name"
              :price.sync="menu.price"
            />
            
          </td>
          <td>{{ menu.price }}</td>
        </tr>
      </tbody>
    </table>
    <p>ご請求金額{{total}}円</p>
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
import CountUpButton from "../components/CountUpButton";

export default {
  components: {
    CountUpButton,
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
  }
};
</script>