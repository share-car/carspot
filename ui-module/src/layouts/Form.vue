<template>
  <div class="row justify-center content-center items-center">
    <q-card :class="styleClass">
      <q-card-title class="text-primary uppercase">
        {{title}}
      </q-card-title>
      <q-card-separator />
      <q-card-main>
        <slot>Content</slot>
      </q-card-main>
      <slot name="actions"></slot>
    </q-card>
  </div>
</template>

<script>

import {
  QCard,
  QCardTitle,
  QCardSeparator,
  QCardMain
} from 'quasar'

export default {
  components: {
    QCard,
    QCardTitle,
    QCardSeparator,
    QCardMain
  },
  props: {
    styleClass: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    }
  }
}
</script>
