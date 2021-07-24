import 'package:isomanbangkit/data/model/user_model.dart';
import 'package:isomanbangkit/data/provider/user_provider.dart';

class UserRepository {
  UserProvider provider;
  UserRepository({required this.provider});

  Future<UserModel?> getUser() {
    return provider.getUser();
  }

  addUser(String name, int age) {
    return provider.addUser(name: name, age: age);
  }

  updateUser(String name, int age, bool isIsoman) {
    return provider.updateUser(name: name, age: age, isIsoman: isIsoman);
  }

  deleteUser() {
    return provider.deleteUser();
  }
}
