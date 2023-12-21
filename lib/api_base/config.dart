import 'package:envied/envied.dart';

part 'config.g.dart';

abstract class ApiBaseConfig {
  static const hiveCacheBoxName = "hiveCacheBoxForGraphQL";
  static const authHeaderPrefix = "Bearer ";
}

@Envied(
  path: '.env',
  obfuscate: true,
  useConstantCase: true,
  requireEnvFile: true,
)
abstract class ApiBaseEnv {
  @EnviedField()
  static final String apiUrl = _ApiBaseEnv.apiUrl;
  @EnviedField()
  static final String apiKey = _ApiBaseEnv.apiKey;
}