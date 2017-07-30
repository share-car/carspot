<template>
  <form-layout title="Profile" styleClass="col-8">
    <q-list separator>
      <q-collapsible icon="contacts" opened label="Contacts">
        <div class="row xs-gutter">
          <q-field class="col-6">
            <q-input v-model="profile.first_name" type="text" float-label="First name" :clearable="true" max-length="255" />
          </q-field>
          <q-field class="col-6">
            <q-input v-model="profile.last_name" type="text" float-label="Last name" :clearable="true" max-length="255" />
          </q-field>
        </div>
        <div class="row xs-gutter">
          <q-field class="col-6">
            <q-input v-model="profile.phone" type="number" float-label="Phone" :clearable="true" max-length="255" />
          </q-field>
          <q-field class="col-6">
            <q-input v-model="profile.identity_card" type="text" float-label="Identity Card" :clearable="true" max-length="255" />
          </q-field>
        </div>
        <q-field>
          <q-input v-model="profile.address" type="text" float-label="Address" :clearable="true" max-length="255" />
        </q-field>
  
        <q-field>
          <q-btn flat color="primary" icon="check_circle" @click="submit">Submit</q-btn>
          <q-btn flat color="secondary" icon="cancel" @click="cancel">Cancel</q-btn>
        </q-field>
      </q-collapsible>
      <q-collapsible icon="account_circle" opened label="Account">
        <div class="row xs-gutter">
          <q-field class="col-6" icon="perm_identity" :labelWidth="1">
            <q-input :value="user.name" type="text" float-label="Name" max-length="255" :disable="true" />
          </q-field>
          <q-field class="col-6" icon="email" :labelWidth="1">
            <q-input :value="user.email" type="email" float-label="Email" max-length="255" :disable="true" />
          </q-field>
        </div>
        <div class="row xs-gutter">
          <q-field class="col-6" icon="vpn_key" :labelWidth="1">
            <q-input v-model="form.password" type="password" float-label="Password" max-length="255" />
          </q-field>
          <q-field class="col-6" icon="replay" :labelWidth="1">
            <q-input v-model="form.password_confirmation" type="password" float-label="Password Confirmation" max-length="255" />
          </q-field>
        </div>
        <q-field>
          <q-btn flat color="primary" icon="update" @click="changePassword">Change Password</q-btn>
        </q-field>
      </q-collapsible>
    </q-list>
  </form-layout>
</template>

<script>

import {
  QBtn,
  QField,
  QInput,
  QList,
  QCollapsible
} from 'quasar'

import FormLayout from '../layouts/Form'
import { mapState, mapActions } from 'vuex'

export default {
  components: {
    FormLayout,
    QBtn,
    QField,
    QInput,
    QList,
    QCollapsible
  },

  data () {
    return {
      profile: {
        first_name: '',
        last_name: '',
        address: '',
        phone: '',
        identity_card: ''
      },
      form: {
        password: '',
        password_confirmation: ''
      }
    }
  },

  computed: {
    ...mapState('auth', ['user'])
  },

  async created () {
    if (await this.loadProfile()) {
      this.profile = Object.assign(this.profile, this.$store.state.profile.data)
    }
  },

  methods: {
    ...mapActions('profile', ['loadProfile']),

    cancel () {
      this.loadData()
    },

    submit () {
    },

    changePassword () {
    }
  }
}
</script>
