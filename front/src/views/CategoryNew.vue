<template>
  <div>
    <h1>New category form </h1>
    <form>
      <p>
        名前：<input type="text" v-model="name" size="40">
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
    }
  },
  methods: {
    create() {
      let path = "http://localhost:3000/customercategories"
      let params = {
        name: this.name,
      };
      alert(params.name)
      this.axios
      .post(path, params)
    },
  }
};
</script>