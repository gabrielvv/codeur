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

/* .input__field--chisato:focus,
.input--filled .input__field--chisato {
  border-color: #da6484;
}

.input__field--chisato:focus + .input__label--chisato,
.input--filled .input__label--chisato {
  -webkit-animation: anim-chisato-1 0.25s forwards;
  animation: anim-chisato-1 0.25s forwards;
}

.input__field--chisato:focus
  + .input__label--chisato
  .input__label-content--chisato,
.input--filled .input__label-content--chisato {
  -webkit-animation: anim-chisato-2 0.25s forwards ease-in;
  animation: anim-chisato-2 0.25s forwards ease-in;
}

@keyframes anim-chisato-1 {
  0%,
  70% {
    -webkit-transform: translate3d(0, 3em, 0);
    transform: translate3d(0, 3em, 0);
  }
  71%,
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}

@keyframes anim-chisato-2 {
  0% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
  70%,
  71% {
    -webkit-transform: translate3d(0, 125%, 0);
    transform: translate3d(0, 125%, 0);
    opacity: 0;
    -webkit-animation-timing-function: ease-out;
  }
  100% {
    color: transparent;
    -webkit-transform: translate3d(0, 200%, 0);
    transform: translate3d(0, 200%, 0);
  }
}

.input__field {
  position: relative;
  display: block;
  float: right;
  padding: 0.8em;
  width: 60%;
  border: none;
  border-radius: 0;
  background: #f0f0f0;
  color: #aaa;
  font-weight: 400;
  -webkit-appearance: none;
}

.input__field--chisato {
  width: 100%;
  padding: 0.8em 0.5em;
  background: transparent;
  border: 2px solid;
  color: #b5b5b5;
  -webkit-transition: border-color 0.25s;
  transition: border-color 0.25s;
}

.input__label {
  display: inline-block;
  float: right;
  padding: 0 1em;
  width: 40%;
  color: #696969;
  font-weight: bold;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.input__label--chisato {
  width: 100%;
  position: absolute;
  top: -30px;
  text-align: left;
  overflow: hidden;
  padding: 0;
  pointer-events: none;
  -webkit-transform: translate3d(0, 3em, 0);
  transform: translate3d(0, 3em, 0);
}

.input__label-content {
  position: relative;
  display: block;
  padding: 1.6em 0;
  width: 100%;
}

.input__label-content--chisato {
  padding: 0 1em;
  font-weight: 400;
  color: #b5b5b5;
}

.input {
  position: relative;
  z-index: 1;
  display: inline-block;
  margin: 1em;
  max-width: 350px;
  width: calc(100% - 2em);
  vertical-align: top;
}

.input--chisato {
  padding-top: 1em;
} */
</style>