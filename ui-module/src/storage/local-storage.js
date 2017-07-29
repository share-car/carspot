import {LocalStorage} from 'quasar'
import CONST from '../const'

export default class {
  static set token (token) {
    LocalStorage.set(CONST.AUTH.TOKEN, token)
  }

  static get token () {
    return LocalStorage.get.item(CONST.AUTH.TOKEN)
  }

  static removeToken () {
    LocalStorage.remove(CONST.AUTH.TOKEN)
  }

  static set client (client) {
    LocalStorage.set(CONST.AUTH.CLIENT, client)
  }

  static get client () {
    return LocalStorage.get.item(CONST.AUTH.CLIENT)
  }

  static removeClient () {
    LocalStorage.remove(CONST.AUTH.CLIENT)
  }
}
