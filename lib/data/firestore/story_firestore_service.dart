import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/utils/constants.dart';

import '../../domain/services/firestore_service.dart';

class StoryFirestoreService {
  static Query allStories =
      FirestoreServices.storyCollection.where("user", arrayContains: userId);
}
