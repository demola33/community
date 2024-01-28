import 'package:get/get.dart';

import '../application.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      Application(),
      permanent: true,
    );
  }
}
