<template>
  <!-- Don't drop "q-app" class -->
  <div id="q-app">
    <main-layout>
    </main-layout>
  </div>
</template>

<script>
/*
 * Root component
 */
import MainLayout from './layouts/Main'

export default {
  components: {
    MainLayout
  },

  data () {
    return {
    }
  }
}
</script>
