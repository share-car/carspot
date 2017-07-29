export default {
  MUTATION_TYPES: {
    AUTH: {
      LOGIN_SUCCESS: 'loginSuccess',
      LOGIN_ERROR: 'loginError',
      LOGOUT: 'logout'
    }
  },
  AUTH: {
    TOKEN: 'carspot_token',
    CLIENT: 'carspot_client'
  },
  PATHS: {
    AUTH: {
      LOGIN: '/auth/sign_in',
      LOGOUT: '/auth/sign_out',
      REGISTER: '/auth'
    }
  }
}
