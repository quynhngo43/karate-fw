function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://api.realworld.io/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'vihoang4345@fakegmail.com'
    config.userPassword = '12345678'
  }
  else if (env == 'qa') {
    config.userEmail = ''
    config.userPassword = ''
  }

  var token = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure("headers", {Authorization: 'Token '+token})
  karate.configure('continueOnStepFailure', true);
  karate.set("username", "vihoang4345")

  return config;
}