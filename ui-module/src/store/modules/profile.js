import CONST from '../../config/const'
import { ProfileDeserializer } from '../../config/json-api'
import Vue from 'vue'

export default {
  namespaced: true,
  state: {
    data: {
      firstName: '',
      lastName: '',
      phone: null,
      identityCard: null,
      address: ''
    }
  },
  mutations: {
    [CONST.PROFILE.MUTATION_TYPES.UPDATE_PROFILE] (state, profile) {
      state.data = Object.assign(state.data, profile)
    }
  },

  actions: {
    async loadProfile (context) {
      let result = true
      try {
        let response = await Vue.axios.get(CONST.API_PATH + CONST.PROFILE.PATH.ME)
        let profile = await ProfileDeserializer.deserialize(response.data)
        await context.commit(CONST.PROFILE.MUTATION_TYPES.UPDATE_PROFILE, profile)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    },

    async updateProfile (context, payload) {
      let result = true
      try {
        let response = await Vue.axios.post(CONST.API_PATH + CONST.PROFILE.PATH.ME, payload)
        let profile = await ProfileDeserializer.deserialize(response.data)
        await context.commit(CONST.PROFILE.MUTATION_TYPES.UPDATE_PROFILE, profile)
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    }
  }
}
