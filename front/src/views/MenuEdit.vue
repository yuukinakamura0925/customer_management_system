<template>
  <div>
    <h1>Menu edit</h1>
    <v-form>
      <v-container>
        <p>
          <v-text-field
              v-model="menu.name"
              :counter="10"
              :rules="[v => !!v || 'メニュー名を入力してください']"
              label="メニュー名を編集できます"
              required
            ></v-text-field>
        </p>
        <p>
          <v-text-field
              v-model="menu.price"
              :counter="10"
              :rules="[v => !!v || '値段を入力してください']"
              label="値段を編集できます"
              required
          ></v-text-field>
        </p>
        <p>
          <!-- TODO カテゴリーの編集方法 -->
          <!-- <v-text-field
              v-model="menu.price"
              :counter="10"
              :rules="[v => !!v || '値段を入力してください']"
              label="値段を編集できます"
              required
          ></v-text-field>
          カテゴリー：<input type="text" v-model="menu.category_id" size="40"> -->
        </p>
        <p>
        <v-btn  @click="update">登録</v-btn>
        </p>
        <p>
          <v-btn
            @click="$router.push({ name: 'menus'})"
          >
            一覧ページに戻る
          </v-btn>
        </p>
      </v-container>
    </v-form>  
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