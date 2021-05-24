<template>
  <div>
    <h1>New menu form </h1>
    <form>
      <p>
        名前：<input type="text" v-model="name" size="40">
      </p>
      <p>
        価格：<input type="text" v-model="price" size="40">
      </p>
      <p>
        <select v-model="category_id">
            <option disabled value="">選択して下さい</option>
            <option v-for="category in categories" v-bind:value="category.id" v-bind:key="category.id">
                {{ category.name }}
            </option>
        </select>
      </p>
      <p>
      <input type="submit" value="登録" @click="create">
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
      name: "",
      price: "",
      category_id: "",
      categories: null
    }
  },
  created() {
    let path = "http://localhost:3000/categories" ;
    this.axios
      .get(path)
      .then(
        response => (
          (this.categories = response.data)
        ),
      );
  },
  methods: {
    create() {
      if (confirm("メニューに登録しますか？")) {
        let path = "http://localhost:3000/menus"
        let params = {
          name: this.name,
          price: this.price,
          category_id: this.category_id
        };
        this.axios
        .post(path, params) 
      }
      alert(this.category_id)
      this.$router.push({ name: "menus" });
      location.reload();
    },
    
  }
};
</script>