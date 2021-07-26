<template>
  <div>
    <h1>メニュー 一覧</h1>
    <div>
      <v-btn class="mt-16" @click="$router.push({ name: 'menus_new' })"
        >新規メニュー登録</v-btn
      >
    </div>
    <div class="my-16">
      <v-simple-table class="table_form">
        <thead>
          <tr>
            <th>
              メニュー名
            </th>
            <th>
              値段
            </th>
            <th>
              カテゴリー
            </th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="menu in menus" :key="menu.id">
            <td class="text-left">{{ menu.name }}</td>
            <td class="text-left">{{ menu.price }}</td>
            <!-- TODO カテゴリー名で表示する -->
            <td class="text-left">{{ menu.category_id }}</td>
            <td class="text-right">
              <v-btn
                @click="
                  $router.push({ name: 'menus_edit', params: { id: menu.id } })
                "
              >
                <v-icon>
                  mdi-pencil
                </v-icon>
              </v-btn>
              <v-btn @click="deleteRecord(menu.id)">
                <v-icon>
                  mdi-delete
                </v-icon>
              </v-btn>
            </td>
          </tr>
        </tbody>
      </v-simple-table>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {},
  data() {
    return {
      menus: null,
      categories: null
    };
  },
  created() {
    let path = "http://localhost:3000/menus";
    this.axios.get(path).then(response => (this.menus = response.data));

    path = "http://localhost:3000/categories";
    this.axios.get(path).then(response => (this.categories = response.data));
  },
  updated() {
    // TODO 更新しないと変わらない
    // category.nameを表示させる処理
    let menus = this.menus;
    let categories = this.categories;

    for (let i = 0; i < menus.length; i++) {
      for (let k = 0; k < categories.length; k++) {
        if (menus[i].category_id == categories[k].id) {
          // categorie_idにcategorie.nameを格納
          menus[i].category_id = categories[k].name;
        }
      }
    }
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")) {
        let path = "http://localhost:3000/menus/" + id;
        this.axios.delete(path);
        location.reload();
      }
    }
  }
};
</script>
