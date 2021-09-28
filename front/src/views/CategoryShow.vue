<template>
  <div>
    <h1>category info</h1>
    <form>
      <p>名前：{{ category.name }}</p>
      <p>
        <input
          type="submit"
          value="編集"
          @click="
            $router.push({
              name: 'categories_edit',
              params: { id: category.id }
            })
          "
        />
        <input type="submit" value="登録" @click="create" />
      </p>
      <input
        type="submit"
        value="一覧ページに戻る"
        @click="$router.push({ name: 'categories' })"
      />
      <p></p>
    </form>
  </div>
</template>

<script lang="ts">
export default {
  components: {},
  data() {
    return {
      category: null
    };
  },
  created() {
    let baseURL = process.env.NODE_ENV === "production" ? "http://customer-management-system.link" : "http://localhost:3000";
    const id = this.$route.params["id"];
    let path = baseURL + "/categories/" + id;
    this.axios.get(path).then(response => (this.category = response.data));
  }
};
</script>
