<template>
  <div id="app">

    <header>
      <h2 class="title">
        <router-link to="/home">{{ title }}</router-link>
      </h2>
      <nav class="menu">
        <router-link
          to="/events?sortBy=date&sortOrder=desc"
          class="menu__item"
          active-class="menu__item--current"
        >liste</router-link>
        <router-link to="/events/new" class="menu__item" active-class="menu__item--current">création</router-link>
      </nav>
    </header>

    <div class="content">
      <router-view></router-view>
    </div>

  </div>
</template>

<script>
export default {
  data: function() {
    return {
      title: "Gestionnaire d'évènements"
    };
  }
};
</script>

<style scoped>
#app {
  flex: 1;
  display: flex;
  flex-direction: column;
}

a {
  text-decoration: none;
  color: var(--color-link);
  outline: none;
}

.title {
  position: relative;
  padding: 2rem 0 0 2rem;
  margin: 0;
  font-size: 1.15rem;
  z-index: 1000;
  grid-area: title;
}

.menu {
  position: relative;
  text-transform: lowercase;
  padding: 1rem 2rem;
  font-size: 1.15rem;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  z-index: 1000;
  max-width: 12rem;
  grid-area: menu;
}

.menu__item {
  position: relative;
}

.menu__item::after {
  content: "";
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  height: 3px;
  background: var(--color-textlink);
  transform: scale3d(0, 1, 1);
  transition: transform 0.3s cubic-bezier(0.2, 1, 0.8, 1);
  transform-origin: 0 0;
}

.menu__item--current::after {
  transform: scale3d(1, 1, 1);
}

.content {
  flex: 1;
  position: relative;
  padding: 0;
  display: flex;
  flex-direction: column;
}
</style>
