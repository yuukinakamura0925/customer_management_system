<template>
  <div>
    <h1>Menu list</h1>
    <button type="button" @click="$router.push({ name: 'menus_new'})">新規メニュー登録</button>
    <table>
      <thead>
        <tr>
          <th >
            Name
          </th>
          <th >
            price
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
          <td><button type="button" @click="$router.push({ name: 'menu', params: { id: menu.id } })">詳細</button></td>
          <td><button type="button" @click="$router.push({ name: 'menus_edit', params: { id: menu.id } })">編集</button></td>
          <td><button type="button" @click="deleteRecord(menu.id)">削除</button></td>
        </tr>
  
      </tbody>
    </table>
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