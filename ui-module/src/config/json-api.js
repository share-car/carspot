
import { Serializer as JSONAPISerializer, Deserializer as JSONAPIDeserializer } from 'jsonapi-serializer'

export const ProfileSerializer = new JSONAPISerializer('profiles', {
  attributes: ['first_name', 'last_name', 'phone', 'identity_card', 'address']
})

export const ProfileDeserializer = new JSONAPIDeserializer({ keyForAttribute: 'snake_case' })
