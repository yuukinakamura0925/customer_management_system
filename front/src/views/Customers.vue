<template>
  <div>
    <h1>Customer list</h1>
    <v-btn  @click="$router.push({ name: 'customers_new'})">新規顧客登録</v-btn>
    <div class="my-16">
      <v-table>
        <thead>
          <tr>
            <th >
              Name
            </th>
            <th >
              Age
            </th>
            <th >
              Sex
            </th>
            <th >
              Memo
            </th>
            <th>
              Select button
            </th>
            <th>
              Bill button
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="customer in customers"
            :key="customer.id"
          >
            <td>{{ customer.name }}</td>
            <td>{{ customer.age }}</td>
            <td>{{ customer.sex }}</td>
            <td>{{ customer.memo }}</td>
            <td>
              <v-btn  @click="$router.push({ name: 'customer', params: { id: customer.id } })">詳細</v-btn>
              <v-btn  @click="$router.push({ name: 'customers_edit', params: { id: customer.id } })">編集</v-btn>
              <v-btn  @click="deleteRecord(customer.id)">削除</v-btn>
            </td>
              <v-btn  @click="$router.push({ name: 'bill', params: { cart_id: customer.cart.id } })">会計へ</v-btn>
            <td>

            </td>
          </tr>
    
        </tbody>
      </v-table>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      customers: null
    }
  },
  created() {
    let path = "http://localhost:3000/customers";
    this.axios
      .get(path)
      .then(
        response => (
          (this.customers = response.data)
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")){
        let path = "http://localhost:3000/customers/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
  }
};
</script>