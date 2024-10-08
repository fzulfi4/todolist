import 'package:get_storage/get_storage.dart';

class HelperLocalStorages {
  static final box = GetStorage();
  //change language
  static const String isSignIn = 'isLogin';
  static const String bearerToken = 'bearerToken';
  static const String channelNameStore = 'channelName';
  static const String loginEmailAuth = 'loginEmailAuth';
  static const String isDarkMode = 'isDarkMode';

  String channelName = box.read(HelperLocalStorages.channelNameStore) ?? '';
}
