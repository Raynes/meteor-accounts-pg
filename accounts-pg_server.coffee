pg = Npm.require 'pg'

connectSync = Meteor.wrapAsync pg.connect, pg

checkAuth = (user, pass) ->
  url = Meteor.settings.PG.url
  connectionString = "postgres://#{user}:#{pass}@#{url}"
  try
    connectSync connectionString
    true
  catch e
    false

Meteor.server.publish null, ->
  if this.userId
    Meteor.users.find _id: this.userId

Accounts.registerLoginHandler 'pg', (options) ->
  username = options.pgUser
  password = options.pgPassword
  if username and password
    if checkAuth(username, password)
      Meteor.users.upsert user: username,
        $set:
          user: username
      newUser = Meteor.users.findOne user: username
      userId: newUser._id
    else
      throw new Meteor.Error(403, "PG auth failed!")
