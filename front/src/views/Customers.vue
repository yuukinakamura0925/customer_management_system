<template>
  <div>
    test
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
    let path = "http://localhost:3000/customers";
    this.axios
      .get(path)
      .then(
        response => (
          (this.res = response.data)
        )
      );
  }
};
</script>