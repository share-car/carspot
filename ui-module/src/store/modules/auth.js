import CONST from '../../config/const'
import Storage from '../../storage'
import Vue from 'vue'

export default {
  namespaced: true,
  state: {
    isAuthenticated: false,
    user: {
      id: null,
      name: 'Guest',
      email: null
    }
  },
  mutations: {
    [CONST.AUTH.MUTATION_TYPES.AUTHENTICATED_USER] (state, payload) {
      const user = payload
      state.user.id = user.id
      state.user.name = user.name
      state.user.email = user.email
      if (Storage.token) {
        state.isAuthenticated = true
      }
    },

    [CONST.AUTH.MUTATION_TYPES.LOGOUT] (state) {
      Storage.removeToken()
      state.user.id = null
      state.user.name = 'Guest'
      state.user.email = null
      state.isAuthenticated = false
    }
  },

  actions: {
    async login (context, payload) {
      let result = true
      try {
        let response = await Vue.axios.post(CONST.AUTH.PATH.LOGIN, {
          email: payload.email,
          password: payload.password
        })
        await context.commit(CONST.AUTH.MUTATION_TYPES.AUTHENTICATED_USER, response.data.data)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    },

    async logout ({commit}) {
      let result = true
      try {
        await Vue.axios.delete(CONST.AUTH.PATH.LOGOUT)
        await commit(CONST.AUTH.MUTATION_TYPES.LOGOUT)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    },

    async register (context, payload) {
      let result = true
      try {
        let response = await Vue.axios.post(CONST.AUTH.PATH.REGISTER, {
          name: payload.name,
          email: payload.email,
          password: payload.password,
          password_confirmation: payload.password_confirmation
        })
        await context.commit(CONST.AUTH.MUTATION_TYPES.AUTHENTICATED_USER, response.data.data)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    }
  }
}
