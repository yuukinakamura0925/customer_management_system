<template>
  <div>
    <h1>メニュー  一覧</h1>
    <div>
      <v-btn  @click="$router.push({ name: 'menus_new'})">新規メニュー登録</v-btn>
    </div>
    <div  class="my-16">
      <v-table>
        <thead>
          <tr>
            <th >
              メニュー名
            </th>
            <th >
              値段
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="menu in menus"
            :key="menu.id"
          >
            <td>{{ menu.name }}</td>
            <td>{{ menu.price }}</td>
            <td><v-btn  @click="$router.push({ name: 'menu', params: { id: menu.id } })">詳細</v-btn></td>
            <td><v-btn  @click="$router.push({ name: 'menus_edit', params: { id: menu.id } })">編集</v-btn></td>
            <td><v-btn  @click="deleteRecord(menu.id)">削除</v-btn></td>
          </tr>
    
        </tbody>
      </v-table>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      menus: null
    }
  },
  created() {
    let path = "http://localhost:3000/menus";
    this.axios
      .get(path)
      .then(
        response => (
          (this.menus = response.data)
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")){
        let path = "http://localhost:3000/menus/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
  }
};
</script>