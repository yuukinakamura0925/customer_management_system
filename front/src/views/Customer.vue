<template>
  <div>
    test
    {{ res.id }}
    {{ res }}

  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      res: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/customers/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.res = response.data)
        )
      );
  },
  // methods: {
  //   create() {
  //     let path = "http://localhost:3000/customers"
  //     this.axios
  //     .post(path,params)
  //   },
  //   delete() {
  //     const id = this.$route.params["id"];
  //     let path = "http://localhost:3000/customers/" + id;
  //     this.axios
  //     .delete(path)
  //   },
    
  // }
};
</script>