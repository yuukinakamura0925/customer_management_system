<template>
  <v-container fluid>
    <v-navigation-drawer v-model="$store.state.drawer" absolute temporary>
      <v-list>
        <v-list-item>
          <v-list-item-avatar>
            <img v-if="photoURL" :src="photoURL" />
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>{{ userName }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list-item
          v-for="(item, index) in items"
          :key="index"
          :to="item.link"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </v-container>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      items: [
        { title: "HOME", icon: "mdi-home", link: { name: "home" } },
        {
          title: "顧客一覧",
          icon: "mdi-account-details",
          link: { name: "customers" }
        },
        {
          title: "メニュー一覧",
          icon: "mdi-food-variant",
          link: { name: "menus" }
        },
        {
          title: "新規お会計",
          icon: "mdi-alarm-panel",
          link: { name: "new_bill" }
        },
        {
          title: "メンバー会計",
          icon: "mdi-account-cash",
          link: { name: "customers" }
        },
        {
          title: "カテゴリー一覧",
          icon: "mdi-forum",
          link: { name: "categories" }
        },
        {
          title: "会計済み一覧",
          icon: "mdi-order-bool-ascending",
          link: { name: "orders" }
        }
      ]
    };
  },
  computed: {
    ...mapGetters(["userName", "photoURL"])
  }
};
</script>
