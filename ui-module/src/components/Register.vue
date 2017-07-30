<template>
  <div class="row justify-center content-center items-center">
    <q-card class="col-4">
      <q-card-title>
        <div class="text-primary row justify-center">
          Register Form
        </div>
      </q-card-title>
      <q-card-main>
        <q-field icon="perm_identity" :labelWidth="1" :error="$v.user.name.$error" error-label="This field is required and min length is 4">
          <q-input v-model="user.name" type="text" float-label="Name" :clearable="true" max-length="255" @blur="$v.user.name.$touch"/>
        </q-field>
  
        <q-field icon="email" :labelWidth="1" :error="$v.user.email.$error" error-label="This field is required and must be valid email">
          <q-input v-model="user.email" type="email" float-label="Email" :clearable="true" max-length="255" @blur="$v.user.email.$touch" />
        </q-field>
  
        <q-field icon="vpn_key" :labelWidth="1" :error="$v.user.password.$error" error-label="This field is required and min length is 6">
          <q-input v-model="user.password" type="password" float-label="Password" max-length="255" @blur="$v.user.password.$touch"/>
        </q-field>
  
        <q-field icon="replay" :labelWidth="1" :error="$v.user.password_confirmation.$error" error-label="Not match with password">
          <q-input v-model="user.password_confirmation" type="password" float-label="Password Confirmation" max-length="255" @blur="$v.user.password_confirmation.$touch" />
        </q-field>
  
        <q-field icon="none" :labelWidth="1">
          <q-btn color="primary" icon="person_add" @click="register">Register</q-btn>
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

import { alert } from '../utils'

import { validationMixin } from 'vuelidate'
import { required, email, sameAs, minLength } from 'vuelidate/lib/validators'

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
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  mixins: [validationMixin],

  validations: {
    user: {
      name: { required, minLength: minLength(4) },
      email: { required, email },
      password: { required, minLength: minLength(6) },
      password_confirmation: { required, sameAsPassword: sameAs('password') }
    }
  },

  methods: {
    reset () {
      this.user.name = ''
      this.user.email = ''
      this.user.password = ''
      this.user.password_confirmation = ''
    },

    async register () {
      this.$v.user.$touch()
      if (!this.$v.user.$error) {
        let result = await this.$store.dispatch('auth/register', this.user)
        if (result) {
          alert.success('Register success', 'verified_user')
          this.$router.push('/home')
        }
        else {
          alert.error('Your email is already exited')
        }
      }
      else {
        alert.error('Your input is invalid, please check again')
      }
    }
  }
}
</script>
