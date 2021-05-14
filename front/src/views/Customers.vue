<template>
  <div>
    <h1>Customer list</h1>
    <button type="button" @click="$router.push({ name: 'customers_new'})">新規顧客登録</button>
    <table>
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
          <td><button type="button" @click="$router.push({ name: 'customer', params: { id: customer.id } })">詳細</button></td>
          <td><button type="button" @click="$router.push({ name: 'customers_edit', params: { id: customer.id } })">編集</button></td>
          <td><button type="button" @click="deleteRecord(customer.id)">削除</button></td>
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