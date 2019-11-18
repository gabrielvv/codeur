<template>
  <div>
    Create event
  </div>
</template>

<script>
import { createEvent } from '../../api'

export default {
  data: function () {
    return {}
  },
  methods: {
    greet: function (event) {
      axios.get('/api/events').then(console.log)
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
