import CONST from '../../const'
import Storage from '../../storage'
import Vue from 'vue'

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
    [CONST.MUTATION_TYPES.AUTH.LOGIN_SUCCESS] (state, payload) {
      const headers = payload.headers
      Storage.token = headers['access-token']
      Storage.client = headers['client']
      const user = payload.data
      state.user.id = user.id
      state.user.uid = user.uid
      state.user.name = user.name
      state.user.email = user.email
      state.isAuthenticated = true
    },

    [CONST.MUTATION_TYPES.AUTH.LOGOUT] (state, payload) {
      Storage.removeToken()
      Storage.removeClient()
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
        let response = await Vue.axios.post('/auth/sign_in', {
          email: payload.email,
          password: payload.password
        })
        await context.commit(CONST.MUTATION_TYPES.AUTH.LOGIN_SUCCESS, {data: response.data.data, headers: response.headers})
        return true
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    },

    async logout ({state, commit, rootState}) {
      await commit(CONST.MUTATION_TYPES.AUTH.LOGOUT)
      rootState.router.push('/login')
    }
  }
}
