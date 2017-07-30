import {
  Alert
} from 'quasar'

import 'quasar-extras/animate/fadeInDown.css'
import 'quasar-extras/animate/fadeOutRight.css'

export default class {
  static error (msg, icon = 'error') {
    this.message(msg, 'negative', icon)
  }

  static success (msg, icon = 'check') {
    this.message(msg, 'positive', icon)
  }

  static message (msg, color, icon = null, position = 'right', duration = 2000) {
    const alert = Alert.create({
      enter: 'fadeInDown',
      leave: 'fadeOutRight',
      color: color,
      icon: icon,
      html: msg,
      position: position,
      dismissible: true
    })
    setTimeout(() => {
      alert.dismiss()
    }, duration)
  }
}
