<template>
  <div id="app">
    <router-link to="/customers">お客様一覧</router-link><br>
    <router-link to="/menus">メニュー一覧ページへ</router-link><br>
    <router-link to="/orders">オーダー一覧ページへ</router-link><br> 
    <router-link to="/categories">カテゴリー一覧ページへ</router-link><br>
    <router-link to="/bill">お会計ページへ</router-link>
    
    <router-view />
  </div>
</template>

<script lang="js">
import Vue from "vue";

export default Vue.extend({
  name: "App",
  components: {
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
