<template>
  <div>
    <h1>お会計一覧</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'new_bill'})">新規お会計</v-btn>
    <v-container>
      <v-simple-table  class="table_form">
        <thead>
          <tr>
            <th >
              お会計番号
            </th>
            <th >
              お会計日時
            </th>
            <th >
            </th>
            <th >
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="order in displayLists"
            :key="order.id"
          >
            <td class="text-left">{{ order.id }}</td>
            <td class="text-left">{{ order.created_at | moment }}</td>
            <td class="text-left"><v-btn  @click="$router.push({ name: 'order', params: { id: order.id } })">お会計詳細</v-btn></td>
            <td class="text-right">
              <v-btn  @click="$router.push({ name: 'orders_edit', params: { id: order.id } })">編集</v-btn>
              <v-btn  @click="deleteRecord(order.id)">削除</v-btn>
            </td>
          </tr>
    
        </tbody>
      </v-simple-table>
      <v-pagination
        v-model="page"
        :length="10"
        @input = "pageChange"
        circle
      ></v-pagination>
    </v-container>

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
      orders: null,
      page: 1,
      displayLists: [],
      pageSize: 100,
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