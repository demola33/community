import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/domain/models/story.dart';
import 'package:community/domain/services/firestore_service.dart';
import 'package:community/presentation/community/pages/story_details.dart';
import 'package:community/presentation/community/pages/timeline.dart';
import 'package:community/presentation/router.dart';
import 'package:community/utils/app_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'firebase_options.dart';
import 'presentation/community/pages/create_story.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final usersRef = FirestoreServices.userCollection;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (ctx, _) => GetMaterialApp(
          title: 'Community App',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.initialRoute,
          initialBinding: AppBindings(),
          getPages: AppRouter.getPages,
          home: const Timeline()
          // StoryDetails(
          //   story: trendingStories[3],
          // ),
          ),
    );
  }
}
