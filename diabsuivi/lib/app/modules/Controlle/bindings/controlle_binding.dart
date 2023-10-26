import 'package:get/get.dart';

import '../controllers/controlle_controller.dart';

class ControlleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControlleController>(
      () => ControlleController(),
    );
  }
}
