import '../../../infrastructure/_commons/network/request_url.dart';

class AppConstants {
  static final String tempImageNetwork =
      'https://dev.easysmi.com/assets/images/p2.png';

  static String getImageNetworkUrl(String imageUrl) {
    return '${RequestUrl().apiUrl}/minio/storage/$imageUrl';
  }
}
