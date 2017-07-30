import axios from 'axios'
import Storage from '../storage'

axios.defaults.headers.post['Content-Type'] = 'application/vnd.json+api'
axios.interceptors.request.use(function (config) {
  let token = Storage.token
  if (token) {
    config.headers = Object.assign(config.headers, token)
  }
  return config
}, function (error) {
  // Do something with request error
  return Promise.reject(error)
})

// Add a response interceptor
axios.interceptors.response.use(function (response) {
  Storage.token = response.headers
  return response
}, function (error) {
  // Do something with response error
  return Promise.reject(error)
})

export default axios
