<template>
  <div>
    <h1>顧客情報</h1>
    <div class="my-16">
      <v-simple-table class="table_form my-16">
        <thead>
          <tr>
            <th >
              顧客（id・名前）
            </th>
            <th >
              お会計日時
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left">{{ order.customer_id }}</td>
            <td class="text-left">{{ order.created_at }}</td>
            <!-- <td class="text-left">{{ order.order_details }}</td> -->
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
export default {
  components: {
  },
  data() {
    return {
      order: null,
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
  },
};
</script>