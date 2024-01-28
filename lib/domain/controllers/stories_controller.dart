import 'package:community/data/repositories/stories_repo.dart';
import 'package:community/domain/models/story.dart';
import 'package:get/get.dart';

class StoriesController extends GetxController {
  static StoriesController get instance => Get.find();

  var _allStories = <Story>[].obs;
  List<Story> get allStories => _allStories;

  @override
  void onInit() {
    subscribeToStories();
    super.onInit();
  }

  subscribeToStories() {
    StoriesRepository.instance.allStories().listen((event) {
      _allStories.value = event;
    });
  }
}
