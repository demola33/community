import 'package:community/domain/models/story.dart';
import 'package:get/get.dart';

class StoryDetailsController extends GetxController {
  // late Story? story;
  late int? index;

  @override
  void onInit() {
    getStory();

    super.onInit();
  }

  void getStory() {
    // final storyModel = Get.arguments;
    final storyIndex = Get.arguments;

    if (storyIndex != null) {
      index = storyIndex;
    }
  }
}
