import { LocalStorage } from 'quasar'
import CONST from '../config/const'

export default class {
  static set token (headers) {
    let token = CONST.AUTH.TOKEN.HEADER.reduce(function (obj, value) {
      obj[value] = headers[value]
      return obj
    }, {})
    LocalStorage.set(CONST.AUTH.TOKEN.NAME, token)
  }

  static get token () {
    return LocalStorage.get.item(CONST.AUTH.TOKEN.NAME)
  }

  static removeToken () {
    LocalStorage.remove(CONST.AUTH.TOKEN.NAME)
  }
}
