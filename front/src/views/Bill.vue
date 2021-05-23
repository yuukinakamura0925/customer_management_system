<template>
  <div>
    <h1>Bill page</h1>
    <table>
      <thead>
        <tr>
          <th >
            MenuList
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
          <td><button v-on:click="count++">{{ menu.name }}{{ count }}</button></td>
          <td>{{ menu.price }}</td>
        </tr>
      </tbody>
    </table>
    <form>
      <p>
        ご請求額：<input type="text" size="40">円
      </p>
      <p>
        お預かり：<input type="text" size="40">円
      </p>
      <p>
        <button type="button" @click="$router.push({ name: 'bill'})">支払いへ進む</button>
      </p>
    </form>
  </div>
</template>

<script lang="ts">
export default {
  
  components: {
  },
  data: function() {
    return {
      menus: null,
      count: 0,
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