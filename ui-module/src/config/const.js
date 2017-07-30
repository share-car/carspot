export default {
  API_PATH: '/api',
  AUTH: {
    PATH: {
      BASE: '/auth',
      LOGIN: '/auth/sign_in',
      LOGOUT: '/auth/sign_out',
      REGISTER: '/auth'
    },
    MUTATION_TYPES: {
      AUTHENTICATED_USER: 'authenticatedUser',
      LOGOUT: 'logout'
    },
    TOKEN: {
      NAME: 'carspot_header',
      HEADER: ['access-token', 'client', 'uid', 'expiry', 'token-type']
    }
  },
  PROFILE: {
    PATH: {
      BASE: '/profiles',
      ME: '/profiles/me'
    },
    MUTATION_TYPES: {
      UPDATE_PROFILE: 'updateProfile'
    }
  }
}
