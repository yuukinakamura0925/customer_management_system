<template>
  <div id="app">
    <v-app>
      <Header/>
      <SideNav/>  
      <router-view/>
      <Footer/>
    </v-app>
  </div>
</template>

<script lang="js">
import Vue from "vue";
import SideNav from "./components/SideNav";
import Footer from "./components/Footer";
import Header from "./components/Header";

export default Vue.extend({
  name: "App",
  components: {
    SideNav,
    Footer,
    Header
  },
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
</style>
