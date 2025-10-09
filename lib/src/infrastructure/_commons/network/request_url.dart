import '../../../../injection_container.dart';
import 'env_config.dart';

class RequestUrl {
  String? baseUrl = baseUrlNotifier.baseUrl;
  String get apiUrl => '${baseUrl ?? EnvManager().getBaseUrl()}/api';
  String get imageBaseUrl => baseUrl ?? '';
}
