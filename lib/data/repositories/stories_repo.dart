import 'package:community/data/firestore/story_firestore_service.dart';
import 'package:community/data/repositories/base_repository.dart';
import 'package:community/domain/models/story.dart';
import 'package:get/get.dart';

class StoriesRepository extends BaseRepository {
  StoriesRepository._();

  static final StoriesRepository instance = StoriesRepository._();

  var stories = <Story>[].obs;

  Stream<List<Story>> allStories() {
    return StoryFirestoreService.allStories.snapshots().map((event) {
      var list = event.docs.map((e) {
        return Story.fromSnapshot(e);
      }).toList();
      return list;
    });
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void refresh() {
    // TODO: implement refresh
  }

  // subscribeToFirebase() {
  //   return StoryFirestoreService.allStories.snapshots().listen((event) {
  //     var list = event.docs.map((e) {
  //       return Story.fromSnapshot(e);
  //     }).toList();
  //   });
  // }
}
