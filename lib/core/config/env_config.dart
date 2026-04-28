enum AppEnv { dev, prod, uat }

class EnvConfig {
  final AppEnv env;
  final String baseUrl;
  final String appName;

  const EnvConfig({
    required this.env,
    required this.baseUrl,
    required this.appName,
  });

  static const dev = EnvConfig(
    env: AppEnv.dev,
    baseUrl: 'https://dev.fixcrm.app/api',
    appName: 'FixCRM Dev',
  );

  static const uat = EnvConfig(
    env: AppEnv.uat,
    baseUrl: 'http://uat.fixcrm.app/api',
    appName: 'FixCRM UAT',
  );

  static const prod = EnvConfig(
    env: AppEnv.prod,
    baseUrl: 'https://fixcrm.app/api',
    appName: 'FixCRM',
  );
}
