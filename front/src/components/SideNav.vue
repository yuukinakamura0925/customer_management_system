<template>
  <v-sheet>
    <v-navigation-drawer >
      <v-list-item>
        <v-list-item-avatar>
          <img v-if="photoURL" :src="photoURL" />
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title>test</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item v-for="item in items" :key="item.title" link>
          <v-list-item-icon>
            <router-link :to="{ name: item.link }">
              <v-icon>{{ item.icon }}</v-icon>
            </router-link>
          </v-list-item-icon>

          <v-list-item-content>
            <router-link :to="{ name: item.link }">
              <v-list-item-title>
                {{ item.title }}
              </v-list-item-title>
            </router-link>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-sheet>
</template>

<script lang="ts">
// import { mapGetters } from "vuex";

export default {
  name: "SideNav",

  data() {
    return {
      drawer: null,
      items: [
        { title: "顧客登録", icon: "mdi-forum", link: "customers" },
        { title: "メニュー登録", icon: "mdi-forum", link: "menus" },
        { title: "新規お会計", icon: "mdi-forum", link: "new_bill" },
        { title: "メンバー会計", icon: "mdi-forum", link: "customers" },
        { title: "カテゴリー登録", icon: "mdi-forum", link: "categories" },
        { title: "会計済み一覧", icon: "mdi-forum", link: "orders" }
      ]
    };
  },
  computed: {
    // ...mapGetters(["userName", "photoURL"])
  }
};
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
</style>
