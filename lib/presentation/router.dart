import 'package:community/presentation/community/pages/create_story.dart';
import 'package:community/presentation/community/pages/story_details.dart';
import 'package:community/presentation/community/pages/timeline.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  static String initialRoute = Timeline.routeName;

  static List<GetPage> getPages = [
    GetPage(
      name: Timeline.routeName,
      page: () => const Timeline(),
    ),
    GetPage(
      name: StoryDetails.routeName,
      page: () => const StoryDetails(),
    ),
    GetPage(
      name: CreateStory.routeName,
      page: () => const CreateStory(),
    ),
  ];
}
