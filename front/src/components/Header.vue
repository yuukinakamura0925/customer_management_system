<template>
  <div>
    <!-- サイドメニュー -->
    <v-navigation-drawer app clipped v-model="drawer" dark color="indigo lighten-5" height= auto>
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
              <v-list-item-title @click.stop="drawer=!drawer">
                {{ item.title }}
              </v-list-item-title>
            </router-link>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <!-- ヘッダー -->
    <v-app-bar app clippedLeft flat dark  color="primary lighten-1" >
      <v-app-bar-nav-icon @click.stop="drawer=!drawer"></v-app-bar-nav-icon>
      <div class="d-flex align-center">
      {{ title }}
      </div>
    </v-app-bar>

    <!-- メイン -->
    <v-main>
      <v-container fluid>
      </v-container>
    </v-main>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        title: "CUSTOMER MANAGEMENT SYSTEM",
        drawer: false,
        items: [
        { title: "顧客登録", icon: "mdi-forum", link: "customers" },
        { title: "メニュー登録", icon: "mdi-forum", link: "menus" },
        { title: "新規お会計", icon: "mdi-forum", link: "new_bill" },
        { title: "メンバー会計", icon: "mdi-forum", link: "customers" },
        { title: "カテゴリー登録", icon: "mdi-forum", link: "categories" },
        { title: "会計済み一覧", icon: "mdi-forum", link: "orders" }
      ]
      }
    }
  }
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
</style>