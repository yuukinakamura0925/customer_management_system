<template>
  <div>
    <h1>Menu edit</h1>
    <form>
      <p>
        名前：<input type="text" v-model="menu.name" size="40">
      </p>
      <p>
        価格：<input type="text" v-model="menu.price" size="40">
      </p>
       <p>
        カテゴリー：<input type="text" v-model="menu.category_id" size="40">
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
      menu: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/menus/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.menu = response.data)
        )
      );
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")){
        const id = this.$route.params["id"];
      let path = "http://localhost:3000/menus/" + id;
      let params = {
        name: this.menu.name,
        price: this.menu.price,
      };
      this.axios
      .put(path,params)
      }
      this.$router.push({ name: "menus" });
      location.reload();
    },
  }
};
</script>