<template>
  <div>
    <v-container text-xs-center>
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>顧客編集</h1>
        </v-flex>

        <v-flex sm3 mt-5>
          <v-card>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="customer.name"
                  :counter="20"
                  label="顧客名"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="customer.age"
                  :counter="20"
                  label="年齢"
                ></v-text-field>
                <v-text-field
                  v-model="customer.sex"
                  :counter="20"
                  label="性別"
                ></v-text-field>
                <v-text-field
                  v-model="customer.memo"
                  :counter="20"
                  label="メモ"
                  height="150"
                ></v-text-field>
                <div class="text-center">
                  <v-btn @click="$router.push({ name: 'customers' })"
                    >キャンセル</v-btn
                  >
                  <v-btn color="info" class="ml-2" @click="update">編集</v-btn>
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
      customer: null
    };
  },
  created() {
    let baseURL =
      process.env.NODE_ENV === "production"
        ? "http://backend.customer-management-system.link"
        : "http://localhost:3000";
    const id = this.$route.params["id"];
    let path = baseURL + "/customers/" + id;
    this.axios.get(path).then(response => (this.customer = response.data));
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")) {
        let baseURL =
          process.env.NODE_ENV === "production"
            ? "http://backend.customer-management-system.link"
            : "http://localhost:3000";
        const id = this.$route.params["id"];
        let path = baseURL + "/customers/" + id;
        let params = {
          name: this.customer.name,
          age: this.customer.age,
          sex: this.customer.sex,
          memo: this.customer.memo
        };
        this.axios.put(path, params);
      }
      this.$router.push({ name: "customers" });
      location.reload();
    }
  }
};
</script>
