import axios from 'axios'
import CONST from './const'
import Storage from '../storage'

function checkRequestUrl (config) {
  return config.url.indexOf(CONST.API_PATH) === 0 || config.url.indexOf(CONST.AUTH.PATH.BASE) === 0
}

axios.defaults.headers['Content-Type'] = 'application/vnd.api+json'
// axios.defaults.headers['Accept'] = 'application/json'
axios.interceptors.request.use(function (config) {
  let token = Storage.token
  if (token && checkRequestUrl(config)) {
    config.headers = Object.assign(config.headers, token)
  }
  return config
}, function (error) {
  // Do something with request error
  return Promise.reject(error)
})

// Add a response interceptor
axios.interceptors.response.use(function (response) {
  if (response.status < 400 && checkRequestUrl(response.config) && response.headers['access-token']) {
    Storage.token = response.headers
  }
  return response
}, function (error) {
  // Do something with response error
  return Promise.reject(error)
})

export default axios
