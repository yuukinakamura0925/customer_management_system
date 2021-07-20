<template>
  <v-app-bar app clippedLeft flat dark color="primary lighten-1">
    <v-app-bar-nav-icon
      v-show="$store.state.login_user"
      @click="toggleSideMenu"
    ></v-app-bar-nav-icon>
    <v-toolbar-title
      ><v-btn text @click="$router.push({ name: 'home' })"
        >CUSTOMER MANAGEMENT SYSTEM</v-btn
      ></v-toolbar-title
    >
    <v-spacer></v-spacer>
    <v-toolbar-items v-if="$store.state.login_user">
      <v-btn text @click="logout">ログアウト</v-btn>
    </v-toolbar-items>
  </v-app-bar>
</template>
<script>
import { mapActions } from "vuex";
export default {
  data() {
    return {};
  },
  methods: {
    ...mapActions(["toggleSideMenu", "logout", "deleteLoginUser"])
  }
};
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
</style>
