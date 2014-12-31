Meteor.loginWithPg = (user, pass, cb) ->
  Accounts.callLoginMethod
    methodArguments: [
      pgUser: user
      pgPassword: pass
    ]
    userCallback: (err, result) ->
      if err
        cb? and cb(err)
      else
        cb and cb()
