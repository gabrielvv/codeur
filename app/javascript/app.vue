<template>
  <div id="app">
    <router-link to="/home">
      <p>{{ message }}</p>
    </router-link>
    <router-view></router-view>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      message: "Gestionnaire d'évènements"
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
