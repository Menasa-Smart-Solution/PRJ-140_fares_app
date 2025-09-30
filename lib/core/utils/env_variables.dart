import 'package:envied/envied.dart';

part 'env_variables.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String apiUrl = _Env.apiUrl;
}
