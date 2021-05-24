<template>
  <div>
    <h1>Order list</h1>
    <button type="button" @click="$router.push({ name: 'bill'})">お会計へ</button>
    <table>
      <thead>
        <tr>
          <th >
            お会計番号
          </th>
          <th >
            お会計日時
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="order in orders"
          :key="order.id"
        >
          <td>{{ order.customer_id }}</td>
          <td>{{ order.created_at }}</td>
          <td><button type="button" @click="$router.push({ name: 'order', params: { id: order.id } })">お会計詳細</button></td>
          <td><button type="button" @click="$router.push({ name: 'orders_edit', params: { id: order.id } })">編集</button></td>
          <td><button type="button" @click="deleteRecord(order.id)">削除</button></td>
        </tr>
  
      </tbody>
    </table>

  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      orders: null
    }
  },
  created() {
    let path = "http://localhost:3000/orders";
    this.axios
      .get(path)
      .then(
        response => (
          (this.orders = response.data)
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")){
        let path = "http://localhost:3000/orders/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
  }
};
</script>