import 'dart:async';

import 'package:diabsuivi/app/routes/app_pages.dart';
import 'package:diabsuivi/app/shared/prefereces/app_prefs.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final String appName = 'SUIVIDIABE';
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    Timer(const Duration(seconds: 3), () {
      if (AppPrefs.to.isUserLogged.val) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.AUTH);
      }
    });
  }
}
