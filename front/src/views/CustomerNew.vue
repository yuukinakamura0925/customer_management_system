<template>
  <div>
    <h1>New customer form </h1>
    <form>
      <p>
        名前：<input type="text" v-model="name" size="40">
      </p>
      <p>
        年齢：<input type="text" v-model="age" size="40">
      </p>
      <p>
        性別：<input type="text" v-model="sex" size="40">
      </p>
      <p>
        メモ：<input type="text" v-model="memo" size="40">
      </p>
      <p>
      <input type="submit" value="登録" @click="create">
      </p>
    </form>  
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
      memo: ""
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
    },
  }
};
</script>