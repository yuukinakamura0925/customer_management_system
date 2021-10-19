<template>
  <div>
    <h1>顧客リスト</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'customers_new' })"
      >新規顧客登録</v-btn
    >

    <div class="my-16 ">
      <v-container style="max-width: 900px">
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="顧客検索（ID、名前、性別、メモいずれかで検索）"
          single-line
          hide-details
        ></v-text-field>
        <v-data-table :headers="headers" :items="customers" :search="search">
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
      search: "",
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
    let baseURL =
      process.env.NODE_ENV === "production"
        ? "https://backend.customer-management-system.link"
        : "http://localhost:3000";

    let path = baseURL + "/customers";
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
      let baseURL =
        process.env.NODE_ENV === "production"
          ? "https://backend.customer-management-system.link"
          : "http://localhost:3000";
      if (confirm("削除してもよろしいでしょうか？")) {
        let path = baseURL + "/customers/" + id;
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
