<template>
<div class="container">
  <form id="event-creation"
    @submit="checkForm">
    <p class="errors" v-if="errors.length">
      <b>Veuillez corriger les erreurs suivantes:</b>
      <ul>
        <li v-for="error in errors" v-bind:key="error.msg">{{ error }}</li>
      </ul>    
    </p>

    <CustomInput>
      <template v-slot:name>Nom</template>
      <template v-slot:input>
        <input class="input__field input__field--chisato" v-model="event.name" minlength="5" type="text" name="name" id="name" required/>
      </template>
    </CustomInput>

    <CustomInput>
      <template v-slot:name>Date</template>
      <template v-slot:input>
        <input class="input__field input__field--chisato" type="date" name="date" id="date" v-model="event.date" required/>  
      </template>
    </CustomInput>

    <CustomInput>
      <template v-slot:name>Email</template>
      <template v-slot:input>
      <input class="input__field input__field--chisato" type="email" name="email" id="email" v-model="event.email" required/>
      </template>
    </CustomInput>

    <CustomInput>
      <template v-slot:name>Description</template>
      <template v-slot:input>
        <textarea 
          class="input__field input__field--chisato" 
          v-model="event.description" 
          name="description" 
          id="description"
          rows="5"
          cols="33" 
          maxlength="300"
          required/>
      </template>
    </CustomInput>

    <p>
      <button
        type="submit"
      >Enregistrer
      </button>
    </p>
  </form>
  <div class="fill-in"></div>
</div>
</template>

<script>
import capitalize from 'lodash/capitalize';
import { createEvent } from '../../api'
import CustomInput from './custom-input'

export default {
  components: {
    CustomInput
  },
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
        return this.$router.push({ path: '/events', query: { sortBy: 'date', sortOrder: 'asc' } })
      })
      .catch((err) => this.errors.push(error.message))
    }
  }
}
</script>

<style scoped>

.container {
  display: flex;
  flex-direction: column;
  flex: 1;
}

#event-creation {
  margin: 0;
  padding: 2rem;
  flex: 1;
}

button {
  background-color: var(--color-bg);
  font-size: 1em;
  outline: none;
  border: solid;
  padding: 0.5rem;
  font-weight: bold;
  cursor: pointer;
}

button:hover {
  background-color: #000;
  color: var(--color-bg);
}

.errors li {
  list-style: none;
}
</style>
