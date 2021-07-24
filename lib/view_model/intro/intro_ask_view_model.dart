import 'package:get/get.dart';
import 'package:isomanbangkit/data/provider/user_provider.dart';
import 'package:isomanbangkit/data/repository/user_repository.dart';

class IntroAskViewModel extends GetxController {
  late UserRepository userRepository;
  IntroAskViewModel() {
    userRepository = UserRepository(provider: UserProvider());
  }

  Future saveUserData() async {
    await userRepository.addUser("Nahl", 18);
  }
}
