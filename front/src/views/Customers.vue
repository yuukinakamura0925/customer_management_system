<template>
  <div>
    <h1>顧客リスト</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'customers_new' })"
      >新規顧客登録</v-btn
    >
    <div class="serch_box my-16">
      <v-text-field
        type="text"
        v-model="keyword"
        label="顧客名検索"
      ></v-text-field>
    </div>
    <div class="my-16 ">
      <v-container>
        <v-data-table :headers="headers" :items="customers">
          <template v-slot:[`item.action`]="{ item }">
            <router-link :to="{ name: 'customer', params: { id: item.id } }">
              <v-icon small class="mr-2">mdi-account-details</v-icon>
            </router-link>
            <router-link
              :to="{ name: 'customers_edit', params: { id: item.id } }"
            >
              <v-icon small class="mr-2">mdi-pencil</v-icon>
            </router-link>
            <v-icon small class="mr-2" @click="deleteRecord(item.id)"
              >mdi-delete
            </v-icon>
            <v-btn
              @click="
                $router.push({ name: 'bill', params: { customer_id: item.id } })
              "
              >会計へ</v-btn
            >
          </template>
        </v-data-table>
      </v-container>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {},
  data() {
    return {
      keyword: "",
      customers: [],
      page: 1,
      displayLists: [],
      pageSize: 1,
      headers: [
        { text: "顧客ID", value: "id" },
        { text: "氏名", value: "name" },
        { text: "年齢", value: "age" },
        { text: "性別", value: "sex" },
        { text: "メモ", value: "memo" },
        { text: "操作", value: "action" }
      ]
    };
  },
  computed: {
    // 検索窓の絞り込み
    filteredCustomers: function() {
      var customers = [];
      for (var i in this.displayLists) {
        var customer = this.displayLists[i];
        if (customer.name.indexOf(this.keyword) !== -1) {
          customers.push(customer);
        }
      }
      return customers;
      // return customers.slice().reverse();
    }
  },
  created() {
    let path = "http://localhost:3000/customers";
    this.axios
      .get(path)
      .then(
        response => (
          (this.customers = response.data),
          (this.displayLists = this.customers.slice(0, this.pageSize))
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")) {
        let path = "http://localhost:3000/customers/" + id;
        this.axios.delete(path);
        location.reload();
      }
    },
    pageChange: function(pageNumber) {
      this.displayLists = this.customers.slice(
        this.pageSize * (pageNumber - 1),
        this.pageSize * pageNumber
      );
    }
  }
};
</script>
<style>
.serch_box {
  width: 400px !important;
  margin: 0 auto;
}
</style>
