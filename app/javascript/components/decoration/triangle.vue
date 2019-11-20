<template>
  <div class="triangle" >
    <router-link class="first-event-btn" to="/events/new">
      <button>Crée ton premier évènement</button>
    </router-link>

    <router-link class="first-event-btn" to="/events/new">
      <button>Crée ton premier évènement</button>
    </router-link>

    <router-link class="first-event-btn" to="/events/new">
      <button>Crée ton premier évènement</button>
    </router-link>
    <svg height="500" width="600">
      <polygon points="300,20 20,480 580,480" style="fill:white;stroke:#eee;stroke-width:20" />Sorry, your browser does not support inline SVG.
    </svg>
  </div>
</template>

<style scoped>
.triangle {
  position: fixed;
  align-self: center;
  top: 100px;
}

.first-event-btn {
  position: fixed;
  top: 360px;
  align-self: center;
}

.first-event-btn:not(:nth-of-type(3)) button:after {
  content: "  \02192";
}

.first-event-btn:nth-of-type(3) button:before {
  content: "\02190  ";
}

.first-event-btn:nth-of-type(1) {
  transform: rotate(-59deg) translate(200px, -20px);
}
.first-event-btn:nth-of-type(2) {
  transform: rotate(59deg) translate(300px, -320px);
}
.first-event-btn:nth-of-type(3) {
  transform: translate(0px, 240px);
}

.first-event-btn button {
  background-color: var(--color-bg);
  font-size: 1em;
  outline: none;
  border: none;
  padding: 0.5rem;
  font-weight: bold;
  cursor: pointer;
}

.first-event-btn button:hover {
  background-color: #000;
  color: var(--color-bg);
}
</style>