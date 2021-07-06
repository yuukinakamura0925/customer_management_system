<template>
  <div>
    <h1>顧客情報</h1>
    <div class="my-16">
      <v-simple-table class="table_form">
      <thead>
        <tr>
          <th >
            氏名
          </th>
          <th >
            年齢
          </th>
          <th >
            性別
          </th>
          <th >
            特記事項
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="text-left">{{ customer.name }}</td>
          <td class="text-left">{{ customer.age }}</td>
          <td class="text-left">{{ customer.sex }}</td>
          <td class="text-left">{{ customer.memo }}</td>
        </tr>

      </tbody>
    </v-simple-table>
      <p class="my-16">
        <v-btn
          @click="$router.push({ name: 'customers'})"
        >
          一覧ページに戻る
        </v-btn> 
      </p>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
      customer: null
    }
  },
  created() {
    const id = this.$route.params["id"];
    let path = "http://localhost:3000/customers/" + id;
    this.axios
      .get(path)
      .then(
        response => (
          (this.customer = response.data)
        )
      );
  },
 
};
</script>