<template>
  <div>
    <h1>New customer form </h1>
    <v-form>
      <v-container>
        <p>
          <v-text-field
              v-model="name"
              :counter="20"
              :rules="[v => !!v || 'メニュー名を入力してください']"
              label="顧客名を入力"
              required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
              v-model="age"
              :counter="10"
              :rules="[v => !!v || '年齢を入力してください']"
              label="年齢を入力"
              required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
              v-model="sex"
              :counter="10"
              :rules="[v => !!v || '性別入力してください']"
              label="性別を入力"
              required
          ></v-text-field>
        </p>
        <p>
          <v-text-field
              v-model="memo"
              :counter="30"
              label="メモを入力"
              required
          ></v-text-field>
        </p>
        <p>
          <v-btn  @click="create">登録</v-btn>
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
      name: "",
      age: "",
      sex: "",
      memo: "",
      customer_id: 0
    }
  },
  methods: {  
    create() {
      let path = "http://localhost:3000/customers"
      let params = {
        name: this.name,
        age: this.age,
        sex: this.sex,
        memo: this.memo 
      };
      alert(params.name)
      this.axios
        .post(path, params)
      this.$router.push(
        {  name: "customers"}
      )
      location.reload();
    },
  }
};
</script>