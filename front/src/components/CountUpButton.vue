<template>
<div>
  {{ name }}
  
  <v-btn @click="countUp(price)">+</v-btn>
  <v-btn @click="countDown(price)">-</v-btn>
  {{ count }}
</div>
</template>

<script>
export default {
  props: ["name","price"],
  data() {
    return {
      count: 0,
    }
  },
  methods: {
    countUp(price){
      this.count++
      this.$emit('catchCount', price)
      console.log(this.count)
    },
    countDown(price){
      this.count--
      if(this.count < 0){
        this.count = 0
        return
      }
      this.$emit('catchCount', -price)
      console.log(this.count)
    },
  }
}

</script>
  