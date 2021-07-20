<template>
  <div>
    <div>
      <h1>メニュー情報</h1>
      <div class="my-16">
        <v-simple-table class="table_form">
          <thead>
            <tr>
              <th >
                メニュー名
              </th>
              <th >
                価格
              </th>
              <th >
                カテゴリー
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-left">{{ menu.name }}</td>
              <td class="text-left">{{ menu.price }}</td>
              <td class="text-left">{{ menu.category_id }}</td>
            </tr>

          </tbody>
        </v-simple-table>
        <p class="my-16">
          <v-btn
            @click="$router.push({ name: 'menus'})"
          >
            一覧ページに戻る
          </v-btn> 
        </p>
      </div>
    </div>  
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      menu: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/menus/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.menu = response.data)
        )
      );
    
  },
  // methods: {
  //   create() {
  //     let path = "http://localhost:3000/menus"
  //     this.axios
  //     .post(path,params)
  //   },
  //   delete() {
  //     const id = this.$route.params["id"];
  //     let path = "http://localhost:3000/menus/" + id;
  //     this.axios
  //     .delete(path)
  //   },
    
  // }
};
</script>