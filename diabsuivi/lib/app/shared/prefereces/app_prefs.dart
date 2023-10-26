import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppPrefs {
  static AppPrefs get to => Get.find<AppPrefs>();
  final token = ReadWriteValue('user_token', '');
  final isFirstTime = ReadWriteValue('is_first_time', true);
  final isUserLogged = ReadWriteValue('is_user_logged', false);
  final deviceIfon = ReadWriteValue('device_info', '');

  AppPrefs() {
    _initData();
  }

  void _initData() async {
    await GetStorage.init();
    _deviceInfo();
  }

  Future<void> _deviceInfo() async {
    if (deviceIfon.val.isEmpty) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (GetPlatform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceIfon.val =
            '${androidInfo.model}-${androidInfo.brand}-${androidInfo.id}';
      } else if (GetPlatform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceIfon.val =
            '${iosInfo.model}-${iosInfo.name}-${iosInfo.identifierForVendor}';
      }
    }
  }
}
