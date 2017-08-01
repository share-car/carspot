<template>
  <div class="text-center">
    <q-btn flat color="primary" icon="cloud_upload" @click="$refs.uploader.open()">
      Upload
      <q-modal minimized ref="uploader">
        <form-layout title="Uploader" styleClass="fit">
          <q-uploader :url="'/statics'" />
          <q-card-actions slot="actions" class="pull-right">
            <q-btn flat color="negative" icon="cancel" @click="$refs.uploader.close()">Cancel</q-btn>
          </q-card-actions>
        </form-layout>
      </q-modal>
    </q-btn>
  </div>
</template>

<script>
import {
  QBtn,
  QModal,
  QUploader,
  QCardActions
} from 'quasar'

import FormLayout from '../../layouts/Form'
export default {
  components: {
    FormLayout,
    QBtn,
    QModal,
    QUploader,
    QCardActions
  },
  props: {
    sourceType: {
      type: String,
      required: true
    },
    sourceId: {
      type: Number
    }
  },
  data () {
    return {}
  }
}
</script>

<style>

</style>
