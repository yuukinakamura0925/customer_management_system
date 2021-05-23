<template>
  <div>
    <h1>Category list</h1>
    <button type="button" @click="$router.push({ name: 'categories_new'})">カテゴリー登録</button>
    <table>
      <thead>
        <tr>
          <th >
            Category Name
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="category in categories"
          :key="category.id"
        >
          <td>{{ category.name }}</td>
          <td><button type="button" @click="$router.push({ name: 'category', params: { id: category.id } })">詳細</button></td>
          <td><button type="button" @click="$router.push({ name: 'categories_edit', params: { id: category.id } })">編集</button></td>
          <td><button type="button" @click="deleteRecord(category.id)">削除</button></td>
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
      categories: null
    }
  },
  created() {
    let path = "http://localhost:3000/categories";
    this.axios
      .get(path)
      .then(
        response => (
          (this.categories = response.data)
        )
      );
  },
  methods: {
    deleteRecord(id) {
      if (confirm("削除してもよろしいでしょうか？")){
        let path = "http://localhost:3000/categories/" + id;
        this.axios
        .delete(path)
        location.reload();
      }
    },
  }
};
</script>