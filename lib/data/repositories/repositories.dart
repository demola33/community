import 'package:community/data/repositories/stories_repo.dart';

import 'base_repository.dart';
import 'user_repo.dart';

final repositories = <BaseRepository>[
  StoriesRepository.instance,
  UserRepository.instance,
];
