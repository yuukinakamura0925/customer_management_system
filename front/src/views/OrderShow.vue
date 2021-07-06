<template>
  <div>
    <h1>顧客情報</h1>
    <form>
      <p>
        名前：{{ order.customer_id }}
      </p>
      <p>
        お会計日時：{{ order.created_at }}
      </p>
      <p>
        オーダー詳細：{{ order.order_details}}
      </p>
     
     
      
        <v-btn
        class="mr-4"
        @click="$router.push({ name: 'orders'})"
        >
        一覧ページに戻る
        </v-btn>
    </form>  
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
  },
 
};
</script>