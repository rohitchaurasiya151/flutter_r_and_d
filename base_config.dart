void main(List<String> args) {
  Environment env = Environment();
  Environment env2 = Environment();

  print(env == env2);
  BaseConfig baseConfig = env._getConfig(Environment.qa);
  print(baseConfig.apiHost);
}

abstract class BaseConfig {
  String get apiHost;

  String get apiHttpsHost;

  String get wireDashAppId;

  String get wireDashSecret;
}

class DevConfig implements BaseConfig {
  @override
  String get apiHost => ConstString.devBaseUrl;

  @override
  String get apiHttpsHost => "https://${ConstString.devBaseUrl}";

  @override
  String get wireDashAppId => "ketshop-app-dr29bkf";

  @override
  String get wireDashSecret =>
      "1gbz7pl43ouneujz6rk4260tned5730ercspkvtswq94m50p";
}

class ConstString {
  static const devBaseUrl = "devBaseUrl";
  static const qaBaseUrl = "qaBaseUrl";
  static const prodBaseUrl = "prodBaseUrl";
}

class StagingConfig implements BaseConfig {
  @override
  String get apiHost => ConstString.qaBaseUrl;

  @override
  String get apiHttpsHost => "https://${ConstString.qaBaseUrl}";

  @override
  String get wireDashAppId => "ketshop-app-dr29bkf";

  @override
  String get wireDashSecret =>
      "1gbz7pl43ouneujz6rk4260tned5730ercspkvtswq94m50p";
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => ConstString.prodBaseUrl;

  @override
  String get apiHttpsHost => "https://${ConstString.prodBaseUrl}";

  @override
  String get wireDashAppId => "ketshop-app-prod-pwxwxao";

  @override
  String get wireDashSecret => "gQ-IO6s_SB7r3q4bbo611IofRhqFpVoP";
}

class Environment {
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static const String dev = 'DEV';
  static const String qa = 'STAGE';
  static const String prod = 'PROD';

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.dev:
        return DevConfig();
      case Environment.qa:
        return StagingConfig();
      case Environment.prod:
        return ProdConfig();
      default:
        return DevConfig();
    }
  }
}
