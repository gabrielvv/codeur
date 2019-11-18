<template>
  <div class="events">
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

    <div v-if="loading" class="loading">Loading...</div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="events" class="content">
      <div v-for="event in events" v-bind:key="event.id">
        <h3 v-bind:class="{ soon: isWithinNextXDays(event.date, 10) }">{{event.name}}</h3>
        <div>{{event.date}}</div>
        <div>{{event.description}}</div>
        <div>{{event.email}}</div>
      </div>
    </div>
  </div>
</template>

<script>
import { getEvents } from "../../api";
import { isWithinNextXDays } from "../../utils";

export default {
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
    isWithinNextXDays,
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
.soon {
  color: red;
}
</style>
