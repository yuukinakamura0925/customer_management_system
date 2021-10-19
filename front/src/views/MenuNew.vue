<template>
  <div>
    <v-container text-xs-center>
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>New menu form</h1>
        </v-flex>
        <v-flex sm3 mt-5>
          <v-card>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="name"
                  :counter="20"
                  :rules="[v => !!v || 'メニュー名を入力してください']"
                  label="メニュー名"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="price"
                  :counter="10"
                  :rules="[v => !!v || '値段を入力してください']"
                  label="値段"
                  required
                ></v-text-field>
                <p>
                  <select v-model="category_id">
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
                  <v-btn color="info" class="ml-2" @click="create">保存</v-btn>
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
      name: "",
      price: "",
      category_id: "",
      categories: null
    };
  },
  computed: {
    // TODO v-select
    // categoryNames: function() {
    //   var category_names = [];
    //   for(var i in this.categories) {
    //       var category = this.categories[i];
    //       category_names.push(category.name);
    //   }
    //     return category_names
    // }
  },
  created() {
    let baseURL =
      process.env.NODE_ENV === "production"
        ? "https://backend.customer-management-system.link"
        : "http://localhost:3000";
    let path = baseURL + "/categories";
    this.axios.get(path).then(response => (this.categories = response.data));
  },
  methods: {
    create() {
      if (confirm("メニューに登録しますか？")) {
        let baseURL =
          process.env.NODE_ENV === "production"
            ? "https://backend.customer-management-system.link"
            : "http://localhost:3000";
        let path = baseURL + "/menus";
        let params = {
          name: this.name,
          price: this.price,
          category_id: this.category_id
        };
        this.axios.post(path, params);
      }
      this.$router.push({ name: "menus" });
      location.reload();
    }
  }
};
</script>
