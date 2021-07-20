<template>
  <div>
    <h1>顧客編集ページ</h1>
    <v-form>
      <v-container>
        <p>
          <v-text-field
            v-model="customer.name"
            :counter="20"
            :rules="[v => !!v || 'メニュー名を入力してください']"
            label="名前を編集できます"
            required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
            v-model="customer.age"
            :counter="10"
            :rules="[v => !!v || 'メニュー名を入力してください']"
            label="年齢を編集できます"
            required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
            v-model="customer.sex"
            :counter="10"
            :rules="[v => !!v || 'メニュー名を入力してください']"
            label="性別を編集できます"
            required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
            v-model="customer.memo"
            :counter="10"
            label="メモを編集できます"
            required
          ></v-text-field>
        <p>
          <v-btn  @click="update">編集</v-btn>
        </p>
        <p>
          <v-btn
           @click="$router.push({ name: 'customers'})"
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
      customer: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/customers/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.customer = response.data)
        )
      );
  },
  methods: {
    update() {
      if (confirm("編集してもよろしいでしょうか？")){
        const id = this.$route.params["id"];
      let path = "http://localhost:3000/customers/" + id;
      let params = {
        name: this.customer.name,
        age: this.customer.age,
        sex: this.customer.sex,
        memo: this.customer.memo 
      };
      this.axios
      .put(path,params)
      }
      this.$router.push({ name: "customers" });
      location.reload();
    },
  }
};
</script>