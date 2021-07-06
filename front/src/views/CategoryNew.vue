<template>
  <div>
    <h1>New category form </h1>
    <v-form>
      <v-container>
        <p>
          <v-text-field
            v-model="name"
            :counter="10"
            :rules="[v => !!v || 'カテゴリー名を入力してください']"
            label="カテゴリー名を登録できます"
            required
          ></v-text-field>
        </p>
        
      </v-container>
     
      <p>
        <v-btn  @click="create">登録</v-btn>
      </p>
      <p>
        <v-btn
          @click="$router.push({ name: 'categories'})"
        >
          一覧ページに戻る
        </v-btn>
      </p>
    </v-form> 
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      name: "",
    }
  },
  methods: {
    create() {
      let path = "http://localhost:3000/categories"
      let params = {
        name: this.name,
      };
      alert(params.name)
      this.axios
        .post(path, params)
      this.$router.push(
        { name: "categories"}
      )
      location.reload();
    },
  }
};
</script>