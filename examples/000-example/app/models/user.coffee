BaseModel = require('../../../../shared/base/model')

User = BaseModel.extend

    login: (login, pw) ->
        login is 'arthur' and pw is 'pw'

module.exports = User
