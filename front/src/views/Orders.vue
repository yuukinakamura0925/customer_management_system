<template>
  <div>
    <h1>お会計一覧</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'new_bill' })"
      >新規お会計</v-btn
    >
    <div>
      <v-container>
        <v-data-table :headers="headers" :items="orders">
          <template v-slot:[`item.action`]="{ item }">
            <v-icon small class="mr-2" @click="deleteRecord(item.id)"
              >mdi-delete
            </v-icon>
            <v-btn
              @click="$router.push({ name: 'order', params: { id: item.id } })"
              >お会計詳細へ</v-btn
            >
          </template>
        </v-data-table>
      </v-container>
    </div>
  </div>
</template>

<script lang="js">
export default {
  components: {
  },
  data() {
    return {
      orders: [],
      headers: [
        { text: "お会計ID", value: "id" },
        { text: "お会計日時", value: "created_at" },
        { text: "操作", value: "action" }
      ]
    }
  },
  created() {
    let baseURL = process.env.NODE_ENV === "production" ? "https://backend.customer-management-system.link" : "http://localhost:3000";
    let path = baseURL + "/orders";
    this.axios
      .get(path)
      .then(
        response => (
          (this.orders = response.data),
          this.displayLists = this.orders.slice(0,this.pageSize)
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")){
        let baseURL = process.env.NODE_ENV === "production" ? "https://backend.customer-management-system.link" : "http://localhost:3000";
        let path = baseURL + "/orders/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
  }
};
</script>
