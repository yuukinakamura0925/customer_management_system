<template>
  <div>
    <v-container text-xs-center>
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>顧客登録</h1>
        </v-flex>

        <v-flex sm3 mt-5>
          <v-card>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="name"
                  :counter="20"
                  :rules="[v => !!v || '顧客名を入力してください']"
                  label="顧客名"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="age"
                  :counter="20"
                  label="年齢"
                ></v-text-field>
                <v-text-field
                  v-model="sex"
                  :counter="20"
                  label="性別"
                ></v-text-field>
                <v-text-field
                  v-model="memo"
                  :counter="20"
                  label="メモ"
                  height="150"
                ></v-text-field>
                <div class="text-center">
                  <v-btn @click="$router.push({ name: 'customers' })"
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
      age: "",
      sex: "",
      memo: "",
      customer_id: 0
    };
  },
  methods: {
    create() {
      let baseURL = process.env.NODE_ENV === "production" ? "http://customer-management-system.link" : "http://localhost:3000";
      let path = baseURL + "/customers";
      let params = {
        name: this.name,
        age: this.age,
        sex: this.sex,
        memo: this.memo
      };
      this.axios.post(path, params);
      this.$router.push({ name: "customers" });
      location.reload();
    }
  }
};
</script>
