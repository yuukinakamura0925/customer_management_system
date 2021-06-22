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
          (this.cart_id = response.data.data), // TODO customerに修正  
          alert(this.cart_id),
          console.log(this.cart_id),
          this.$router.push(
            { 
              name: "bill",
              params: {cart_id: this.cart_id}
            }
          )
              
            
        )
      )
  
  },
  methods: {
  }
};
</script>