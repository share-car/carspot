
import { Serializer as JSONAPISerializer, Deserializer as JSONAPIDeserializer } from 'jsonapi-serializer'

export const ProfileSerializer = new JSONAPISerializer('profiles', {
  id: 'id',
  attributes: ['first-name', 'last-name', 'phone', 'identity-car', 'address']
})

export const ProfileDeserializer = new JSONAPIDeserializer({ keyForAttribute: 'snake_case' })
