<template>
  <div>LOADING</div>
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
    let baseURL = process.env.NODE_ENV === "production" ? "http://backend.customer-management-system.link" : "http://localhost:3000"
    let path = baseURL + "/customers"
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
