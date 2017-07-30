export default {
  MUTATION_TYPES: {
    AUTH: {
      AUTHENTICATED_USER: 'authenticatedUser',
      LOGOUT: 'logout'
    }
  },
  AUTH: {
    PATH: {
      BASE: '/auth',
      LOGIN: '/sign_in',
      LOGOUT: '/sign_out',
      REGISTER: ''
    },
    TOKEN: {
      NAME: 'carspot_header',
      HEADER: ['access-token', 'client', 'uid', 'expiry', 'token-type']
    }
  }
}
