import CONST from '../../config/const'
import { ProfileDeserializer, ProfileSerializer } from '../../config/json-api'
import Vue from 'vue'

export default {
  namespaced: true,
  state: {
    data: {
      id: '',
      first_name: '',
      last_name: '',
      phone: '',
      identity_card: '',
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
        if (response.data.data) {
          let profile = await ProfileDeserializer.deserialize(response.data)
          await context.commit(CONST.PROFILE.MUTATION_TYPES.UPDATE_PROFILE, profile)
        }
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
        let profile = await ProfileSerializer.serialize(payload)
        let response = await Vue.axios.put(CONST.API_PATH + CONST.PROFILE.PATH.ME, profile)
        if (response.data.data) {
          profile = await ProfileDeserializer.deserialize(response.data)
          await context.commit(CONST.PROFILE.MUTATION_TYPES.UPDATE_PROFILE, profile)
        }
      }
      catch (e) {
        console.log(e)
        result = false
      }
      return result
    }
  }
}
