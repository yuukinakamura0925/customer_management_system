<template>
  <div>
    <v-container text-xs-center>
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>カテゴリー新規登録</h1>
        </v-flex>
        <v-flex sm3 mt-5>
          <v-card>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="name"
                  :counter="20"
                  :rules="[v => !!v || 'カテゴリー名を入力してください']"
                  label="カテゴリー名"
                  required
                ></v-text-field>
                <div class="text-center">
                  <v-btn @click="$router.push({ name: 'categories' })"
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
      name: ""
    };
  },
  methods: {
    create() {
      let baseURL =
        process.env.NODE_ENV === "production"
          ? "https://backend.customer-management-system.link"
          : "http://localhost:3000";
      let path = baseURL + "/categories";
      let params = {
        name: this.name
      };
      this.axios.post(path, params);
      this.$router.push({ name: "categories" });
      location.reload();
    }
  }
};
</script>
