<template>
  <div>
    <v-container text-xs-center>
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>メニュー編集</h1>
        </v-flex>
        <v-flex sm3 mt-5>
          <v-card>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="menu.name"
                  :counter="20"
                  label="メニュー名"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="menu.price"
                  :counter="10"
                  label="値段"
                  required
                ></v-text-field>
                <p>
                  <select v-model="menu.category_id">
                    <option disabled value=""
                      >カテゴリーを選択して下さい</option
                    >
                    <option
                      v-for="category in categories"
                      v-bind:value="category.id"
                      v-bind:key="category.id"
                    >
                      {{ category.name }}
                    </option>
                  </select>
                  <!-- <v-select
                    :items="categoryNames"
                    label="Standard"
                   ></v-select> -->
                </p>
                <div class="text-center">
                  <v-btn @click="$router.push({ name: 'menus' })"
                    >キャンセル</v-btn
                  >
                  <v-btn color="info" class="ml-2" @click="update">保存</v-btn>
                </div>
              </v-form>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script lang="ts">
export default {
  components: {},
  data() {
    return {
      menu: null,
      categories: null
    };
  },
  created() {
    let baseURL = process.env.NODE_ENV === "production" ? "http://customer-management-system.link" : "http://localhost:3000";
    const id = this.$route.params["id"];
    let path = baseURL + "/menus/" + id;
    this.axios.get(path).then(response => (this.menu = response.data));

    path = baseURL + "/categories";
    this.axios.get(path).then(response => (this.categories = response.data));
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")) {
        let baseURL = process.env.NODE_ENV === "production" ? "http://customer-management-system.link" : "http://localhost:3000";
        const id = this.$route.params["id"];
        let path = baseURL + "/menus/" + id;
        let params = {
          name: this.menu.name,
          price: this.menu.price,
          category_id: this.menu.category_id
        };
        this.axios.put(path, params);
      }
      this.$router.push({ name: "menus" });
      location.reload();
    }
  }
};
</script>
