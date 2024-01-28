import 'package:get/get.dart';

import 'data/repositories/repositories.dart';

class Application extends GetxController {
  Future<void> initializeApp() async {
    for (var repo in repositories) {
      repo.refresh();
    }
  }
}
