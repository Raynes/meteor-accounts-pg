# accounts-pg

This is a very simple Meteor package for authenticating users with Redshift or
postgres.

## Config

You need to put your postgres/redshift url in your `settings.json`:

```json
{
  "PG": {
    "url": "db.mydb.com/dbname"
  }
}
```

## Client

You can use `Accounts.loginWithPg` to login.

```coffee
Accounts.loginWithPg user, pass, (err) ->
  if err
    console.error "Failed to login!"
```

You can logout the normal Meteor way:

```coffee
Meteor.logout()
```
