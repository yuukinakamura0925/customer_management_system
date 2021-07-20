<template>
  <div id="app">
    <v-app>
      <Header/>
      <SideNav/>
      <router-view/>
      
      <v-container>
        <div v-if="this.$router.currentRoute.name === 'home'">
        </div>
        <div v-else-if="this.$router.currentRoute.name === 'login'">
        </div>
        <div v-else>
          <v-btn class="mt-16" color="primary lighten-1" @click="$router.push({ name: 'home'})">HOMEに戻る</v-btn>
        </div>
      </v-container>
      
      <!-- <Footer/> -->
    </v-app>
  </div>
</template>

<script lang="js">
import firebase from 'firebase'
import Vue from "vue";
import { mapActions } from 'vuex'
// import Footer from "./components/Footer";
import Header from "./components/Header";
import SideNav from "./components/SideNav";
export default Vue.extend({
  name: "App",
  components: {
    // Footer,
    Header,
    SideNav
  },
  data(){
    return {
    }
  },
  created () {
    firebase.auth().onAuthStateChanged(user => {
      if (user) {
        this.setLoginUser(user)
        if (this.$router.currentRoute.name === 'login') {
        this.$router.push({ name: 'home' }, () => {})
        }
      } else {
        this.deleteLoginUser()
        this.$router.push({ name: 'login' }, () => {})
      }
    })
    
  },
  methods: {
    ...mapActions(['setLoginUser', 'logout', 'deleteLoginUser'])
  }
});
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.serch_box {
  width: 400px !important;
  margin:0 auto;
}
</style>

