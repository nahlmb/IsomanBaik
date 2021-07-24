import 'package:isomanbangkit/data/model/user_model.dart';
import 'package:sp_util/sp_util.dart';

class UserProvider {
  addUser(
      {required String name, required int age, bool isIsoman = false}) async {
    await SpUtil.putString('user_name', name);
    await SpUtil.putInt('user_age', age);
    await SpUtil.putBool('is_isoman', isIsoman);
  }

  UserModel? getUser() {
    String name = SpUtil.getString("user_name", defValue: "")!;
    int usia = SpUtil.getInt("user_age", defValue: 0)!;
    bool isIsoman = SpUtil.getBool("is_isoman", defValue: false)!;
    if (name.isEmpty || usia == 0) {
      return null;
    }
    return UserModel(name: name, usia: usia, isIsoman: isIsoman);
  }

  updateUser(
      {required String name, required int age, required bool isIsoman}) async {
    await SpUtil.putString('user_name', name);
    await SpUtil.putInt('user_age', age);
    await SpUtil.putBool('is_isoman', isIsoman);
  }

  deleteUser() async {
    await SpUtil.putString('user_name', "");
    await SpUtil.putInt('user_age', 0);
    await SpUtil.putBool('is_isoman', false);
  }
}
