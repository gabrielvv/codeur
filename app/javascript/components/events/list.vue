<template>
  <div class="events">
    <div v-if="loading" class="loading">
      Loading...
    </div>

     <div v-if="error" class="error">
      {{ error }}
    </div>

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
import { getEvents } from '../../api'
import { isWithinNextXDays } from '../../utils'

export default {
  data: function () {
    return {
      loading: false,
      events: null,
      error: null
    }
  },
  created () {
    this.fetchData()
  },
  watch: {
    // call again the method if the route changes
    '$route': 'fetchData'
  },
  methods: {
    isWithinNextXDays,
    fetchData () {
      this.error = this.post = null
      this.loading = true
      // replace `getPost` with your data fetching util / API wrapper
      return getEvents()
        .then((events) => {
          this.loading = false
          this.events = events
        })
        .catch(err => this.error = err.toString())
    }
  }
}
</script>

<style scoped>
.soon {
  color: red;
}
</style>
