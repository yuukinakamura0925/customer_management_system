<template>
  <div>
    <h1>Category edit</h1>
    <v-form>
      <v-container>
        <p>
          <v-text-field
            v-model="category.name"
            :counter="10"
            :rules="[v => !!v || 'カテゴリー名を入力してください']"
            label="カテゴリー名を編集できます"
            required
          ></v-text-field>
        </p>
      </v-container>

      <p>
        <v-btn @click="update">編集</v-btn>
      </p>
      <p>
        <v-btn @click="$router.push({ name: 'categories' })">
          一覧ページに戻る
        </v-btn>
      </p>
    </v-form>
  </div>
</template>

<script lang="ts">
export default {
  components: {},
  data() {
    return {
      category: null
    };
  },
  created() {
    const id = this.$route.params["id"];
    let baseURL =
      process.env.NODE_ENV === "production"
        ? "https://backend.customer-management-system.link"
        : "http://localhost:3000";
    let path = baseURL + "/categories/" + id;
    this.axios.get(path).then(response => (this.category = response.data));
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")) {
        let baseURL =
          process.env.NODE_ENV === "production"
            ? "https://backend.customer-management-system.link"
            : "http://localhost:3000";
        const id = this.$route.params["id"];
        let path = baseURL + "/categories/" + id;
        let params = {
          name: this.category.name
        };
        this.axios.put(path, params);
      }
      this.$router.push({ name: "categories" });
      location.reload();
    }
  }
};
</script>
