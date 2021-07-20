<template>
  <div>
    <h1>カテゴリーリスト</h1>
    <v-btn class="mt-16" @click="$router.push({ name: 'categories_new'})">カテゴリー登録</v-btn>
    <div  class="my-16">
      <v-simple-table class="table_form">
        <thead>
          <tr>
            <th >
              カテゴリー名
            </th>
            <th>
              
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="category in categories"
            :key="category.id"
          >
            <td class="text-left">{{ category.name }}</td>
            <td class="text-right">
              <v-btn  @click="$router.push({ name: 'category', params: { id: category.id } })">詳細</v-btn>
              <v-btn  @click="$router.push({ name: 'categories_edit', params: { id: category.id } })">編集</v-btn>
              <v-btn  @click="deleteRecord(category.id)"  color="white--text red darken-2">削除</v-btn>
            </td>
          </tr>
    
        </tbody>
      </v-simple-table>
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