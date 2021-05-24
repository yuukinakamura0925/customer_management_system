<template>
  <div>
    <h1>Customer edit</h1>
    <form>
      <p>
        名前：<input type="text" v-model="customer.name" size="40">
      </p>
      <p>
        年齢：<input type="text" v-model="customer.age" size="40">
      </p>
      <p>
        性別：<input type="text" v-model="customer.sex" size="40">
      </p>
      <p>
        メモ：<input type="text" v-model="customer.memo" size="40">
      </p>
      <p>
      <input type="submit" value="編集" @click="update">
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
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")){
        const id = this.$route.params["id"];
      let path = "http://localhost:3000/customers/" + id;
      let params = {
        name: this.customer.name,
        age: this.customer.age,
        sex: this.customer.sex,
        memo: this.customer.memo 
      };
      this.axios
      .put(path,params)
      }
      this.$router.push({ name: "customers" });
      location.reload();
    },
  }
};
</script>