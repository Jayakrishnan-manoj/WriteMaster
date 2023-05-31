import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'gptKey',obfuscate: true)
  static final String gptKey = _Env.gptKey;
}
