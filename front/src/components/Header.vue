<template>
  <v-app-bar 
    app 
    clippedLeft 
    flat 
    dark  
    color="primary lighten-1" 
  >
    <v-app-bar-nav-icon @click="toggleSideMenu"></v-app-bar-nav-icon>
    <v-toolbar-title>CUSTOMER MANAGEMENT</v-toolbar-title>
    <v-spacer></v-spacer>
  </v-app-bar>
</template>
<script>
import { mapActions } from 'vuex'
  export default {
    data() {
      return {
        
      }
    },
    methods: {
      ...mapActions(['toggleSideMenu'])
    }
  }
</script>

<style lang="scss" scoped>
a {
  text-decoration: none;
}
</style>