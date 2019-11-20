<template>
  <div class="input input--chisato" v-bind:class="{ 'input--filled': focus }">
    <label class="input__label input__label--chisato" for="name">
      <span class="input__label-content input__label-content--chisato">
        <slot name="name"></slot>
      </span>
    </label>
    <slot name="input"></slot>
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

label {
  display: block;
}

.input {
  margin-bottom: 20px;
}
</style>