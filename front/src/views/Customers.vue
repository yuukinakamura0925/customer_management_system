<template>
  <div>
    <h1>顧客リスト</h1>
    <v-btn  @click="$router.push({ name: 'customers_new'})">新規顧客登録</v-btn>
    <div class="serch_box">
      <v-text-field type="text" v-model="keyword" label="顧客名検索" ></v-text-field>
    </div>
    <div class="my-16">
      <v-simple-table class="table_form">
        <thead>
          <tr>
            <th >
              氏名
            </th>
            <th >
              年齢
            </th>
            <th >
              性別
            </th>
            <th >
              特記事項
            </th>
            <th>
              Select button
            </th>
            <th>
              お会計ページへ
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="customer in filteredCustomers"
            :key="customer.id"
          >
            <td class="text-left">{{ customer.name }}</td>
            <td class="text-left">{{ customer.age }}</td>
            <td class="text-left">{{ customer.sex }}</td>
            <td class="text-left">{{ customer.memo }}</td>
            <td class="text-left">
              <v-btn  @click="$router.push({ name: 'customer', params: { id: customer.id } })">詳細</v-btn>
              <v-btn  @click="$router.push({ name: 'customers_edit', params: { id: customer.id } })">編集</v-btn>
              <v-btn  @click="deleteRecord(customer.id)">削除</v-btn>
            </td>
            <td class="text-left">
              <v-btn  @click="$router.push({ name: 'bill', params: { customer_id: customer.id } })">会計へ</v-btn>
            </td>
          </tr>
    
        </tbody>
      </v-simple-table>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      keyword: '',
      customers: null
    }
  },
  computed: {
    // 検索窓の絞り込み 
    filteredCustomers: function() {
       var customers = [];
    for(var i in this.customers) {
        var customer = this.customers[i];
        if(customer.name.indexOf(this.keyword) !== -1) {
            customers.push(customer);
        }
    }
    return customers;
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
<style>
  .serch_box {
    width: 400px !important;
    margin:0 auto;
  }
</style>