<template>
  <div>
    <h1>Category edit</h1>
    <form>
      <p>
        名前：<input type="text" v-model="category.name" size="40">
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
      category: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/categories/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.category = response.data)
        )
      );
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")){
        const id = this.$route.params["id"];
      let path = "http://localhost:3000/categories/" + id;
      let params = {
        name: this.category.name,
         
      };
      this.axios
      .put(path,params)
      }
      this.$router.push({ name: "categories" });
      location.reload();
    },
  }
};
</script>