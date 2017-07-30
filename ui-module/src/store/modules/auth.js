import CONST from '../../config/const'
import Storage from '../../storage'
import Vue from 'vue'

function getPath (path) {
  return CONST.AUTH.PATH.BASE + path
}

const loginPath = getPath(CONST.AUTH.PATH.LOGIN)
const logoutPath = getPath(CONST.AUTH.PATH.LOGOUT)
const registerPath = getPath(CONST.AUTH.PATH.REGISTER)

export default {
  namespaced: true,
  state: {
    isAuthenticated: false,
    user: {
      id: null,
      uid: null,
      name: 'Guest',
      email: null
    }
  },
  mutations: {
    [CONST.MUTATION_TYPES.AUTH.AUTHENTICATED_USER] (state, payload) {
      const user = payload
      state.user.id = user.id
      state.user.uid = user.uid
      state.user.name = user.name
      state.user.email = user.email
      if (Storage.token) {
        state.isAuthenticated = true
      }
    },

    [CONST.MUTATION_TYPES.AUTH.LOGOUT] (state) {
      Storage.removeToken()
      state.user.id = null
      state.user.uid = null
      state.user.name = 'Guest'
      state.user.email = null
      state.isAuthenticated = false
    }
  },

  actions: {
    async login (context, payload) {
      let result = true
      try {
        let response = await Vue.axios.post(loginPath, {
          email: payload.email,
          password: payload.password
        })
        await context.commit(CONST.MUTATION_TYPES.AUTH.AUTHENTICATED_USER, response.data.data)
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
        await Vue.axios.delete(logoutPath)
        await commit(CONST.MUTATION_TYPES.AUTH.LOGOUT)
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
        let response = await Vue.axios.post(registerPath, {
          name: payload.name,
          email: payload.email,
          password: payload.password,
          password_confirmation: payload.password_confirmation
        })
        await context.commit(CONST.MUTATION_TYPES.AUTH.AUTHENTICATED_USER, response.data.data)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    }
  }
}
