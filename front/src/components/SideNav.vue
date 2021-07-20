<template>
  <v-container fluid>
    <v-navigation-drawer v-model="$store.state.drawer" absolute temporary>
      <v-list>
        <v-list-item>
          <v-list-item-avatar>
            <img src="https://avatars2.githubusercontent.com/u/1363954?s=460&v=4">
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title>Kazuya Kojima</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list-item v-for="(item, index) in items" :key="index" :to="item.link">
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
export default {
  data () {
    return {
      items: [
        { title: "HOME", icon: "mdi-forum", link: {name: "home"} },
        { title: "顧客登録", icon: "mdi-forum", link: {name:"customers"} },
        { title: "メニュー登録", icon: "mdi-forum", link: {name:"menus"} },
        { title: "新規お会計", icon: "mdi-forum", link: {name:"new_bill"} },
        { title: "メンバー会計", icon: "mdi-forum", link: {name:"customers"} },
        { title: "カテゴリー登録", icon: "mdi-forum", link: {name:"categories"} },
        { title: "会計済み一覧", icon: "mdi-forum", link: {name:"orders"} }
      ]
    }
  }
}
</script>