<template>
  <div>
    <h1>New menu form </h1>
  <v-form v-model="valid">
    <v-container>
      <v-text-field
        v-model="name"
        :counter="10"
        :rules="[v => !!v || 'メニュー名を入力してください']"
        label="menu name"
        required
      ></v-text-field>
      <v-text-field
        v-model="price"
        :counter="10"
        :rules="[v => !!v || '値段を入力してください']"
        label="Price"
        required
      ></v-text-field>

    </v-container>
  </v-form>
    <form>
      <p>
        <select v-model="category_id">
            <option disabled value="">カテゴリーを選択して下さい</option>
            <option v-for="category in categories" v-bind:value="category.id" v-bind:key="category.id">
                {{ category.name }}
            </option>
        </select>
      </p>
      <p>
        <v-btn  @click="create">登録</v-btn>
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
      categories: null,
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