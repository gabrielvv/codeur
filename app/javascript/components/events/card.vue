<template>
  <div class="event-card">
    <h3 v-bind:class="{ soon: isWithinNextXDays(event.date, 10) }">{{event.name}}</h3>
    <div class="event-date--container">
      <span class="event-date">{{event.date}}</span>
    </div>
    <div class="event-description">{{event.description}}</div>
    <div class="event-email">{{event.email}}</div>
  </div>
</template>

<script>
import { isWithinNextXDays } from "../../utils";

export default {
  props: ["event"],
  methods: {
    isWithinNextXDays
  }
};
</script>

<style scoped>
h3 {
  margin-top: 0;
}

.soon {
  color: var(--color-textlink);
}

.event-description {
  margin-bottom: 1em;
  overflow: hidden;
  height: 150px;
}

.event-date--container {
  position: absolute;
  top: 25px;
  left: -30px;
}
.event-date {
  position: relative;
  text-orientation: upright;
  writing-mode: vertical-rl;
}

.event-date::before {
  content: "";
  position: absolute;
  height: 1.6rem;
  width: 2px;
  background: #000;
  left: 9px;
  top: -30px;
}

.event-card {
  flex: 1;
  display: inline-block;
  margin-right: 2rem;
  margin-left: 2rem;
  margin-bottom: 5rem;
  padding: 1rem;
  border: solid #2f3238 5px;
  position: relative;
  height: 240px;
  min-width: 200px;
}

.event-email {
  position: absolute;
  font-size: small;
  font-style: italic;
  bottom: -30px;
  left: 0;
}
</style>