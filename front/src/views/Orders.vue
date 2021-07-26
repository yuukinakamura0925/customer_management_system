<template>
  <div>
    <h1>お会計一覧</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'new_bill' })">新規お会計</v-btn>
    <div>
      <v-container>
          <v-data-table :headers="headers" :items="orders">
            <template v-slot:[`item.action`]="{ item }">
            
              <v-icon small class="mr-2" @click="deleteRecord(item.id)"
                >mdi-delete
              </v-icon>
              <v-btn 
                @click="
                  $router.push({ name: 'order', params: { id: item.id } })
                "
                >お会計詳細へ</v-btn
              >
            </template>
          </v-data-table>
        </v-container>
      </div>
    
  </div>
</template>

<script lang="js">
import moment from 'moment';
export default {
  filters: {
    moment: function (date) {
        return moment(date).format('YYYY年 MM月DD日 HH:mm');
    }
  },
  components: {
  },
  data() {
    return {
      orders: [],
      page: 1,
      displayLists: [],
      pageSize: 100,
      headers: [
        { text: "お会計ID", value: "id" },
        { text: "お会計日時", value: "created_at" },
        { text: "操作", value: "action" }
      ]
    }
  },
  created() {
    let path = "http://localhost:3000/orders";
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
        let path = "http://localhost:3000/orders/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
    pageChange: function(pageNumber){
      this.displayLists = this.orders.slice(this.pageSize*(pageNumber -1), this.pageSize*(pageNumber));
    },
  }
};
</script>
