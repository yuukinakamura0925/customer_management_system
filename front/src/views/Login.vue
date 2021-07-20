<template>
  <div class="home-hero__content">
    <v-container text-xs-center class=" login">
      <v-layout row wrap justify-center>
        <v-flex xs12 class="text-center">
          <h1>【C.M SYSTEM】</h1>
          <p>
            C.M SYSTEMをご利用の方は、Googleアカウントでログインしてください。
          </p>
          <v-btn color="info" @click="login">Googleアカウントでログイン</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  components: {},
  data() {
    return {
      customer_active: false,
      menu_active: false,
      bill_active: false
    };
  },
  methods: {
    ...mapActions(["login"]),

    customerActive: function() {
      this.customer_active = !this.customer_active;
    },
    menuActive: function() {
      this.menu_active = !this.menu_active;
    },
    billActive: function() {
      this.bill_active = !this.bill_active;
    }
  }
};
</script>
<style lang="scss" scoped>
.home-hero__content {
  background: url("../assets/Group 12.jpg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100vh;
  margin-top: -23.98px;
}
.login {
  color: aliceblue;
  margin-top: 200px;
}
</style>
