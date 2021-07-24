import 'package:get/get.dart';
import 'package:isomanbangkit/data/provider/isoman_provider.dart';
import 'package:isomanbangkit/data/repository/isoman_repository.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:sp_util/sp_util.dart';

class IntroSplashViewModel extends GetxController {
  late IsomanRepository isomanRepository;
  IntroSplashViewModel() {
    this.isomanRepository = IsomanRepository(provider: IsomanProvider());
  }
  Future<String> checkWhereToGo() async {
    await SpUtil.getInstance();
    bool isIsoman = SpUtil.getBool("is_isoman", defValue: false)!;
    if (isIsoman) {
      return RoutesName.ISOMAN_HOME;
    }
    String username = SpUtil.getString("user_name", defValue: "")!;
    if (username.isNotEmpty) {
      return RoutesName.PREVENT_HOME;
    }
    return RoutesName.INTRO_ASK;
  }
}
