<template>
  <div>
    <h1>Bill page</h1>
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
              :name="menu.name"
              :price="menu.price"
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
  },
  methods: {
    calculationBill(menuPrice){
      this.total += menuPrice
      if(this.total < 0){
        this.total = 0
      }
    }
  }
};
</script>