<template>
  <q-layout ref="layout" view="hHr LpR lFf" :right-breakpoint="1100">
    <!-- Header -->
    <q-toolbar color="primary" slot="header">
      <div class="q-toolbar-title">
        CAR SPOT
        <small class="float-right">Welcome {{user.name}}</small>
      </div>
  
      <q-tabs slot="navigation">
        <q-route-tab slot="title" icon="home" to="home" replace label="Home" />
        <template v-if="isAuthenticated">
          <q-route-tab slot="title" icon="subscriptions" to="my-requests" replace label="My Requests" />
          <q-route-tab slot="title" icon="account_circle" to="profile" replace label="Profile" />
          <q-tab slot="title" icon="exit_to_app" @select="sign_out" label="Logout" />
        </template>
        <template v-else>
          <q-route-tab slot="title" icon="input" to="login" replace label="Login" />
          <q-route-tab slot="title" icon="person_add" to="register" replace label="Register" />
        </template>
      </q-tabs>
  
      <q-search name="search" inverted icon="directions_car" color="none" v-model="search" placeholder="Search for a car" />
  
      <q-btn flat icon="more_vert"/>
    </q-toolbar>
    <div class="layout-padding">
      <router-view></router-view>
    </div>
  
    <!-- Footer -->
    <q-toolbar slot="footer" :glossy="true">
      <q-toolbar-title>
        Hata Design @Copyright
      </q-toolbar-title>
    </q-toolbar>
  </q-layout>
</template>

<script>
/*
 * Root component
 */
import {
  QLayout,
  QToolbar,
  QToolbarTitle,
  QSearch,
  QTabs,
  QTab,
  QRouteTab,
  QBtn
} from 'quasar'

import { mapState, mapActions } from 'vuex'

export default {
  components: {
    QLayout,
    QToolbar,
    QToolbarTitle,
    QSearch,
    QTabs,
    QTab,
    QRouteTab,
    QBtn
  },

  data () {
    return {
      search: ''
    }
  },

  computed: {
    ...mapState('auth', ['isAuthenticated', 'user'])
  },

  methods: {
    ...mapActions('auth', ['logout']),
    async sign_out () {
      if (await this.logout()) {
        this.$router.replace('login')
      }
    }
  }
}
</script>
