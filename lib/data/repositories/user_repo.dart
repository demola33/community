import 'package:community/data/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository._();

  static final UserRepository instance = UserRepository._();

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void refresh() {
    // TODO: implement refresh
  }
}
