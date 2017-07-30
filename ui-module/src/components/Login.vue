<template>
  <form-layout title="Login Form" styleClass="col-4">
    <q-field icon="email" :labelWidth="1">
      <q-input v-model="user.email" type="email" float-label="Email" :clearable="true" />
    </q-field>
  
    <q-field icon="vpn_key" :labelWidth="1">
      <q-input v-model="user.password" type="password" float-label="Password" />
    </q-field>
  
    <q-field icon="none" :labelWidth="1">
      <q-btn color="primary" icon="input" @click="login">Login</q-btn>
      <q-btn color="secondary" icon="autorenew" @click="reset">Reset</q-btn>
    </q-field>
  </form-layout>
</template>

<script>

import {
  QBtn,
  QField,
  QInput
} from 'quasar'

import { alert } from '../utils'
import FormLayout from '../layouts/Form'

export default {
  components: {
    FormLayout,
    QBtn,
    QField,
    QInput
  },

  data () {
    return {
      user: {
        email: '',
        password: ''
      }
    }
  },

  methods: {
    reset () {
      this.user.email = ''
      this.user.password = ''
    },
    async login () {
      let result = await this.$store.dispatch('auth/login', this.user)
      if (result) {
        alert.success('Login success', 'verified_user')
        this.$router.push('/home')
      }
      else {
        alert.error('Email or password is invalid')
      }
    }
  }
}
</script>
