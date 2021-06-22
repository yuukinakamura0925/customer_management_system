<template>
  <div>
    <h1>Category list</h1>
    <v-btn @click="$router.push({ name: 'categories_new'})">カテゴリー登録</v-btn>
    <div>
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
            <td><v-btn  @click="$router.push({ name: 'category', params: { id: category.id } })">詳細</v-btn></td>
            <td><v-btn  @click="$router.push({ name: 'categories_edit', params: { id: category.id } })">編集</v-btn></td>
            <td><v-btn  @click="deleteRecord(category.id)">削除</v-btn></td>
          </tr>
    
        </tbody>
      </table>
    </div>
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