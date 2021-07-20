<template>
  <div>
    <h1>Menu info</h1>
    <form>
      <p>
        名前：{{ menu.name }}
      </p>
      <p>
        価格：{{ menu.price }}
        
      </p>
     
      <p>
        <v-btn
          @click="$router.push({ name: 'menus'})"
        >
          一覧ページに戻る
        </v-btn>
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
  // methods: {
  //   create() {
  //     let path = "http://localhost:3000/menus"
  //     this.axios
  //     .post(path,params)
  //   },
  //   delete() {
  //     const id = this.$route.params["id"];
  //     let path = "http://localhost:3000/menus/" + id;
  //     this.axios
  //     .delete(path)
  //   },
    
  // }
};
</script>