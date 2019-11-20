<template>
  <div class="input input--chisato" v-bind:class="{ 'input--filled': focus }">
    <slot name="input"></slot>
    <label class="input__label input__label--chisato" for="name">
      <span class="input__label-content input__label-content--chisato">
        <slot name="name"></slot>
      </span>
    </label>
  </div>
</template>

<script>
export default {
  data() {
    return {
      focus: false
    };
  },
  mounted() {
    const input = this.$el.getElementsByClassName("input__field")[0];
    input.addEventListener("focus", () => (this.focus = true));
    input.addEventListener("blur", () => (this.focus = false));
  }
};
</script>

<style scoped>
.input__label {
  display: block;
  position: absolute;
  top: 0;
}

.input__field:focus + .input__label {
  color: var(--color-textlink);
}

.input__field[required] + .input__label::after {
  content: '*';
}

.input {
  margin-bottom: 20px;
  padding-top: 25px;
  position: relative;
}

input {
  width: 240px;
}

.input__field {
  font-size: 1em;
  outline: none;
  border: solid;
  padding: 0.5rem;
}

.input__field:focus {
  border-color: var(--color-textlink);
  color: var(--color-textlink);
}

textarea {
  resize: none;
}
</style>