<template>
  <div class="events container">
    <div v-if="loading" class="loading">Loading...</div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="events" class="content">
      <EventCard v-for="event in events" v-bind:key="event.id" v-bind:event="event" />
    </div>

    <div class="footer">
      <router-link v-if="sort.order === 'desc'" to="/events?sort_by=date&sort_order=asc">
        <button>Date:asc</button>
      </router-link>
      <router-link v-else to="/events?sort_by=date&sort_order=desc">
        <button>Date:desc</button>
      </router-link>
      <router-link v-if="sort.order === 'desc'" to="/events?sort_by=created_at&sort_order=asc">
        <button>Creation:asc</button>
      </router-link>
      <router-link v-else to="/events?sort_by=created_at&sort_order=desc">
        <button>Creation:desc</button>
      </router-link>
    </div>
  </div>
</template>

<script>
import { getEvents } from "../../api";
import EventCard from "./card";

export default {
  components: {
    EventCard
  },
  data: function() {
    return {
      loading: false,
      events: null,
      error: null
    };
  },
  created() {
    this.fetchData();
  },
  watch: {
    // call again the method if the route changes
    $route: "fetchData"
  },
  methods: {
    fetchData() {
      this.sort = {
        by: this.$route.query.sort_by,
        order: this.$route.query.sort_order
      };
      this.error = this.post = null;
      this.loading = true;
      // replace `getPost` with your data fetching util / API wrapper
      return getEvents({
        sort: this.sort
      })
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
  background: #fff;
  margin: 0;
  padding: 2rem;
}

.content {
  flex: 3;
  display: flex;
  flex-wrap: wrap;
}

.footer {
  flex: 1;
}
</style>
