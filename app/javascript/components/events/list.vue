<template>
  <div class="events container">
    <div v-if="loading" class="loading">
      <grid-loader :loading="loading" color="black" size="10px"></grid-loader>
    </div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="events && !loading" class="content">
      <EventCard v-for="event in events" v-bind:key="event.id" v-bind:event="event" />
    </div>

    <div class="footer">
      <select v-model="sortBy" name="sortBy" id="sort-by">
        <option value="date">Date</option>
        <option value="created_at">Création</option>
      </select>
      <select v-model="sortOrder" name="sortOrder" id="sort-order">
        <option value="asc">Croissant</option>
        <option value="desc">Décroissant</option>
      </select>
    </div>
  </div>
</template>

<script>
import { getEvents } from "../../api";
import EventCard from "./card";
import GridLoader from 'vue-spinner/src/GridLoader.vue'

export default {
  components: {
    EventCard,
    GridLoader
  },
  data: function() {
    return {
      sortBy: this.$route.query.sortBy || "date",
      sortOrder: this.$route.query.sortOrder || "asc",
      loading: false,
      loaderColor: 'black',
      events: null,
      error: null
    };
  },
  created() {
    this.fetchData();
  },
  watch: {
    // call again the method if the route changes
    $route: "fetchData",
    sortBy: "sort",
    sortOrder: "sort"
  },
  methods: {
    sort() {
      return this.$router.push({
        query: {
          sortBy: this.sortBy,
          sortOrder: this.sortOrder
        }
      });
    },
    fetchData() {
      this.sort = {
        by: this.$route.query.sortBy,
        order: this.$route.query.sortOrder
      };
      this.error = this.post = null;
      this.loading = true;

      // Simulate network latency
      return new Promise(resolve => setTimeout(resolve, 500))
        .then(() => getEvents({
          sort: this.sort
        }))
        .then(events => {
          this.loading = false;
          this.events = events;
        })
        .catch(err => (this.error = err.toString()));
    }
  }
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  flex: 1;
  background: var(--color-bg);
  margin: 0;
  padding: 2rem 1rem;
}

select {
  border: none;
  text-transform: uppercase;
  background-color: var(--color-bg);
}

.content {
  flex: 3;
  display: flex;
  flex-wrap: wrap;
}

.footer {
  flex: 1;
  position: absolute;
  top: -2.5rem;
  right: 2.8rem;
  outline: none;
}

.loading {
  display: flex;
  justify-content: center;
  margin-top: 100px;
}
</style>
