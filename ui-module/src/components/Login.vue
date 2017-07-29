<template>
  <div class="row justify-center content-center items-center">
    <q-card class="col-4">
      <q-card-title>
        <div class="text-primary row justify-center">
          Login Form
        </div>
      </q-card-title>
      <q-card-main>
  
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
      </q-card-main>
    </q-card>
  </div>
</template>

<script>

import {
  QCard,
  QCardTitle,
  QCardMain,
  QBtn,
  QField,
  QInput
} from 'quasar'

import {alert} from '../utils'

export default {
  components: {
    QCard,
    QCardTitle,
    QCardMain,
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
