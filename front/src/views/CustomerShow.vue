<template>
  <div>
    <h1>Customer info</h1>
    <form>
      <p>
        名前：{{ customer.name }}
      </p>
      <p>
        年齢：{{ customer.age }}
        
      </p>
      <p>
        性別：{{ customer.sex }}
      </p>
      <p>
        メモ：{{ customer.memo }}
      </p>
      <p>
      <input type="submit" value="編集" @click="$router.push({ name: 'customers_edit', params: { id: customer.id } })" >
      <input type="submit" value="登録" @click="create">
      </p>
      <input type="submit" value="一覧ページに戻る" @click="$router.push({ name: 'customers'})" >
      <p>

      </p>
    </form>  
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      customer: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/customers/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.customer = response.data)
        )
      );
  },
  // methods: {
  //   create() {
  //     let path = "http://localhost:3000/customers"
  //     this.axios
  //     .post(path,params)
  //   },
  //   delete() {
  //     const id = this.$route.params["id"];
  //     let path = "http://localhost:3000/customers/" + id;
  //     this.axios
  //     .delete(path)
  //   },
    
  // }
};
</script>