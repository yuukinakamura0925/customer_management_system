<template>
  <div>
    <h1>HOME</h1>
    
    <v-container fluid class="pa-0">
    <v-row align="center">
      <v-col cols="12" sm="12">
        <div class="text-center">
          <div class="my-2">
            <v-btn @click="customerActive" x-large outlined color="primary" width="250" dark>顧客管理</v-btn>
              <div class="my-2" v-if="customer_active">
                <div class="my-2"><v-btn small outlined color="primary"  width="100">顧客登録</v-btn></div>
                <div class="my-2"><v-btn small outlined color="primary" width="100">顧客一覧</v-btn></div>
              </div>
              <div v-else></div>
          </div>
          <div class="my-2">
            <v-btn @click="menuActive" x-large outlined color="primary" width="250" dark>メニュー</v-btn>
              <div class="my-2" v-if=" menu_active">
                <div class="my-2"><v-btn small outlined color="primary" width="100">メニュー登録</v-btn></div>
                <div class="my-2"><v-btn small outlined color="primary" width="100">メニュー一覧</v-btn></div>
                <div class="my-2"><v-btn small outlined color="primary" width="100">カテゴリー登録</v-btn></div>
                <div class="my-2"><v-btn small outlined color="primary" width="100">カテゴリー一覧</v-btn></div>
              </div>
              <div v-else></div>
          </div>
          <div class="my-2">
            <v-btn @click="billActive" x-large outlined color="primary" width="250" dark>会計</v-btn>
              <div class="my-2" v-if="bill_active">
                <div class="my-2"><v-btn small outlined color="primary" width="100">新規会計</v-btn></div>
                <div class="my-2"><v-btn small outlined color="primary" width="100">メンバー会計</v-btn></div>
              </div>
              <div v-else></div>
          </div>
          <div class="my-2">
            <v-btn x-large outlined color="primary"  width="250" dark>会計済み伝票</v-btn>
          </div>
        </div>
      </v-col>
      
    </v-row>
  </v-container>
    
  </div>
</template>

<script lang="ts">
export default {
  components: {
  },
  data() {
    return {
       customer_active: false,
       menu_active: false,
       bill_active: false
    }
  },
  methods: {
    customerActive: function () {
      this.customer_active = !this.customer_active;
    },
    menuActive: function () {
      this.menu_active = !this.menu_active;
    },
    billActive: function () {
      this.bill_active = !this.bill_active;
    },
    
  }
};
</script> 