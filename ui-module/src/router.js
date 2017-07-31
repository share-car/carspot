import Vue from 'vue'
import VueRouter from 'vue-router'
import store from './store'

Vue.use(VueRouter)

function load (component) {
  // '@' is aliased to src/components
  return () => System.import(`@/${component}.vue`)
}

const router = new VueRouter({
  /*
   * NOTE! VueRouter "history" mode DOESN'T works for Cordova builds,
   * it is only to be used only for websites.
   *
   * If you decide to go with "history" mode, please also open /config/index.js
   * and set "build.publicPath" to something other than an empty string.
   * Example: '/' instead of current ''
   *
   * If switching back to default "hash" mode, don't forget to set the
   * build publicPath back to '' so Cordova builds work again.
   */

  routes: [
    { path: '/', name: 'root', redirect: '/home' },
    { path: '/home', name: 'home', component: load('Home') },
    { path: '/login', name: 'login', component: load('Login'), meta: { auth: false } },
    { path: '/register', name: 'register', component: load('Register'), meta: { auth: false } },
    { path: '/my-requests', name: 'my-requests', component: load('My-Requests'), meta: { auth: true } },
    { path: '/profile', name: 'profile', component: load('Profile'), meta: { auth: true } },
    { path: '/403', name: '403', component: load('Error403') },
    { path: '/404', name: '404', component: load('Error404') },
    // Always leave this last one
    { path: '*', component: load('Error404') } // Not found
  ]
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.auth)) {
    // this route requires auth, check if logged in
    // if not, redirect to login page.
    let isAuthenticated = store.getters['auth/isAuthenticated']
    let auth = to.meta.auth
    if (isAuthenticated !== auth) {
      if (isAuthenticated) {
        next('403') // Access denied
      }
      else {
        next({
          name: 'login',
          query: { redirect: to.fullPath }
        })
      }
    }
    else {
      next()
    }
  }
  else {
    next()
  }
})

export default router
