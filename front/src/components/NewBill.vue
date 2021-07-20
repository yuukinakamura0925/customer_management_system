<template>
  <div>aa</div>
</template>

<script lang="js">

export default {
  components: {
  },
  data() {
    return {
      // customer: null,
      cart_id: 0,
      customer_id: 0
    }
  },

  created() {
    let path = "http://localhost:3000/customers"
    let params = {
      name: "",
      age: 0,
      sex: "",
      memo: ""
    };

    this.axios
      .post(path, params)
      .then(
        response => (
          (this.customer = response.data.data), // TODO customerに修正
          this.$router.push(
            {
              name: "bill",
              params: {customer_id: this.customer.id}
            }
          )
        )
      )

  },
  methods: {
  }
};
</script>
