<template>
<div>
  {{ name }}
  <button @click="countUp(price)">+</button>
  <button @click="countDown(price)">-</button>
  {{ count }}
</div>
  
  
</template>

<script>
export default {
  props: ["name","price"],
  data() {
    return {
      count: 0
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
  