<template>
  <div>
    <h1>顧客情報</h1>
    <div class="my-16">
      <v-simple-table class="table_form my-16">
        <thead>
          <tr>
            <th >
              顧客id
            </th>
            <th >
              お会計日時
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left">
              <v-btn  @click="$router.push({ name: 'customer', params: { id: order.customer_id } })">
                {{ order.customer_id }}
              </v-btn>
            </td>
            <td class="text-left">{{ order.created_at | moment }}</td>
          </tr>
        </tbody>
      </v-simple-table>
      <h2>オーダー詳細</h2>
      <v-simple-table class="table_form">
        <thead>
          <tr>
            <th>
              メニュー名
            </th>
            <th>
              値段
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="order_detail in order.order_details"
             :key="order_detail.id"
          >
            <th class="text-left">
              {{ order_detail.menu_name }}
            </th>
            <th class="text-left">
              {{ order_detail.menu_price }}
            </th>
          </tr>
        </tbody>
      </v-simple-table>
      <p class="my-16">
        <v-btn
          @click="$router.push({ name: 'orders'})"
        >
          一覧ページに戻る
        </v-btn> 
      </p>
    </div>  
  </div>
</template>

<script lang="ts">
import moment from 'moment';
export default {
  filters: {
    moment: function (date) {
        return moment(date).format('YYYY年 MM月DD日 HH:mm');
    },
  },
  components: {
  },
  data() {
    return {
      order: null,
      customers: null,
    }
  },
  
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/orders/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.order = response.data.data)
        )
      );
    path = "http://localhost:3000/menus";
    this.axios
      .get(path)
      .then(
        response => (
          (this.menus = response.data)
        ),
      ); 
    path = "http://localhost:3000/customers";
    this.axios
      .get(path)
      .then(
        response => (
          (this.customers = response.data)
        ),
      );
  },
 
  methods: {
    // convertToCustomerName() {
    //   // TODO なぜかランダムでidの時と名前の時がある
    //   // customer.nameを表示させる処理
      
    //   let order = this.order
    //   // console.log(order.customer_id)
    //   let customers = this.customers
    //   // console.log(customers)
    //   for (let i = 0; i < customers.length; i++) {
    //     if (order.customer_id == customers[i].id) {
    //       // order_idにcustomer.nameを格納 
    //       // console.log("test")
    //       order.customer_id = customers[i].name
    //     }
    //   };
    // },
  },
  
};
</script>