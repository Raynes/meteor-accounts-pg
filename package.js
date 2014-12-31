Package.describe({
  name: 'raynes:accounts-pg',
  summary: 'Account adapter for logging in with Postgres/Redshift.',
  version: '0.1.0',
  git: 'https://github.com/Raynes/accounts-pg'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
  api.use('accounts-base', ['client', 'server'])
  api.use('coffeescript', ['client', 'server'])
  api.imply('accounts-base', ['client', 'server'])
  api.addFiles(['accounts-pg_server.coffee'], 'server');
  api.addFiles(['accounts-pg_client.coffee'], 'client');
});

Npm.depends({pg: "4.1.1"})
