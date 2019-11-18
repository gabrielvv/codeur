<template>
  <form id="event-creation"
    @submit="checkForm">
    <p v-if="errors.length">
      <b>Please correct the following error(s):</b>
      <ul>
        <li v-for="error in errors" v-bind:key="error.msg">{{ error }}</li>
      </ul>    
    </p>

    <p>
      <label for="name">Nom</label>
      <input v-model="event.name" min="5" type="text" name="name" id="name" required/>
    </p>

    <p>
      <label for="description">Description</label>
      <textarea v-model="event.description" name="description" id="description" required/>
    </p>

    <p>
      <label for="date">Date</label>
      <input type="date" name="date" id="date" v-model="event.date" required/>
    </p>

     <p>
      <label for="email">Email</label>
      <input type="email" name="email" id="email" v-model="event.email" required/>
    </p>

    <p>
      <input
        type="submit"
        value="Submit"
      />
    </p>
  </form>
</template>

<script>
import capitalize from 'lodash/capitalize';
import { createEvent } from '../../api'

export default {
  data: function () {
    return {
      errors: [],
      event: {
        date: null,
        name: null,
        description: null,
        email: null
      }
    }
  },
  methods: {
    checkForm: function (e) {
      e.preventDefault();

      this.errors = [];

      if (this.event.name.length < 5) {
        this.errors.push(`Name is too short (minimum is 5 characters)`);
      }

      ['name', 'description', 'date', 'email'].forEach((prop) => {
        if (!this.event[prop]) {
          this.errors.push(`${capitalize(prop)} required.`);
        }
      })

      if (this.errors.length > 0) return

      return createEvent(this.event).then((result) => {
        console.log(result)
        return this.$router.push({ path: '/events' })
      })
      .catch((err) => this.errors.push(error.message))
    }
  }
}
</script>

<style scoped>
</style>
