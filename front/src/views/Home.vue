<template>
  <div>
    <v-container text-xs-center justify-center>
      <v-layout row wrap>
        <v-flex xs12>
          <h1>HOME</h1>
          <p>ボタンを選んでください</p>
        </v-flex>
      </v-layout>
    </v-container>

    <v-container fluid class="pa-0">
      <v-row align="center">
        <v-col cols="12" sm="12">
          <div class="text-center">
            <div class="my-2">
              <v-btn
                @click="customerActive"
                x-large
                outlined
                color="primary"
                width="250"
                dark
                >顧客管理</v-btn
              >
              <div class="my-2" v-if="customer_active">
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'customers_new' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >顧客登録</v-btn
                  >
                </div>
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'customers' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >顧客一覧</v-btn
                  >
                </div>
              </div>
              <div v-else></div>
            </div>
            <div class="my-2">
              <v-btn
                @click="menuActive"
                x-large
                outlined
                color="primary"
                width="250"
                dark
                >メニュー</v-btn
              >
              <div class="my-2" v-if="menu_active">
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'menus_new' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >メニュー登録</v-btn
                  >
                </div>
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'menus' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >メニュー一覧</v-btn
                  >
                </div>
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'categories_new' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >カテゴリー登録</v-btn
                  >
                </div>
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'categories' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >カテゴリー一覧</v-btn
                  >
                </div>
              </div>
              <div v-else></div>
            </div>
            <div class="my-2">
              <v-btn
                @click="billActive"
                x-large
                outlined
                color="primary"
                width="250"
                dark
                >会計</v-btn
              >
              <div class="my-2" v-if="bill_active">
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'new_bill' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >新規会計</v-btn
                  >
                </div>
                <div class="my-2">
                  <v-btn
                    @click="$router.push({ name: 'customers' })"
                    small
                    outlined
                    color="primary"
                    width="100"
                    >メンバー会計</v-btn
                  >
                </div>
              </div>
              <div v-else></div>
            </div>
            <div class="my-2">
              <v-btn
                @click="$router.push({ name: 'orders' })"
                x-large
                outlined
                color="primary"
                width="250"
                dark
                >会計済み伝票</v-btn
              >
            </div>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  components: {},
  data() {
    return {
      customer_active: false,
      menu_active: false,
      bill_active: false
    };
  },
  methods: {
    ...mapActions(["login"]),

    customerActive: function() {
      this.customer_active = !this.customer_active;
    },
    menuActive: function() {
      this.menu_active = !this.menu_active;
    },
    billActive: function() {
      this.bill_active = !this.bill_active;
    }
  }
};
</script>
